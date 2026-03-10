# VLMS (Virtual Learning Management System) — Setup Guide

This guide will walk you through everything you need to install and configure to run this project on your PC.

---

## Prerequisites

Make sure the following software is installed on your machine before proceeding.

### 1. Python 3.11 or higher

- Download from: https://www.python.org/downloads/
- During installation, **check "Add Python to PATH"**.
- Verify after install:
  ```
  python --version
  ```

### 2. XAMPP (for MySQL)

- Download from: https://www.apachefriends.org/download.html
- Install and open the **XAMPP Control Panel**.
- Start **Apache** and **MySQL** services.
- XAMPP provides MySQL on `localhost:3306` with default user `root` and no password.

### 3. Git

- Download from: https://git-scm.com/downloads
- Verify after install:
  ```
  git --version
  ```

### 4. Microsoft Visual C++ Build Tools (Windows only — required for `mysqlclient`)

- Download "Build Tools for Visual Studio" from: https://visualstudio.microsoft.com/visual-cpp-build-tools/
- In the installer, select **"Desktop development with C++"**.
- This is needed to compile the `mysqlclient` Python package.

### 5. Ollama (Optional — for AI features)

- Download from: https://ollama.com/download
- After installing, pull a model:
  ```
  ollama pull llama2
  ```
- The app will still run without Ollama, but AI features (quiz generation, summarization, etc.) will not work.

---

## Project Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/luke8089/VLMS.git
cd VLMS
```

### Step 2: Create a Virtual Environment

```bash
python -m venv .venv
```

Activate it:

- **Windows (PowerShell):**
  ```
  .\.venv\Scripts\Activate.ps1
  ```
- **Windows (Command Prompt):**
  ```
  .\.venv\Scripts\activate.bat
  ```
- **macOS / Linux:**
  ```
  source .venv/bin/activate
  ```

### Step 3: Install Python Dependencies

```bash
pip install -r requirements.txt
```

> **Note:** If `mysqlclient` fails to install on Windows, make sure you have the Visual C++ Build Tools installed (see Prerequisites step 4). Alternatively, you can install the prebuilt wheel:
> ```
> pip install mysqlclient
> ```
> Or use PyMySQL as a drop-in replacement by installing it (`pip install pymysql`) and changing the `DATABASE_URL` in `.env` from `mysql://` to `mysql+pymysql://`.

### Step 4: Create the MySQL Database

1. Open your browser and go to **http://localhost/phpmyadmin**
2. Click **"New"** on the left sidebar.
3. Enter database name: **`aura_edu`**
4. Set collation to: **`utf8mb4_general_ci`**
5. Click **"Create"**.

Or via the MySQL command line:
```sql
CREATE DATABASE aura_edu CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

### Step 5: Configure Environment Variables

Create a file named `.env` in the project root with the following content:

```env
SECRET_KEY=aura-edu-change-this-in-production
JWT_SECRET_KEY=jwt-secret-change-this-in-production
DATABASE_URL=mysql://root:@localhost/aura_edu
FLASK_ENV=development
```

> If your MySQL has a password, update the `DATABASE_URL` accordingly:
> ```
> DATABASE_URL=mysql://root:YOUR_PASSWORD@localhost/aura_edu
> ```

### Step 6: Run the Application

```bash
python app.py
```

The app will:
- Automatically create all database tables.
- Seed a default admin account.
- Start on **http://localhost:5000**

---

## Default Login Credentials

| Role    | Email                | Password   |
|---------|----------------------|------------|
| Admin   | admin@aura-edu.com   | admin123   |

---

## Project Structure

```
VLMS/
├── app.py                  # Application entry point
├── config.py               # Configuration settings
├── requirements.txt        # Python dependencies
├── .env                    # Environment variables (create this)
├── ai_modules/             # AI features (quiz gen, grading, proctoring)
├── database/               # Database models and initialization
├── routes/                 # API route handlers
├── services/               # Business logic services
├── static/                 # Static files (JS, images)
├── templates/              # HTML templates
├── uploads/                # Uploaded course materials
├── screenshots/            # Exam proctoring screenshots
└── utils/                  # Helper utilities
```

---

## Troubleshooting

### `ModuleNotFoundError: No module named 'MySQLdb'`
- Make sure you have `mysqlclient` installed: `pip install mysqlclient`
- If it fails to compile, install Visual C++ Build Tools, or switch to PyMySQL:
  ```
  pip install pymysql
  ```
  Then change `DATABASE_URL` in `.env` to: `mysql+pymysql://root:@localhost/aura_edu`

### `Access denied for user 'root'@'localhost'`
- Verify MySQL is running in XAMPP.
- Check your MySQL root password and update `.env` accordingly.

### `Can't connect to MySQL server on 'localhost'`
- Open XAMPP Control Panel and make sure **MySQL** is started.

### Virtual environment not activating (PowerShell)
- Run this command first:
  ```
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```
  Then try activating again.

### `sqlalchemy` import errors with Python 3.13+
- Upgrade SQLAlchemy: `pip install --upgrade sqlalchemy`

---

## Tech Stack

- **Backend:** Flask (Python)
- **Database:** MySQL (via XAMPP)
- **ORM:** SQLAlchemy / Flask-SQLAlchemy
- **Auth:** JWT (Flask-JWT-Extended)
- **AI:** Ollama (local LLM), OpenCV, scikit-learn, PyTorch
- **Frontend:** HTML/CSS/JS (Jinja2 templates)
