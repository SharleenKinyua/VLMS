from database.models import db


def init_database(app):
    """Initialize the database and create all tables."""
    with app.app_context():
        db.create_all()
        print("[AURA-EDU] Database tables created successfully.")
        _seed_admin(app)


def _seed_admin(app):
    """Create a default admin user if none exists."""
    from database.models import User
    import bcrypt

    with app.app_context():
        admin = User.query.filter_by(role='admin').first()
        if not admin:
            hashed = bcrypt.hashpw('admin123'.encode('utf-8'), bcrypt.gensalt())
            admin = User(
                email='admin@aura-edu.com',
                password_hash=hashed.decode('utf-8'),
                first_name='System',
                last_name='Admin',
                role='admin',
                is_active=True,
            )
            db.session.add(admin)
            db.session.commit()
            print("[AURA-EDU] Default admin created: admin@aura-edu.com / admin123")
