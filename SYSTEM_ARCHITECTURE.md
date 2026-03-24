# VLMS System Architecture

This document describes the current architecture of the VLMS Flask application, including core modules, data model, and request flow.

---

## 1) High-Level Overview

- **Backend:** Flask application using an application factory pattern.
- **Database:** MySQL (via SQLAlchemy).
- **Auth:** JWT (cookies + headers), role-based access.
- **UI:** Server-rendered HTML templates with rich client-side JS.
- **AI Features:** Ollama integration for summarization and question generation, with OCR support for scanned PDFs.

---

## 2) Runtime Flow

1. `app.py` creates the Flask app, loads config, and registers blueprints.
2. On startup, `db_init.py` creates tables and seeds a default admin account.
3. Requests are routed to blueprint controllers in `routes/`.
4. Controllers call utilities/services and interact with `database/models.py`.
5. Templates in `templates/` render the dashboards and pages.

---

## 3) Application Modules

### 3.1 Core App
- **File:** `app.py`
- **Responsibilities:**
  - App factory and configuration binding
  - Register blueprints
  - Static upload serving (`/uploads/<path>`)
  - Database initialization

### 3.2 Configuration
- **File:** `config.py`
- **Responsibilities:**
  - Database connection and JWT settings
  - Upload folders and size limits
  - Proctoring thresholds

### 3.3 Database Models
- **File:** `database/models.py`
- **Key entities:**
  - `User`, `Course`, `Enrollment`
  - `Lecture`, `Material`, `LearningProgress`
  - `Exam`, `Question`, `Submission`, `Answer`
  - `Violation`, `UserAnalytics`, `LiveClass`

### 3.4 Blueprints (Routes)
- **Auth:** `routes/auth_routes.py`
  - Login, registration, profile, password reset
- **Student:** `routes/student_routes.py`
  - Dashboard, enrollments, materials, lectures, exams, progress
- **Lecturer:** `routes/lecturer_routes.py`
  - Courses, lectures, materials, exams, classes, grading
- **Exam Runtime:** `routes/exam_routes.py`
  - Exam interface, proctoring endpoints, violations
- **Analytics:** `routes/analytics_routes.py`
  - Student and lecturer analytics endpoints

### 3.5 Services
- **Auth Service:** `services/authentication_service.py`
- **Analytics Service:** `services/analytics_service.py`

### 3.6 Utilities
- **Security:** `utils/security.py` (JWT identity + role guards)
- **Helpers:** `utils/helpers.py` (uploads, file validation, pagination)
- **Text Extraction:** `utils/text_extractor.py` (PDF/DOCX/TXT/PPTX + OCR)

### 3.7 AI Modules
- **Summarization / LLM:** `ai_modules/ollama_service.py`
- **Assessment:** `ai_modules/assessment_ai/quiz_generator.py`
- **Proctoring:** `ai_modules/exam_proctoring/*`

---

## 4) Authentication and Roles

- JWT is stored in cookies and also returned for API usage.
- `role_required(...)` enforces role-based access at route level.
- Supported roles: `admin`, `lecturer`, `student`.

---

## 5) Data Flow by Feature

### 5.1 Course & Enrollment
- Students enroll via `/api/student/courses/<id>/enroll`.
- Lecturers manage courses via `/api/lecturer/courses`.

### 5.2 Lectures
- Lecturers create/edit lectures via `/api/lecturer/courses/<id>/lectures` and `/api/lecturer/lectures/<id>`.
- Students view lectures via `/api/student/courses/<id>/lectures`.

### 5.3 Materials
- Lecturers upload materials via `/api/lecturer/courses/<id>/materials`.
- Stored in `uploads/` with metadata in `materials` table.
- Student progress tracked in `learning_progress`.

### 5.4 Exams
- Lecturers generate exams via `/api/lecturer/courses/<id>/exams/generate`.
- Students start exams via `/api/student/exams/<id>/start` and continue in `/exam/<id>` UI.
- Submissions, answers, and grading live in `submissions` and `answers`.

### 5.5 Proctoring
- Proctoring endpoints accept webcam frames and track violations.
- Risk scores are recorded per submission, screenshots saved to `screenshots/`.

---

## 6) AI and OCR Pipeline

### 6.1 Summarization
- Extract text using `text_extractor.py`:
  - PyPDF2 -> pdfplumber -> OCR fallback
- Summarize with Ollama when available (fast model by default).
- Save AI summary in `materials.ai_summary`.

### 6.2 Exam Generation
- Combine material summaries and lecture content.
- Generate questions using Ollama LLM; fallback to rule-based generator.

---

## 7) Frontend Structure

- `templates/` contains full HTML pages and partials.
- Each dashboard (student/lecturer) is a single-page-like view with JS sections.
- `static/` contains JS and images.

---

## 8) Environment Variables

Common environment variables (see SETUP_GUIDE.md):

- `DATABASE_URL` (MySQL connection)
- `SECRET_KEY`, `JWT_SECRET_KEY`
- `OLLAMA_MODEL`, `OLLAMA_TIMEOUT`
- `OCR_MAX_PAGES`, `OCR_SCALE`, `TESSERACT_CMD`

---

## 9) File Storage

- Uploaded files stored under `uploads/`.
- Proctoring screenshots stored under `screenshots/`.
- File metadata stored in DB and linked to courses/materials.

---

## 10) Deployment Notes

- Development runs on `http://localhost:5000`.
- Production should enable HTTPS and CSRF protection.
- MySQL must be reachable from the app host.

---

## 11) Key Entry Points

- App entry: `app.py`
- Models: `database/models.py`
- Routes: `routes/*.py`
- Templates: `templates/*.html`
- AI: `ai_modules/*`
