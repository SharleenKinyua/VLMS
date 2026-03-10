import os
from datetime import timedelta
from dotenv import load_dotenv

load_dotenv()


class Config:
    """Base configuration."""
    SECRET_KEY = os.getenv('SECRET_KEY', 'aura-edu-secret-key-change-in-production')

    # MySQL via XAMPP (default: root with no password)
    SQLALCHEMY_DATABASE_URI = os.getenv(
        'DATABASE_URL',
        'mysql://root:@localhost/aura_edu'
    )
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # JWT
    JWT_SECRET_KEY = os.getenv('JWT_SECRET_KEY', 'jwt-secret-change-in-production')
    JWT_ACCESS_TOKEN_EXPIRES = timedelta(hours=2)
    JWT_REFRESH_TOKEN_EXPIRES = timedelta(days=30)
    JWT_TOKEN_LOCATION = ['cookies', 'headers']
    JWT_COOKIE_CSRF_PROTECT = False  # Enable in production with HTTPS

    # Upload settings
    UPLOAD_FOLDER = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'uploads')
    MAX_CONTENT_LENGTH = 50 * 1024 * 1024  # 50 MB

    # Proctoring
    PROCTORING_RISK_THRESHOLD = 100
    SCREENSHOT_FOLDER = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'screenshots')

    # AI Model paths
    AI_MODELS_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'ai_models')


class DevelopmentConfig(Config):
    DEBUG = True


class ProductionConfig(Config):
    DEBUG = False
    JWT_COOKIE_CSRF_PROTECT = True


config_by_name = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
}
