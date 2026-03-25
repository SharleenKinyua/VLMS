from flask import Blueprint, render_template, request
from flask_jwt_extended import jwt_required
from utils.security import role_required

admin_bp = Blueprint('admin', __name__)


@admin_bp.route('/admin/dashboard')
@jwt_required()
@role_required('admin')
def dashboard():
    active_page = request.args.get('view', 'overview')
    return render_template('admin_panel.html', admin_active_page=active_page)
