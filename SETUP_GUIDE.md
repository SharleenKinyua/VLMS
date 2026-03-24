# VLMS (Virtual Learning Management System) — Complete Setup Guide (New Laptop)

This guide is a full, start-to-finish setup for running this project on a **new laptop**.
Follow each step in order. No steps are optional unless marked as optional.

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
     ollama pull llama3.2:1b
     ```
   - `mistral` or `llama3.2:3b` also works (slower but higher quality):
     ```powershell
     ollama pull mistral
     ```

6. **Tesseract OCR** (recommended for scanned PDFs)
   - Required to summarize image-based PDFs.
   - Install via winget:
     ```powershell
     winget install --id UB-Mannheim.TesseractOCR -e
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
- If PDF summarization fails on scanned files, ensure Tesseract is installed (step 1.6).

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
FLASK_DEBUG=1
OLLAMA_MODEL=llama3.2:1b
OLLAMA_TIMEOUT=15
OCR_MAX_PAGES=5
OCR_SCALE=1.5
TESSERACT_CMD=C:\\Program Files\\Tesseract-OCR\\tesseract.exe
```

If MySQL `root` has a password:

```env
DATABASE_URL=mysql://root:YOUR_PASSWORD@localhost/aura_edu
```

---

## 7) Initialize or Migrate Database (Only If Needed)

If you are reusing an **old existing** `aura_edu` database (from older project versions), run:

```powershell
python _migrate.py
```

For a brand-new database, you can skip this step.

---

## 8) Run the App

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

## 9) Default Admin Login (First Run)

The app seeds this admin user automatically:

| Role  | Email                | Password |
|-------|----------------------|----------|
| Admin | admin@mindstack.com  | admin123 |

Change credentials after first login for security.

---

## 10) Optional AI Setup (Ollama Features)

AI-powered summarization/question generation will use Ollama if available.

1. Start Ollama app/service.
2. Confirm Ollama endpoint is available (`http://localhost:11434`).
3. Ensure at least one model is pulled (recommended: `llama3.2:1b` for speed).

If Ollama is not available, the app still runs; AI features fall back or become limited.

### OCR Notes (Scanned PDFs)
- For image-based PDFs, OCR is required to extract text.
- Tesseract path is set via `TESSERACT_CMD` (defaults to `C:\Program Files\Tesseract-OCR\tesseract.exe`).
- You can tune OCR performance using:
  - `OCR_MAX_PAGES` (default 5)
  - `OCR_SCALE` (default 1.5)

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
  ollama pull llama3.2:1b
  ```

### G) OCR not working on scanned PDFs
- Ensure Tesseract is installed and `TESSERACT_CMD` points to the correct path.
- Confirm `pytesseract` is installed via `pip install -r requirements.txt`.

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
- [ ] AI summary works on a text-based PDF (optional)
- [ ] OCR works on a scanned PDF (optional)

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