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

conn.commit()
cursor.close()
conn.close()
print("Migration complete")
