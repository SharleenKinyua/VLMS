from database.models import db, User
from utils.security import hash_password, check_password
from flask_jwt_extended import create_access_token, create_refresh_token
import re


class AuthenticationService:
    """Handles user registration, login, and token management."""

    @staticmethod
    def register(email, password, first_name, last_name, role='student'):
        """Register a new user."""
        # Validate email format
        if not re.match(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', email):
            return None, 'Invalid email format.'

        # Check password strength
        if len(password) < 8:
            return None, 'Password must be at least 8 characters.'

        # Check if user exists
        if User.query.filter_by(email=email).first():
            return None, 'Email already registered.'

        # Validate role
        if role not in ('admin', 'lecturer', 'student'):
            return None, 'Invalid role.'

        user = User(
            email=email,
            password_hash=hash_password(password),
            first_name=first_name,
            last_name=last_name,
            role=role,
        )
        db.session.add(user)
        db.session.commit()
        return user, None

    @staticmethod
    def login(email, password):
        """Authenticate user and return tokens."""
        user = User.query.filter_by(email=email, is_active=True).first()
        if not user or not check_password(password, user.password_hash):
            return None, 'Invalid email or password.'

        claims = {'email': user.email, 'role': user.role}
        access_token = create_access_token(identity=str(user.id), additional_claims=claims)
        refresh_token = create_refresh_token(identity=str(user.id), additional_claims=claims)

        return {
            'access_token': access_token,
            'refresh_token': refresh_token,
            'user': user.to_dict(),
        }, None

    @staticmethod
    def get_user_by_id(user_id):
        """Get user by ID."""
        return User.query.get(user_id)

    @staticmethod
    def update_profile(user_id, **kwargs):
        """Update user profile fields."""
        user = User.query.get(user_id)
        if not user:
            return None, 'User not found.'

        allowed = ['first_name', 'last_name', 'profile_image', 'phone_number', 'bio', 'share_contact']
        for key, value in kwargs.items():
            if key in allowed and value is not None:
                setattr(user, key, value)

        db.session.commit()
        return user, None

    @staticmethod
    def change_password(user_id, old_password, new_password):
        """Change user password."""
        user = User.query.get(user_id)
        if not user:
            return False, 'User not found.'
        if not check_password(old_password, user.password_hash):
            return False, 'Current password is incorrect.'
        if len(new_password) < 8:
            return False, 'New password must be at least 8 characters.'

        user.password_hash = hash_password(new_password)
        db.session.commit()
        return True, None
