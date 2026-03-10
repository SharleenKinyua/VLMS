import bcrypt
from functools import wraps
from flask import jsonify
from flask_jwt_extended import get_jwt_identity, get_jwt, verify_jwt_in_request


def hash_password(password: str) -> str:
    """Hash a plaintext password using bcrypt."""
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')


def check_password(password: str, password_hash: str) -> bool:
    """Verify a plaintext password against a bcrypt hash."""
    return bcrypt.checkpw(password.encode('utf-8'), password_hash.encode('utf-8'))


def get_identity():
    """Get current user identity from JWT as a dict."""
    user_id = get_jwt_identity()
    claims = get_jwt()
    return {
        'id': int(user_id),
        'email': claims.get('email', ''),
        'role': claims.get('role', ''),
    }


def role_required(*roles):
    """Decorator to restrict access to specific user roles."""
    def decorator(fn):
        @wraps(fn)
        def wrapper(*args, **kwargs):
            verify_jwt_in_request()
            identity = get_identity()
            if identity.get('role') not in roles:
                return jsonify({'error': 'Access denied. Insufficient permissions.'}), 403
            return fn(*args, **kwargs)
        return wrapper
    return decorator
