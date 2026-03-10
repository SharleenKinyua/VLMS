import os
import uuid
from datetime import datetime
from werkzeug.utils import secure_filename

ALLOWED_EXTENSIONS = {
    'pdf': {'pdf'},
    'video': {'mp4', 'avi', 'mkv', 'mov', 'webm'},
    'slide': {'pptx', 'ppt', 'key'},
    'document': {'docx', 'doc', 'txt', 'md'},
    'image': {'png', 'jpg', 'jpeg', 'gif', 'webp'},
}


def allowed_file(filename, category='pdf'):
    """Check if a file extension is allowed for the given category."""
    ext = filename.rsplit('.', 1)[-1].lower() if '.' in filename else ''
    allowed = set()
    if category == 'all':
        for s in ALLOWED_EXTENSIONS.values():
            allowed |= s
    else:
        allowed = ALLOWED_EXTENSIONS.get(category, set())
    return ext in allowed


def generate_unique_filename(original_filename):
    """Generate a unique filename preserving the extension."""
    ext = original_filename.rsplit('.', 1)[-1].lower() if '.' in original_filename else 'bin'
    safe_name = secure_filename(original_filename.rsplit('.', 1)[0])
    return f"{safe_name}_{uuid.uuid4().hex[:8]}.{ext}"


def save_uploaded_file(file, upload_folder, subfolder=''):
    """Save an uploaded file and return the relative path."""
    target_dir = os.path.join(upload_folder, subfolder)
    os.makedirs(target_dir, exist_ok=True)
    filename = generate_unique_filename(file.filename)
    filepath = os.path.join(target_dir, filename)
    file.save(filepath)
    return os.path.join(subfolder, filename).replace('\\', '/')


def format_file_size(size_bytes):
    """Return human-readable file size."""
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size_bytes < 1024:
            return f"{size_bytes:.1f} {unit}"
        size_bytes /= 1024
    return f"{size_bytes:.1f} TB"


def paginate_query(query, page=1, per_page=20):
    """Paginate a SQLAlchemy query and return a dict."""
    pagination = query.paginate(page=page, per_page=per_page, error_out=False)
    return {
        'items': [item.to_dict() for item in pagination.items],
        'total': pagination.total,
        'page': pagination.page,
        'pages': pagination.pages,
        'per_page': pagination.per_page,
        'has_next': pagination.has_next,
        'has_prev': pagination.has_prev,
    }
