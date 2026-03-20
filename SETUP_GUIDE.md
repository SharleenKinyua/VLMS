# VLMS (Virtual Learning Management System) — Complete Setup Guide (New Laptop)

This guide is a full, start-to-finish setup for running this project on a **new laptop**.

---

## 1) What You Need Before Starting

Install these first:

1. **Git**
   - Download: https://git-scm.com/downloads
   - Verify:
     ```powershell
     git --version
     ```

2. **Python 3.11 (recommended)**
   - Download: https://www.python.org/downloads/
   - During install, enable **Add Python to PATH**.
   - Verify:
     ```powershell
     python --version
     ```

3. **XAMPP (MySQL)**
   - Download: https://www.apachefriends.org/download.html
   - Install and open **XAMPP Control Panel**.
   - Start **MySQL** (Apache is optional for this Flask app).

4. **Microsoft Visual C++ Build Tools** (Windows)
   - Needed for compiling `mysqlclient`.
   - Download: https://visualstudio.microsoft.com/visual-cpp-build-tools/
   - Install workload: **Desktop development with C++**.

5. **Ollama** (optional, only for AI features)
   - Download: https://ollama.com/download
   - After install, pull at least one model:
     ```powershell
     ollama pull llama3
     ```
   - `mistral` also works:
     ```powershell
     ollama pull mistral
     ```

---

## 2) Get the Project on the New Laptop

### Option A — Clone from Git

```powershell
git clone <your-repository-url>
cd lms
```

### Option B — Copy from external drive/zip

- Copy the project folder to your laptop.
- Open terminal in the project root (the folder containing `app.py`).

---

## 3) Create and Activate Virtual Environment

From the project root:

```powershell
python -m venv .venv
```

Activate it:

- **PowerShell**
  ```powershell
  .\.venv\Scripts\Activate.ps1
  ```
- **Command Prompt**
  ```bat
  .\.venv\Scripts\activate.bat
  ```

Upgrade pip (recommended):

```powershell
python -m pip install --upgrade pip
```

---

## 4) Install Python Dependencies

```powershell
pip install -r requirements.txt
```

Notes:
- First install can take time because of heavy packages (`torch`, `opencv-python`).
- If `mysqlclient` fails to build, install the Visual C++ tools from step 1.4, then retry.

---

## 5) Create the MySQL Database

Make sure **XAMPP MySQL is running**.

Create database `aura_edu`:

### Using phpMyAdmin
1. Open `http://localhost/phpmyadmin`
2. Click **New**
3. Database name: `aura_edu`
4. Collation: `utf8mb4_general_ci`
5. Click **Create**

### Or via SQL
```sql
CREATE DATABASE aura_edu CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

---

## 6) Configure Environment Variables (`.env`)

Create a file named `.env` in the project root:

```env
SECRET_KEY=change-this-secret-key
JWT_SECRET_KEY=change-this-jwt-secret
DATABASE_URL=mysql://root:@localhost/aura_edu
FLASK_ENV=development
```

If MySQL `root` has a password:

```env
DATABASE_URL=mysql://root:YOUR_PASSWORD@localhost/aura_edu
```

---

## 7) Run the App

```powershell
python app.py
```

Expected behavior on first run:
- Creates all DB tables automatically.
- Seeds default admin account if none exists.
- Starts server at `http://localhost:5000`.

Open browser:
- `http://localhost:5000`

---

## 8) Default Admin Login (First Run)

The app seeds this admin user automatically:

| Role  | Email                | Password |
|-------|----------------------|----------|
| Admin | admin@mindstack.com  | admin123 |

Change credentials after first login for security.

---

## 9) Optional AI Setup (Ollama Features)

AI-powered summarization/question generation will use Ollama if available.

1. Start Ollama app/service.
2. Confirm Ollama endpoint is available (`http://localhost:11434`).
3. Ensure at least one model is pulled (recommended: `llama3` or `mistral`).

If Ollama is not available, the app still runs; AI features fall back or become limited.

---

## 10) Optional: Migration Script for Older Databases

If you are reusing an **old existing** `aura_edu` database (from older project versions), run:

```powershell
python _migrate.py
```

For a brand-new database on a new laptop, this is usually not required.

---

## 11) Daily Run Commands

From project root each time:

```powershell
.\.venv\Scripts\Activate.ps1
python app.py
```

---

## 12) Troubleshooting

### A) PowerShell blocks venv activation
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Then reactivate:
```powershell
.\.venv\Scripts\Activate.ps1
```

### B) `ModuleNotFoundError: No module named 'MySQLdb'`
- Reinstall dependencies with venv activated:
  ```powershell
  pip install -r requirements.txt
  ```
- Ensure Visual C++ Build Tools are installed.

### C) `Access denied for user 'root'@'localhost'`
- Update `.env` `DATABASE_URL` with correct MySQL password.
- Confirm MySQL user credentials in XAMPP/phpMyAdmin.

### D) `Can't connect to MySQL server on 'localhost'`
- Start MySQL in XAMPP Control Panel.
- Check port conflicts (default MySQL: `3306`).

### E) Port 5000 already in use
- Stop the other process using port 5000, or run with a different port by editing `app.py`.

### F) AI features not working
- Ensure Ollama is running.
- Pull a model:
  ```powershell
  ollama pull llama3
  ```

---

## 13) Quick Verification Checklist

Use this to confirm setup is complete:

- [ ] `.venv` created and activated
- [ ] `pip install -r requirements.txt` succeeded
- [ ] XAMPP MySQL is running
- [ ] Database `aura_edu` exists
- [ ] `.env` exists in project root
- [ ] `python app.py` starts without errors
- [ ] Login works at `http://localhost:5000`

---

## 14) Project Root Reference

Expected key folders/files:

```
lms/
├── app.py
├── config.py
├── requirements.txt
├── _migrate.py
├── database/
├── routes/
├── services/
├── ai_modules/
├── templates/
├── static/
├── uploads/
└── screenshots/
```