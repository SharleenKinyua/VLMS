# MindStack — System Architecture Document

> **Version:** 1.0  
> **Date:** March 12, 2026  
> **Stack:** Flask · MySQL · SQLAlchemy · JWT · OpenCV · Ollama LLM

---

## Table of Contents

1. [High-Level Overview](#1-high-level-overview)
2. [System Architecture Diagram](#2-system-architecture-diagram)
3. [Technology Stack](#3-technology-stack)
4. [Project Structure](#4-project-structure)
5. [Database Architecture](#5-database-architecture)
6. [Authentication & Authorization](#6-authentication--authorization)
7. [API Routes Reference](#7-api-routes-reference)
8. [AI Modules](#8-ai-modules)
9. [User Workflows](#9-user-workflows)
10. [Proctoring System](#10-proctoring-system)
11. [Services Layer](#11-services-layer)
12. [Utilities](#12-utilities)
13. [Configuration](#13-configuration)

---

## 1. High-Level Overview

MindStack is an AI-powered Learning Management System (LMS) built for universities. It supports three user roles — **Admin**, **Lecturer**, and **Student** — and integrates AI across exam generation, automated grading, adaptive learning, and real-time exam proctoring.

### Core Capabilities

| Feature | Description |
|---------|-------------|
| **Course Management** | Lecturers create courses, upload materials (PDF, DOCX, PPTX), manage lectures |
| **AI Exam Generation** | Auto-generate MCQ, short answer, and essay questions from uploaded materials |
| **Automated Grading** | MCQs graded instantly; essays scored via NLP cosine similarity |
| **AI Proctoring** | Real-time webcam analysis: face verification, eye tracking, head pose, phone detection |
| **Adaptive Learning** | Bloom's taxonomy-based difficulty engine, personalized study recommendations |
| **Analytics** | Student performance, course engagement, malpractice reports, risk prediction |
| **Live Classes** | Scheduled video sessions (Zoom, Meet, Teams) with timed access control |

---

## 2. System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                          CLIENT (BROWSER)                               │
│                                                                         │
│  ┌─────────────┐  ┌──────────────┐  ┌──────────────┐  ┌────────────┐  │
│  │  Login /     │  │  Student     │  │  Lecturer    │  │  Analytics │  │
│  │  Register    │  │  Dashboard   │  │  Dashboard   │  │  Dashboard │  │
│  └──────┬──────┘  └──────┬───────┘  └──────┬───────┘  └─────┬──────┘  │
│         │                │                  │                │          │
│         └────────────────┴──────────────────┴────────────────┘          │
│                              │ REST API (JSON)                          │
│                              │ + WebCam Stream (base64)                 │
└──────────────────────────────┼──────────────────────────────────────────┘
                               ▼
┌──────────────────────────────────────────────────────────────────────────┐
│                       FLASK APPLICATION (app.py)                         │
│                                                                          │
│  ┌────────────────────────────────────────────────────────────────────┐  │
│  │                     MIDDLEWARE LAYER                               │  │
│  │   JWT Authentication · CORS · Role-Based Access · File Upload     │  │
│  └────────────────────────────────────────────────────────────────────┘  │
│                                                                          │
│  ┌─────────────────── ROUTE BLUEPRINTS ───────────────────────────────┐ │
│  │                                                                     │ │
│  │  auth_routes        student_routes       lecturer_routes            │ │
│  │  ─────────          ──────────────       ────────────────           │ │
│  │  • Register         • Courses            • Course CRUD              │ │
│  │  • Login/Logout     • Enroll             • Material Upload          │ │
│  │  • Profile/Face     • Exams              • Exam Generation          │ │
│  │  • Password Reset   • Results            • Question CRUD            │ │
│  │                     • Live Classes       • Grading                  │ │
│  │                     • Progress           • Submissions              │ │
│  │                                          • Live Classes             │ │
│  │  exam_routes                analytics_routes                        │ │
│  │  ───────────                ────────────────                        │ │
│  │  • Face Verify              • Student Overview                     │ │
│  │  • Proctor Frame            • Course Analytics                     │ │
│  │  • Tab Switch               • Malpractice Reports                  │ │
│  │  • Violations               • Engagement Metrics                   │ │
│  │                             • Performance Prediction               │ │
│  │                             • Admin Dashboard                      │ │
│  └─────────────────────────────────────────────────────────────────────┘ │
│                                                                          │
│  ┌─────────────────── SERVICE LAYER ──────────────────────────────────┐ │
│  │  AuthenticationService   ExamService        AnalyticsService       │ │
│  │  • register/login        • auto_grade       • record_event        │ │
│  │  • profile management    • risk_report      • performance stats   │ │
│  │  • password hashing      • generate_exam    • difficulty analysis │ │
│  └─────────────────────────────────────────────────────────────────────┘ │
│                                                                          │
│  ┌─────────────────── AI MODULES ─────────────────────────────────────┐ │
│  │                                                                     │ │
│  │  Assessment AI          Learning AI          Exam Proctoring        │ │
│  │  ──────────────         ────────────          ───────────────        │ │
│  │  • QuizGenerator        • Summarizer          • FaceAuthenticator   │ │
│  │  • EssayGrader          • FlashcardGen        • EyeTracker          │ │
│  │  • DifficultyEngine     • AdaptiveLearning    • HeadPoseEstimator   │ │
│  │                                                • ObjectDetector     │ │
│  │  Ollama LLM Service                           • RiskScorer          │ │
│  │  ──────────────────                                                 │ │
│  │  • summarize_text                                                   │ │
│  │  • generate_questions_llm                                           │ │
│  └─────────────────────────────────────────────────────────────────────┘ │
│                                                                          │
└──────────────────────────────┬───────────────────────────────────────────┘
                               │ SQLAlchemy ORM
                               ▼
┌──────────────────────────────────────────────────────────────────────────┐
│                       MySQL DATABASE (aura_edu)                          │
│                                                                          │
│  users · courses · enrollments · lectures · materials · exams            │
│  questions · submissions · answers · violations · user_analytics         │
│  learning_progress · live_classes                                        │
│                          13 Tables                                       │
└──────────────────────────────────────────────────────────────────────────┘
                               │
              ┌────────────────┴─────────────────┐
              ▼                                  ▼
┌──────────────────────┐           ┌──────────────────────────┐
│  Ollama LLM Server   │           │  File System             │
│  localhost:11434     │           │  uploads/ (materials)    │
│  llama3 / mistral    │           │  screenshots/ (proctor)  │
└──────────────────────┘           └──────────────────────────┘
```

---

## 3. Technology Stack

| Layer | Technology |
|-------|-----------|
| **Backend Framework** | Flask 3.x (Python) |
| **ORM** | SQLAlchemy (Flask-SQLAlchemy) |
| **Database** | MySQL with utf8mb4 |
| **Authentication** | Flask-JWT-Extended (JWT tokens in cookies + headers) |
| **Password Hashing** | Bcrypt |
| **Cross-Origin** | Flask-CORS |
| **AI / NLP** | Ollama (LLM), OpenCV (computer vision), TF-IDF (text scoring) |
| **File Processing** | PyPDF2, python-docx, python-pptx |
| **Frontend** | Jinja2 templates, Tailwind CSS, vanilla JavaScript |
| **Proctoring** | OpenCV Haar cascades (face, eye, body detection) |

---

## 4. Project Structure

```
MindStack/
├── app.py                          # Flask app factory, blueprint registration
├── config.py                       # Environment configuration (dev/prod)
├── _migrate.py                     # Database migration utility
├── requirements.txt                # Python dependencies
├── SETUP_GUIDE.md                  # Installation instructions
│
├── database/
│   ├── __init__.py                 # Exports db (SQLAlchemy instance)
│   ├── models.py                   # 13 SQLAlchemy models
│   └── db_init.py                  # Table creation + admin seeding
│
├── routes/
│   ├── auth_routes.py              # Authentication endpoints (10 routes)
│   ├── student_routes.py           # Student API (10 routes)
│   ├── lecturer_routes.py          # Lecturer API (18 routes)
│   ├── exam_routes.py              # Proctoring API (4 routes)
│   └── analytics_routes.py         # Analytics API (6 routes)
│
├── services/
│   ├── authentication_service.py   # User auth logic
│   ├── exam_service.py             # Grading + exam generation
│   └── analytics_service.py        # Event tracking + predictions
│
├── ai_modules/
│   ├── ollama_service.py           # LLM integration (Ollama)
│   ├── assessment_ai/
│   │   ├── quiz_generator.py       # Rule-based question generation
│   │   ├── essay_grader.py         # NLP-based essay/short answer grading
│   │   └── difficulty_engine.py    # Adaptive difficulty (Bloom's taxonomy)
│   ├── learning_ai/
│   │   ├── adaptive_learning.py    # Personalized recommendations
│   │   ├── flashcard_generator.py  # Auto-generate flashcards from text
│   │   └── summarizer.py           # Extractive TF-IDF summarization
│   └── exam_proctoring/
│       ├── face_auth.py            # Face registration & verification (LBP)
│       ├── eye_tracking.py         # Eye gaze direction detection
│       ├── head_pose.py            # Head yaw/pitch estimation
│       ├── object_detection.py     # Phone & person detection
│       └── risk_scoring.py         # Aggregate risk scorer
│
├── utils/
│   ├── security.py                 # Password hashing, JWT helpers, role decorator
│   ├── helpers.py                  # File utils, pagination
│   └── text_extractor.py          # PDF/DOCX/PPTX text extraction
│
├── templates/                      # Jinja2 HTML templates
│   ├── base.html                   # Base layout
│   ├── login.html                  # Login page
│   ├── register.html               # Registration page
│   ├── forgot_password.html        # Password reset
│   ├── student_panel.html          # Student SPA dashboard
│   ├── lecturer_panel.html         # Lecturer SPA dashboard
│   ├── exam_interface.html         # Proctored exam interface
│   └── analytics.html              # Analytics dashboard
│
├── static/
│   ├── js/app.js                   # Shared frontend utilities
│   └── images/                     # Static assets
│
├── uploads/                        # User-uploaded course materials
│   ├── courses/{id}/               # Per-course material storage
│   └── profiles/                   # Profile images
│
├── screenshots/                    # Proctoring violation screenshots
└── test/                           # Test suite
```

---

## 5. Database Architecture

### 5.1 Entity Relationship Diagram

```
┌──────────────────┐
│      USERS       │
│──────────────────│
│ id (PK)          │
│ email (UNIQUE)   │
│ password_hash    │
│ first_name       │
│ last_name        │
│ role (enum)      │◄─── admin | lecturer | student
│ profile_image    │
│ phone_number     │
│ bio              │
│ face_encoding    │◄─── Binary (LBP histogram for proctoring)
│ share_contact    │
│ reset_token      │
│ reset_token_exp  │
│ is_active        │
│ created_at       │
│ updated_at       │
└──────┬───────────┘
       │
       │ 1:N (as lecturer)          1:N (as student)
       ▼                             ▼
┌──────────────────┐          ┌──────────────────┐
│    COURSES       │          │  ENROLLMENTS     │
│──────────────────│          │──────────────────│
│ id (PK)          │◄─────┐  │ id (PK)          │
│ code (UNIQUE)    │      │  │ student_id (FK)  │──► users.id
│ title            │      │  │ course_id (FK)   │──► courses.id
│ description      │      │  │ enrolled_at      │
│ lecturer_id (FK) │──►   │  │ progress (0-100) │
│ category         │  U   │  │ status (enum)    │◄─── active | completed | dropped
│ is_published     │  S   │  └──────────────────┘
│ created_at       │  E   │         UNIQUE(student_id, course_id)
│ updated_at       │  R   │
└──┬───┬───┬───┬───┘  S   │
   │   │   │   │          │
   │   │   │   └──────────┼──────────────────────────────┐
   │   │   │              │                              │
   │   │   ▼              │                              ▼
   │   │ ┌──────────────────┐                 ┌──────────────────┐
   │   │ │    LECTURES      │                 │   LIVE_CLASSES   │
   │   │ │──────────────────│                 │──────────────────│
   │   │ │ id (PK)          │                 │ id (PK)          │
   │   │ │ course_id (FK)   │                 │ course_id (FK)   │
   │   │ │ title            │                 │ title            │
   │   │ │ content          │                 │ description      │
   │   │ │ order_index      │                 │ meeting_link     │
   │   │ │ duration_minutes │                 │ platform         │
   │   │ │ is_published     │                 │ scheduled_at     │
   │   │ │ created_at       │                 │ duration_minutes │
   │   │ └──────┬───────────┘                 │ is_unlocked      │
   │   │        │                             │ created_at       │
   │   │        │ 1:N                         └──────────────────┘
   │   │        ▼
   │   │ ┌──────────────────┐
   │   │ │   MATERIALS      │
   │   ▼ │──────────────────│
   │     ││ id (PK)          │
   │     ││ course_id (FK)   │──► courses.id
   │     ││ lecture_id (FK)  │──► lectures.id (nullable)
   │      │ title            │
   │      │ file_type (enum) │◄─── pdf | video | slide | document | other
   │      │ file_path        │
   │      │ file_size        │
   │      │ ai_summary       │◄─── Auto-generated by Ollama/TF-IDF
   │      │ ai_flashcards    │◄─── JSON array of {front, back}
   │      │ uploaded_at      │
   │      └──────┬───────────┘
   │             │
   │             │ 1:N
   │             ▼
   │      ┌──────────────────────┐
   │      │  LEARNING_PROGRESS   │
   │      │──────────────────────│
   │      │ id (PK)              │
   │      │ student_id (FK)      │──► users.id
   │      │ material_id (FK)     │──► materials.id
   │      │ progress_percent     │
   │      │ time_spent_seconds   │
   │      │ last_accessed        │
   │      │ completed            │
   │      └──────────────────────┘
   │          UNIQUE(student_id, material_id)
   │
   ▼
┌──────────────────┐
│     EXAMS        │
│──────────────────│
│ id (PK)          │
│ course_id (FK)   │──► courses.id
│ title            │
│ description      │
│ exam_type (enum) │◄─── quiz | midterm | final | assignment
│ duration_minutes │
│ total_marks      │
│ passing_marks    │
│ start_time       │
│ end_time         │
│ is_proctored     │
│ is_published     │
│ grades_released  │
│ shuffle_questions│
│ allow_review     │
│ risk_threshold   │◄─── Default: 100 points
│ created_at       │
└──┬───┬───────────┘
   │   │
   │   │ 1:N
   │   ▼
   │ ┌──────────────────┐
   │ │   QUESTIONS      │
   │ │──────────────────│
   │ │ id (PK)          │
   │ │ exam_id (FK)     │──► exams.id
   │ │ question_text    │
   │ │ question_type    │◄─── mcq | short_answer | essay
   │ │ options (JSON)   │◄─── MCQ choices array
   │ │ correct_answer   │
   │ │ marks            │
   │ │ difficulty (enum)│◄─── Bloom's: remember → create
   │ │ order_index      │
   │ │ explanation      │
   │ └──────┬───────────┘
   │        │
   │ 1:N    │ 1:N
   ▼        ▼
┌──────────────────┐     ┌──────────────────┐
│  SUBMISSIONS     │     │    ANSWERS       │
│──────────────────│     │──────────────────│
│ id (PK)          │     │ id (PK)          │
│ exam_id (FK)     │     │ submission_id(FK)│──► submissions.id
│ student_id (FK)  │     │ question_id (FK) │──► questions.id
│ started_at       │     │ answer_text      │
│ submitted_at     │     │ selected_option  │◄─── MCQ index
│ total_score      │     │ is_correct       │
│ is_graded        │     │ score            │
│ is_flagged       │     │ ai_feedback      │◄─── Essay grader feedback
│ risk_score       │     │ answered_at      │
│ status (enum)    │     └──────────────────┘
│ face_verified    │
└──────┬───────────┘
       │  UNIQUE(exam_id, student_id)
       │
       │ 1:N
       ▼
┌──────────────────┐          ┌──────────────────────┐
│   VIOLATIONS     │          │   USER_ANALYTICS     │
│──────────────────│          │──────────────────────│
│ id (PK)          │          │ id (PK)              │
│ submission_id(FK)│          │ user_id (FK)         │──► users.id
│ violation_type   │          │ course_id (FK)       │──► courses.id
│ severity         │          │ metric_type          │
│ description      │          │ metric_value         │
│ screenshot_path  │          │ metadata_json (JSON) │
│ timestamp        │          │ recorded_at          │
└──────────────────┘          └──────────────────────┘

Violation types:               Metric types:
• multiple_faces (40 pts)      • login
• no_face (15 pts)             • material_view
• eye_gaze (5 pts)             • quiz_attempt
• head_pose (5 pts)
• lip_movement (20 pts)
• phone_detected (50 pts)
• tab_switch (10 pts)
• background_person (40 pts)
```

### 5.2 Table Summary

| Table | Rows Model | Key Relationships |
|-------|------------|-------------------|
| `users` | User | → courses (lecturer), → enrollments (student), → submissions |
| `courses` | Course | → lectures, materials, exams, enrollments, live_classes |
| `enrollments` | Enrollment | users ↔ courses (M:N bridge) |
| `lectures` | Lecture | → materials |
| `materials` | Material | → learning_progress |
| `exams` | Exam | → questions, → submissions |
| `questions` | Question | → answers |
| `submissions` | Submission | → answers, → violations |
| `answers` | Answer | question ↔ submission |
| `violations` | Violation | → submission |
| `user_analytics` | UserAnalytics | → user, → course |
| `learning_progress` | LearningProgress | → user, → material |
| `live_classes` | LiveClass | → course |

---

## 6. Authentication & Authorization

### 6.1 Authentication Flow

```
  ┌─────────┐        POST /api/auth/login          ┌────────────┐
  │  Client  │──────── {email, password} ──────────►│   Server   │
  │          │                                      │            │
  │          │◄─── {access_token, user} ────────────│ Bcrypt     │
  │          │     + Set-Cookie: JWT                 │ Verify     │
  └─────┬────┘                                      └────────────┘
        │
        │  All subsequent requests:
        │  Authorization: Bearer <token>
        │  OR Cookie: access_token_cookie=<token>
        ▼
  ┌──────────────────────────────────────┐
  │  JWT Claims:                         │
  │  {                                   │
  │    sub: user_id,                     │
  │    email: "user@example.com",        │
  │    role: "student"|"lecturer"|"admin" │
  │  }                                   │
  │                                      │
  │  Expires: 2 hours                    │
  └──────────────────────────────────────┘
```

### 6.2 Role-Based Access Control

| Role | Accessible Routes | Capabilities |
|------|------------------|-------------|
| **Student** | `/student/*`, `/exam/*`, `/api/analytics/student/*` | Enroll, take exams, view grades, track progress |
| **Lecturer** | `/lecturer/*`, `/api/analytics/course/*`, `/api/analytics/malpractice/*` | Create courses, generate exams, grade, view reports |
| **Admin** | `/analytics`, `/api/analytics/admin/*` | Full analytics access, system overview |

### 6.3 Password Security

- **Hashing:** Bcrypt with automatic salt generation
- **Minimum Length:** 8 characters (enforced server-side)
- **Reset Flow:** Token-based (stored hashed, expires after set time)
- **Face Encoding:** LBP histogram stored as pickled binary in `users.face_encoding`

---

## 7. API Routes Reference

### 7.1 Authentication (`/api/auth/`)

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| POST | `/api/auth/register` | No | Create new account |
| POST | `/api/auth/login` | No | Authenticate, receive JWT |
| POST | `/api/auth/logout` | Yes | Revoke session |
| GET | `/api/auth/me` | Yes | Get current user profile |
| PUT | `/api/auth/profile` | Yes | Update profile fields |
| PUT | `/api/auth/change-password` | Yes | Change password |
| POST | `/api/auth/profile/image` | Yes | Upload profile photo |
| POST | `/api/auth/profile/face` | Yes | Register face for proctoring |
| POST | `/api/auth/forgot-password` | No | Request password reset token |
| POST | `/api/auth/reset-password` | No | Reset password with token |

### 7.2 Student API (`/api/student/`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/student/courses` | List enrolled courses (paginated) |
| GET | `/api/student/courses/available` | Browse available courses |
| POST | `/api/student/courses/<id>/enroll` | Enroll in a course |
| GET | `/api/student/courses/<id>/materials` | Course materials |
| GET | `/api/student/courses/<id>/lectures` | Course lectures with lecturer info |
| POST | `/api/student/progress/<material_id>` | Update learning progress |
| GET | `/api/student/exams` | All available exams |
| POST | `/api/student/exams/<id>/start` | Start exam attempt |
| POST | `/api/student/exams/<sub_id>/answer` | Submit answer to question |
| POST | `/api/student/exams/<sub_id>/submit` | Submit completed exam |
| GET | `/api/student/results` | View exam results |
| GET | `/api/student/classes` | Scheduled live classes |

### 7.3 Lecturer API (`/api/lecturer/`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/lecturer/courses` | List own courses |
| POST | `/api/lecturer/courses` | Create course |
| PUT | `/api/lecturer/courses/<id>` | Update course |
| DELETE | `/api/lecturer/courses/<id>` | Delete course |
| GET/POST | `/api/lecturer/courses/<id>/lectures` | Manage lectures |
| POST | `/api/lecturer/courses/<id>/materials` | Upload material (+ AI processing) |
| GET | `/api/lecturer/courses/<id>/materials` | List materials |
| POST | `/api/lecturer/materials/<id>/summarize` | Trigger AI summarization |
| POST | `/api/lecturer/courses/<id>/exams` | Create exam manually |
| GET | `/api/lecturer/courses/<id>/exams` | List exams with stats |
| POST | `/api/lecturer/courses/<id>/exams/generate` | AI-generate exam from materials |
| POST | `/api/lecturer/exams/<id>/publish` | Publish exam |
| POST | `/api/lecturer/exams/<id>/release-grades` | Toggle grade visibility |
| POST/GET/PUT/DELETE | `/api/lecturer/exams/<id>/questions` | CRUD questions |
| GET | `/api/lecturer/exams/<id>/submissions` | View submissions |
| POST | `/api/lecturer/submissions/<id>/grade` | Manually grade answers |
| GET | `/api/lecturer/courses/<id>/students` | Enrolled students |
| GET/POST/DELETE | `/api/lecturer/courses/<id>/classes` | Manage live classes |

### 7.4 Exam Proctoring API (`/api/exam/`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/exam/<sub_id>/face-verify` | Verify student face before exam |
| POST | `/api/exam/<sub_id>/proctor-frame` | Analyze webcam frame for violations |
| POST | `/api/exam/<sub_id>/tab-switch` | Record tab/window switch |
| GET | `/api/exam/<sub_id>/violations` | Get violation history |

### 7.5 Analytics API (`/api/analytics/`)

| Method | Endpoint | Role | Description |
|--------|----------|------|-------------|
| GET | `/api/analytics/student/overview` | Student | Personal stats |
| GET | `/api/analytics/course/<id>` | Lecturer/Admin | Course performance |
| GET | `/api/analytics/malpractice/<id>` | Lecturer/Admin | Exam malpractice report |
| GET | `/api/analytics/engagement/<id>` | Lecturer/Admin | Material engagement |
| GET | `/api/analytics/predict/<sid>/<cid>` | Lecturer/Admin | Performance prediction |
| GET | `/api/analytics/admin/overview` | Admin | System-wide stats |

---

## 8. AI Modules

### 8.1 Ollama LLM Service

```
┌────────────────────────────────────────┐
│           Ollama Service               │
│                                        │
│  Server: http://localhost:11434        │
│  Models: llama3 > mistral > gemma     │
│                                        │
│  Functions:                            │
│  ├─ summarize_text(text)              │
│  │  → Academic summary via LLM        │
│  │  → Fallback: truncate to N words   │
│  │                                     │
│  └─ generate_questions_llm(text, n)   │
│     → JSON array of questions          │
│     → Fallback: rule-based generator   │
└────────────────────────────────────────┘
```

### 8.2 Assessment AI

| Module | Purpose | Technique |
|--------|---------|-----------|
| **QuizGenerator** | Generate MCQ, short answer, essay questions from text | Rule-based: TF extraction, key term identification, Bloom's taxonomy stems |
| **EssayGrader** | Grade short answers and essays | Cosine similarity (TF-IDF vectors) between student answer and correct answer. Essays scored on: length (20%), vocabulary (20%), structure (20%), coherence (20%), relevance (20%) |
| **DifficultyEngine** | Adaptive difficulty selection | IRT-inspired: tracks accuracy per Bloom level. Recommends next level at ≥70% mastery. Question bank selection: 40% target, 30% easier, 20% harder, 10% mixed |

### 8.3 Learning AI

| Module | Purpose | Technique |
|--------|---------|-----------|
| **TextSummarizer** | Extractive summarization | TF-IDF sentence scoring, top-N selection preserving order |
| **FlashcardGenerator** | Auto-generate study flashcards | Regex patterns for definitions ("X is defined as…"), key term extraction, fill-in-the-blank |
| **AdaptiveLearning** | Personalized recommendations | Identifies weak areas (<70% accuracy by Bloom level), analyzes study patterns, generates study plan |

### 8.4 Exam Proctoring

```
┌─────────────────────────────────────────────────────────┐
│                  PROCTORING PIPELINE                     │
│                                                          │
│  Webcam Frame (base64 image)                            │
│       │                                                  │
│       ▼                                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌────────────────┐  │
│  │ Face Auth   │  │ Eye Tracker │  │ Head Pose      │  │
│  │             │  │             │  │ Estimator      │  │
│  │ Haar        │  │ Haar face + │  │                │  │
│  │ Cascade     │  │ eye cascade │  │ Yaw: ±25°     │  │
│  │             │  │             │  │ Pitch: ±20°    │  │
│  │ LBP hist   │  │ Eye position│  │                │  │
│  │ correlation │  │ deviation   │  │ Face position  │  │
│  │ threshold:  │  │ threshold:  │  │ relative to    │  │
│  │ 0.3         │  │ 30%         │  │ frame center   │  │
│  └──────┬──────┘  └──────┬──────┘  └───────┬────────┘  │
│         │                │                  │            │
│  ┌──────┴──────┐  ┌──────┴──────┐          │            │
│  │ Object      │  │ Tab Switch  │          │            │
│  │ Detector    │  │ Detection   │          │            │
│  │             │  │             │          │            │
│  │ Multi-face  │  │ Visibility  │          │            │
│  │ Phone       │  │ change API  │          │            │
│  │ Background  │  │ (client-    │          │            │
│  │ person      │  │  side)      │          │            │
│  └──────┬──────┘  └──────┬──────┘          │            │
│         │                │                  │            │
│         └────────────────┼──────────────────┘            │
│                          ▼                               │
│                  ┌───────────────┐                       │
│                  │ Risk Scorer   │                       │
│                  │               │                       │
│                  │ Aggregates    │                       │
│                  │ severity pts  │                       │
│                  │               │                       │
│                  │ Creates       │                       │
│                  │ Violation     │                       │
│                  │ records       │                       │
│                  │               │                       │
│                  │ Flags if      │                       │
│                  │ risk ≥ 100    │                       │
│                  └───────────────┘                       │
└─────────────────────────────────────────────────────────┘
```

**Violation Severity Points:**

| Violation | Points | Detection Method |
|-----------|--------|-----------------|
| Phone detected | 50 | Contour analysis (aspect ratio 0.35–0.65 or 1.6–2.3) |
| Multiple faces | 40 | Haar cascade face count |
| Background person | 40 | Secondary smaller faces in frame |
| Lip movement | 20 | (Reserved for future implementation) |
| No face | 15 | Zero faces detected |
| Tab switch | 10 | Browser visibility change API |
| Eye gaze | 5 | Eye position deviation >30% from center |
| Head pose | 5 | Yaw >±25° or pitch >±20° |

---

## 9. User Workflows

### 9.1 Student Registration & Login

```
Student                          Server                         Database
  │                                │                               │
  │── POST /api/auth/register ────►│                               │
  │   {email, password, name,      │── Validate email format ──►   │
  │    role: "student"}            │── Check duplicate email ──►   │
  │                                │── Bcrypt hash password ──►    │
  │                                │── INSERT user ────────────►   │
  │◄── 201 {message, user} ───────│                               │
  │                                │                               │
  │── POST /api/auth/login ───────►│                               │
  │   {email, password}            │── Query user by email ────►   │
  │                                │── Bcrypt verify ──────────►   │
  │                                │── Generate JWT token ─────►   │
  │◄── 200 {access_token, user} ──│                               │
  │   + Set-Cookie                 │                               │
  │                                │                               │
  │── GET /student/dashboard ─────►│── Verify JWT ────────────►    │
  │   (Cookie: JWT)                │── Check role: student ────►   │
  │◄── 200 student_panel.html ────│                               │
```

### 9.2 Student Exam Flow

```
Student                   Server                    AI Modules          Database
  │                          │                          │                  │
  │── GET /api/student/exams►│                          │                  │
  │◄── exam list ────────────│                          │                  │
  │                          │                          │                  │
  │── POST .../exams/1/start►│                          │                  │
  │                          │── Create Submission ─────┼────────────────► │
  │◄── {submission, questions}│                          │                  │
  │   (answers hidden)       │                          │                  │
  │                          │                          │                  │
  │── POST .../face-verify ─►│                          │                  │
  │   {image: base64}        │──────────────────────────► FaceAuth        │
  │                          │                          │ .verify_face()   │
  │◄── {verified: true} ─────│◄─────────────────────────│                  │
  │                          │── Update face_verified ──┼────────────────► │
  │                          │                          │                  │
  │   ┌─── EXAM IN PROGRESS (repeating) ───┐           │                  │
  │   │                                     │           │                  │
  │   │── POST .../proctor-frame ──────────►│           │                  │
  │   │   {image: base64}                   │───────────► RiskScorer      │
  │   │                                     │           │ .analyze_frame() │
  │   │                                     │◄──────────│ [violations]     │
  │   │                                     │── Store violations ────────► │
  │   │◄── {violations, risk_score} ────────│           │                  │
  │   │                                     │           │                  │
  │   │── POST .../answer ─────────────────►│           │                  │
  │   │   {question_id, selected_option}    │── Auto-grade MCQ ──────────►│
  │   │◄── {answer, is_correct} ────────────│           │                  │
  │   │                                     │           │                  │
  │   └─────────────────────────────────────┘           │                  │
  │                          │                          │                  │
  │── POST .../submit ──────►│                          │                  │
  │                          │──────────────────────────► EssayGrader     │
  │                          │                          │ .grade()         │
  │                          │── Calculate total_score ─┼────────────────► │
  │◄── {submission} ─────────│                          │                  │
```

### 9.3 Lecturer Exam Generation Flow

```
Lecturer                  Server                    AI Modules          Database
  │                          │                          │                  │
  │── POST .../materials ───►│                          │                  │
  │   {file: PDF}            │── Save to disk ──────────┼────────────────► │
  │                          │── Extract text ──────────► TextExtractor   │
  │                          │──────────────────────────► Summarizer      │
  │                          │                          │ .summarize()     │
  │                          │── Store summary ─────────┼────────────────► │
  │◄── {material} ────────── │                          │                  │
  │                          │                          │                  │
  │── POST .../exams/generate►                          │                  │
  │   {num_questions: 10,    │── Gather all material ───┼────────────────► │
  │    difficulty: "apply"}  │   text for course        │                  │
  │                          │                          │                  │
  │                          │──────────────────────────► OllamaService   │
  │                          │                          │ .generate_       │
  │                          │                          │  questions_llm() │
  │                          │                          │                  │
  │                          │   (if Ollama unavailable)│                  │
  │                          │──────────────────────────► QuizGenerator   │
  │                          │                          │ .generate_       │
  │                          │                          │  from_text()     │
  │                          │◄─────────────────────────│ [questions]      │
  │                          │                          │                  │
  │                          │── Create Exam (draft) ───┼────────────────► │
  │                          │── Create Questions ──────┼────────────────► │
  │◄── {exam, questions} ────│                          │                  │
  │                          │                          │                  │
  │── Review & Edit ─────────│                          │                  │
  │── POST .../publish ─────►│── Set is_published=True ─┼────────────────► │
  │◄── {exam} ───────────────│                          │                  │
```

### 9.4 Lecturer Grading Flow

```
Lecturer                  Server                    AI Modules          Database
  │                          │                          │                  │
  │── GET .../submissions ──►│                          │                  │
  │◄── [{submission,         │◄─────────────────────────┼────────────────  │
  │      student, score,     │                          │                  │
  │      violations_count}]  │                          │                  │
  │                          │                          │                  │
  │── POST .../grade ───────►│                          │                  │
  │   {answers: [{id,        │── Update answer scores ──┼────────────────► │
  │    score, feedback}]}    │── Recalculate total ─────┼────────────────► │
  │◄── {submission} ─────────│                          │                  │
  │                          │                          │                  │
  │── POST .../release-grades►│                         │                  │
  │                          │── Toggle grades_released ┼────────────────► │
  │◄── {grades_released} ────│                          │                  │
  │                          │                          │ Students can     │
  │                          │                          │ now see scores   │
```

---

## 10. Proctoring System

### 10.1 Face Registration

Before taking proctored exams, students must register their face:

1. Student navigates to Profile → Face Registration
2. Browser requests webcam access
3. Captures a photo (base64)
4. Sends to `POST /api/auth/profile/face`
5. Server extracts face using Haar cascade
6. Generates 128×128 LBP histogram encoding
7. Stores pickled encoding in `users.face_encoding`

### 10.2 Pre-Exam Face Verification

1. Student starts exam → submission created
2. Exam interface activates webcam
3. Captures face → `POST /api/exam/<sub_id>/face-verify`
4. Server compares live face histogram with stored encoding
5. **Correlation threshold: 0.3** (Histogram correlation)
6. If verified → `submission.face_verified = True` → exam begins
7. If failed → student cannot proceed

### 10.3 Live Proctoring Loop

During the exam, the client sends webcam frames every few seconds:

```
Every ~3 seconds:
  Client ── base64 frame ──► POST /api/exam/<sub_id>/proctor-frame
                              │
                              ├── EyeTracker.detect_eye_gaze()
                              ├── HeadPoseEstimator.estimate_pose()
                              ├── ObjectDetector.detect_multiple_people()
                              ├── ObjectDetector.detect_phone()
                              └── ObjectDetector.detect_background_person()
                              │
                              ▼
                         RiskScorer aggregates violations
                              │
                         Store Violation records
                         Update submission.risk_score
                              │
                         If risk_score ≥ risk_threshold (100):
                              submission.is_flagged = True
```

---

## 11. Services Layer

### 11.1 AuthenticationService

| Method | Input | Output | Logic |
|--------|-------|--------|-------|
| `register()` | email, password, name, role | (user, error) | Validate → check duplicate → bcrypt hash → create user |
| `login()` | email, password | (tokens, error) | Query user → verify password → generate JWT with role claims |
| `update_profile()` | user_id, fields | (user, error) | Update whitelisted fields only |
| `change_password()` | user_id, old_pw, new_pw | (bool, error) | Verify old → validate new ≥8 chars → update hash |

### 11.2 ExamService

| Method | Input | Output | Logic |
|--------|-------|--------|-------|
| `auto_grade_submission()` | submission_id | (submission, error) | MCQs: exact match. Short answers: cosine similarity via EssayGrader |
| `get_risk_report()` | submission_id | risk data dict | Aggregate violations with severity breakdown and timeline |
| `generate_exam_from_material()` | material_id, n, difficulty | (questions, error) | Extract text → QuizGenerator or Ollama fallback |

### 11.3 AnalyticsService

| Method | Input | Output | Logic |
|--------|-------|--------|-------|
| `record_event()` | user_id, type, value | analytics record | Create UserAnalytics row |
| `get_student_performance()` | student_id | stats dict | Aggregate enrollments, scores, study time |
| `get_course_difficulty_analysis()` | course_id | analysis list | Per-exam avg score, pass rate, difficulty rating |

---

## 12. Utilities

### 12.1 Security (`utils/security.py`)

- `hash_password(password)` → bcrypt hash
- `check_password(password, hash)` → boolean
- `get_identity()` → current JWT user claims `{id, email, role}`
- `@role_required(*roles)` → decorator that enforces JWT + role check

### 12.2 Helpers (`utils/helpers.py`)

- `allowed_file(filename, category)` → validates file extension
- `generate_unique_filename(filename)` → UUID-prefixed safe name
- `save_uploaded_file(file, folder)` → save to disk, return path
- `paginate_query(query, page, per_page)` → paginated response dict

### 12.3 Text Extractor (`utils/text_extractor.py`)

| Format | Library |
|--------|---------|
| `.pdf` | PyPDF2 |
| `.txt`, `.md` | built-in `open()` |
| `.docx` | python-docx |
| `.pptx` | python-pptx |

---

## 13. Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `SECRET_KEY` | dev default | Flask secret key |
| `JWT_SECRET_KEY` | dev default | JWT signing key |
| `DATABASE_URL` | `mysql://root:@localhost/aura_edu` | MySQL connection string |
| `FLASK_ENV` | `development` | Environment mode |

### Key Settings

| Setting | Value | Description |
|---------|-------|-------------|
| JWT expiry | 2 hours | Access token lifetime |
| JWT refresh | 30 days | Refresh token lifetime |
| Max upload | 50 MB | File upload limit |
| Risk threshold | 100 pts | Flag submission as suspicious |
| Bloom levels | 6 | remember → understand → apply → analyze → evaluate → create |
| Mastery threshold | 70% | Accuracy needed to advance Bloom level |

---

*Generated from MindStack codebase — March 2026*
