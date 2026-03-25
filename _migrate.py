import MySQLdb

conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='aura_edu')
cursor = conn.cursor()

cursor.execute("SHOW COLUMNS FROM users")
cols = [r[0] for r in cursor.fetchall()]

if 'reset_token' not in cols:
    cursor.execute("ALTER TABLE users ADD COLUMN reset_token VARCHAR(100) NULL, ADD INDEX idx_reset_token (reset_token)")
    print("Added reset_token column")
else:
    print("reset_token already exists")

if 'reset_token_expires' not in cols:
    cursor.execute("ALTER TABLE users ADD COLUMN reset_token_expires DATETIME NULL")
    print("Added reset_token_expires column")
else:
    print("reset_token_expires already exists")

cursor.execute("SHOW COLUMNS FROM learning_progress")
lp_cols = [r[0] for r in cursor.fetchall()]

if 'has_opened' not in lp_cols:
    cursor.execute("ALTER TABLE learning_progress ADD COLUMN has_opened TINYINT(1) DEFAULT 0")
    print("Added learning_progress.has_opened column")
else:
    print("learning_progress.has_opened already exists")

if 'first_opened_at' not in lp_cols:
    cursor.execute("ALTER TABLE learning_progress ADD COLUMN first_opened_at DATETIME NULL")
    print("Added learning_progress.first_opened_at column")
else:
    print("learning_progress.first_opened_at already exists")

if 'last_page' not in lp_cols:
    cursor.execute("ALTER TABLE learning_progress ADD COLUMN last_page INT DEFAULT 0")
    print("Added learning_progress.last_page column")
else:
    print("learning_progress.last_page already exists")

if 'total_pages' not in lp_cols:
    cursor.execute("ALTER TABLE learning_progress ADD COLUMN total_pages INT DEFAULT 0")
    print("Added learning_progress.total_pages column")
else:
    print("learning_progress.total_pages already exists")

cursor.execute("SHOW COLUMNS FROM violations")
violation_cols = [r[0] for r in cursor.fetchall()]

if 'video_path' not in violation_cols:
    cursor.execute("ALTER TABLE violations ADD COLUMN video_path VARCHAR(500) NULL")
    print("Added violations.video_path column")
else:
    print("violations.video_path already exists")

if 'video_format' not in violation_cols:
    cursor.execute("ALTER TABLE violations ADD COLUMN video_format VARCHAR(50) NULL")
    print("Added violations.video_format column")
else:
    print("violations.video_format already exists")

if 'video_duration' not in violation_cols:
    cursor.execute("ALTER TABLE violations ADD COLUMN video_duration FLOAT NULL")
    print("Added violations.video_duration column")
else:
    print("violations.video_duration already exists")

conn.commit()
cursor.close()
conn.close()
print("Migration complete")
