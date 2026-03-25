-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2026 at 08:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aura_edu`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_text` text DEFAULT NULL,
  `selected_option` int(11) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `ai_feedback` text DEFAULT NULL,
  `answered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `submission_id`, `question_id`, `answer_text`, `selected_option`, `is_correct`, `score`, `ai_feedback`, `answered_at`) VALUES
(1, 1, 1, NULL, 1, 0, 0, NULL, '2026-03-06 13:49:11'),
(2, 1, 2, NULL, 1, 0, 0, NULL, '2026-03-06 13:49:13'),
(3, 1, 3, 'test', NULL, NULL, NULL, NULL, '2026-03-06 13:49:18'),
(4, 1, 4, 'test', NULL, NULL, NULL, NULL, '2026-03-06 13:49:22'),
(5, 1, 5, NULL, 1, 1, 2, NULL, '2026-03-06 13:49:22'),
(6, 2, 6, 'test', NULL, NULL, NULL, NULL, '2026-03-06 18:48:45'),
(7, 2, 7, 'test', NULL, NULL, NULL, NULL, '2026-03-06 18:48:49'),
(8, 2, 8, 'test', NULL, NULL, NULL, NULL, '2026-03-06 18:48:54'),
(9, 2, 9, 'test', NULL, NULL, NULL, NULL, '2026-03-06 18:48:57'),
(10, 2, 10, 'test', NULL, NULL, NULL, NULL, '2026-03-06 18:49:00'),
(11, 2, 11, 'test', NULL, NULL, NULL, NULL, '2026-03-06 18:49:11'),
(12, 3, 14, NULL, 1, 0, 0, NULL, '2026-03-10 06:55:04'),
(13, 3, 13, NULL, 1, 0, 0, NULL, '2026-03-10 06:55:06'),
(14, 3, 12, 'test', NULL, NULL, NULL, NULL, '2026-03-10 06:55:11'),
(15, 3, 15, NULL, 1, 0, 0, NULL, '2026-03-10 06:55:12'),
(16, 3, 16, 'tets', NULL, NULL, NULL, NULL, '2026-03-10 06:55:23'),
(17, 3, 17, NULL, 2, 0, 0, NULL, '2026-03-10 06:55:23'),
(18, 3, 18, NULL, 2, 1, 2, NULL, '2026-03-10 06:55:25'),
(19, 3, 19, NULL, 2, 0, 0, NULL, '2026-03-10 06:55:27'),
(20, 3, 20, 'test', NULL, NULL, NULL, NULL, '2026-03-10 06:55:30'),
(21, 3, 21, 'test', NULL, NULL, NULL, NULL, '2026-03-10 06:55:39'),
(31, 5, 32, NULL, 1, 0, 0, NULL, '2026-03-11 17:48:40'),
(32, 5, 33, NULL, 0, 1, 2, NULL, '2026-03-11 17:48:42'),
(33, 5, 34, 'test ', NULL, NULL, NULL, NULL, '2026-03-11 17:48:48'),
(34, 5, 35, NULL, 1, 0, 0, NULL, '2026-03-11 17:48:48'),
(35, 5, 36, NULL, 1, 0, 0, NULL, '2026-03-11 17:48:50'),
(36, 5, 37, 'test', NULL, NULL, NULL, NULL, '2026-03-11 17:48:55'),
(37, 5, 38, 'tset', NULL, NULL, NULL, NULL, '2026-03-11 17:48:58'),
(38, 5, 39, NULL, 1, 1, 2, NULL, '2026-03-11 17:48:58'),
(39, 5, 40, NULL, 2, 1, 2, NULL, '2026-03-11 17:48:59'),
(40, 5, 41, NULL, 2, 1, 2, NULL, '2026-03-11 17:49:02'),
(51, 7, 92, NULL, 1, 0, 0, NULL, '2026-03-24 13:10:13'),
(52, 7, 93, 'A business is an organized effort to provide value (goods or services) to people while using tools, skills, and innovation to succeed and grow', NULL, NULL, NULL, NULL, '2026-03-24 13:10:36'),
(53, 7, 94, 'Business is an organized activity that involves the production, buying, and selling of goods and services to satisfy human needs and wants, usually with the aim of making a profit. It brings together resources such as people, capital, and technology to create value.', NULL, NULL, NULL, NULL, '2026-03-24 13:10:39'),
(54, 7, 95, 'Personal development: Learning helps individuals improve their knowledge, skills, and behavior, making them more capable and confident.\nBetter decision-making: Through learning, people gain information and understanding that help them make informed choices in life.\nAdaptation to change: In a fast-changing world, learning enables people to adjust to new technologies, environments, and situations.\nCareer opportunities: Learning equips individuals with skills needed for jobs and professional growth. It also helps people remain competitive in the job market.\nProblem-solving skills: It improves the ability to think critically and solve problems effectively.\nSocial development: Learning helps individuals understand others, communicate better, and contribute positively to society.', NULL, NULL, NULL, NULL, '2026-03-24 13:10:48'),
(55, 7, 96, NULL, 0, 1, 3, NULL, '2026-03-24 13:13:39'),
(56, 7, 97, NULL, 2, 1, 3, NULL, '2026-03-24 13:13:52'),
(57, 7, 98, NULL, 2, 1, 3, NULL, '2026-03-24 13:14:13'),
(58, 7, 100, 'Education is the process of acquiring knowledge, skills, values, and attitudes that help individuals develop and function effectively in society. It takes place through teaching, learning, and experience, both in formal settings (like schools) and informal environments.', NULL, NULL, NULL, NULL, '2026-03-24 13:14:33'),
(59, 7, 101, NULL, 1, 1, 3, NULL, '2026-03-24 13:14:44'),
(60, 7, 99, NULL, 1, 1, 3, NULL, '2026-03-24 13:15:01'),
(78, 10, 164, NULL, 1, 0, 0, NULL, '2026-03-25 08:33:21'),
(79, 10, 165, 'test', NULL, NULL, NULL, NULL, '2026-03-25 08:33:25'),
(80, 10, 166, NULL, 1, 0, 0, NULL, '2026-03-25 08:33:27'),
(81, 10, 167, NULL, 1, 0, 0, NULL, '2026-03-25 08:33:29'),
(82, 10, 168, NULL, 1, 1, 3, NULL, '2026-03-25 08:33:31'),
(83, 10, 169, NULL, 2, 0, 0, NULL, '2026-03-25 08:33:33'),
(84, 10, 170, NULL, 2, 0, 0, NULL, '2026-03-25 08:33:34'),
(85, 10, 171, 'red', NULL, NULL, NULL, NULL, '2026-03-25 08:33:38'),
(86, 10, 172, 'fv 127.0.0.1:5000 say', NULL, NULL, NULL, NULL, '2026-03-25 08:33:45'),
(87, 10, 173, 'sr', NULL, NULL, NULL, NULL, '2026-03-25 08:33:48'),
(88, 11, 201, NULL, 1, 0, 0, NULL, '2026-03-25 08:40:54'),
(89, 11, 202, '2', NULL, NULL, NULL, NULL, '2026-03-25 08:41:06'),
(90, 11, 203, 'sdsds', NULL, NULL, NULL, NULL, '2026-03-25 08:43:07'),
(91, 11, 204, NULL, 1, 0, 0, NULL, '2026-03-25 08:43:09'),
(92, 11, 205, NULL, 1, 0, 0, NULL, '2026-03-25 08:43:12'),
(93, 11, 206, NULL, 1, 0, 0, NULL, '2026-03-25 08:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `lecturer_id` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `title`, `description`, `lecturer_id`, `category`, `is_published`, `created_at`, `updated_at`) VALUES
(1, 'BIT2210', 'Introduction to Programming ', 'learning basic programming and syntax', 3, 'Computer science ', 1, '2026-03-06 11:11:45', '2026-03-06 12:18:25'),
(2, 'BSCCS3425', 'Probability and statistics', 'its math', 3, 'Computer science ', 1, '2026-03-06 18:32:50', '2026-03-06 18:32:50'),
(3, 'BMA1234', 'Linear Mathematics', 'maths', 3, 'Information Technology', 1, '2026-03-10 06:50:48', '2026-03-10 06:50:48'),
(4, 'BMA2345', 'Calculas', 'tset', 3, 'Information Technology', 1, '2026-03-11 17:37:45', '2026-03-11 17:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `enrolled_at` datetime DEFAULT NULL,
  `progress` float DEFAULT NULL,
  `status` enum('active','completed','dropped') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `course_id`, `enrolled_at`, `progress`, `status`) VALUES
(1, 2, 1, '2026-03-06 12:18:57', 0, 'active'),
(2, 6, 1, '2026-03-06 18:28:54', 0, 'active'),
(3, 6, 2, '2026-03-06 18:39:05', 0, 'active'),
(4, 2, 2, '2026-03-10 06:45:03', 0, 'active'),
(5, 2, 3, '2026-03-10 06:53:04', 0, 'active'),
(6, 7, 1, '2026-03-11 17:30:47', 0, 'active'),
(7, 7, 2, '2026-03-11 17:30:51', 0, 'active'),
(8, 7, 3, '2026-03-11 17:30:54', 0, 'active'),
(9, 2, 4, '2026-03-11 17:41:42', 0, 'active'),
(10, 8, 4, '2026-03-12 11:51:52', 0, 'active'),
(11, 8, 1, '2026-03-12 11:51:54', 0, 'active'),
(12, 10, 4, '2026-03-18 12:14:44', 0, 'active'),
(13, 10, 1, '2026-03-18 12:16:19', 0, 'active'),
(14, 10, 3, '2026-03-18 12:16:34', 0, 'active'),
(15, 10, 2, '2026-03-18 12:16:35', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `exam_type` enum('quiz','midterm','final','assignment') DEFAULT NULL,
  `duration_minutes` int(11) NOT NULL,
  `total_marks` float NOT NULL,
  `passing_marks` float NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_proctored` tinyint(1) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT NULL,
  `shuffle_questions` tinyint(1) DEFAULT NULL,
  `allow_review` tinyint(1) DEFAULT NULL,
  `risk_threshold` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `grades_released` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `course_id`, `title`, `description`, `exam_type`, `duration_minutes`, `total_marks`, `passing_marks`, `start_time`, `end_time`, `is_proctored`, `is_published`, `shuffle_questions`, `allow_review`, `risk_threshold`, `created_at`, `grades_released`) VALUES
(4, 1, 'Cat 1', 'Auto-generated from course materials. 5 questions pending review.', 'quiz', 30, 16, 30, '2026-03-06 16:40:00', '2026-03-06 17:10:00', 1, 1, 1, 0, 100, '2026-03-06 13:38:29', 1),
(5, 2, 'Cat 1', 'Auto-generated from course materials. 6 questions pending review.', 'quiz', 30, 45, 30, '2026-03-06 21:38:00', '2026-03-06 22:08:00', 1, 1, 1, 0, 100, '2026-03-06 18:37:37', 0),
(6, 3, 'CAT 1', 'Auto-generated from course materials. 10 questions pending review.', 'quiz', 30, 32, 20, '2026-03-10 09:53:00', '2026-03-10 10:23:00', 1, 1, 1, 0, 100, '2026-03-10 06:52:19', 0),
(8, 4, 'Cat 1', 'Auto-generated from course materials. 10 questions pending review.', 'quiz', 30, 29, 20, '2026-03-11 20:41:00', '2026-03-11 21:11:00', 1, 1, 1, 0, 100, '2026-03-11 17:39:48', 1),
(14, 2, 'Cat 2', '[assessment:cat2] Auto-generated from course materials. 10 questions pending review.', 'midterm', 60, 30, 15, '2026-03-24 16:09:00', '2026-03-24 17:09:00', 1, 1, 1, 0, 100, '2026-03-24 12:49:54', 0),
(15, 2, 'Research Assignment ', '[assessment:assignment] Auto-generated from course materials. 10 questions pending review.', 'assignment', 60, 30, 15, '2026-03-24 18:13:00', '2026-03-24 19:13:00', 1, 1, 1, 0, 100, '2026-03-24 14:12:22', 0),
(17, 2, 'Final Exam', '[assessment:main_exam] Auto-generated from course materials. 12 questions pending review.', 'final', 60, 70, 35, '2026-04-08 08:15:00', '2026-04-08 09:15:00', 1, 1, 1, 0, 100, '2026-03-24 14:15:59', 0),
(21, 3, 'Cat 2', '[assessment:cat2] Auto-generated from course materials. 10 questions pending review.', 'midterm', 120, 30, 15, '2026-03-25 10:12:00', '2026-03-25 12:12:00', 1, 1, 1, 0, 100, '2026-03-25 07:08:57', 0),
(25, 4, 'Cat 2', '[assessment:cat2] Auto-generated from course materials. 10 questions pending review.', 'midterm', 6, 30, 15, '2026-03-25 11:40:00', '2026-03-25 11:46:00', 1, 1, 1, 0, 100, '2026-03-25 08:37:57', 0),
(26, 1, 'Cat 2', '[assessment:cat2] Auto-generated from course materials. 10 questions pending review.', 'midterm', 6, 30, 15, '2026-03-25 11:49:00', '2026-03-25 11:55:00', 1, 1, 1, 0, 100, '2026-03-25 08:48:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `learning_progress`
--

CREATE TABLE `learning_progress` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `progress_percent` float DEFAULT NULL,
  `time_spent_seconds` int(11) DEFAULT NULL,
  `last_accessed` datetime DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `has_opened` tinyint(1) DEFAULT 0,
  `first_opened_at` datetime DEFAULT NULL,
  `last_page` int(11) DEFAULT 0,
  `total_pages` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `learning_progress`
--

INSERT INTO `learning_progress` (`id`, `student_id`, `material_id`, `progress_percent`, `time_spent_seconds`, `last_accessed`, `completed`, `has_opened`, `first_opened_at`, `last_page`, `total_pages`) VALUES
(6, 2, 11, 100, 15, '2026-03-24 19:17:40', 1, 1, '2026-03-24 12:05:05', 1, 1),
(7, 2, 10, 100, 0, '2026-03-24 19:16:35', 1, 1, '2026-03-24 19:16:35', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `course_id`, `title`, `content`, `order_index`, `duration_minutes`, `is_published`, `created_at`) VALUES
(1, 1, 'Doc Arthur', '', 0, NULL, 1, '2026-03-06 11:16:58'),
(2, 2, 'Lec Shar', '', 0, NULL, 0, '2026-03-06 18:33:14'),
(3, 3, 'Mutheu', '', 0, NULL, 1, '2026-03-10 06:53:20'),
(4, 4, 'Thuo', '', 0, NULL, 1, '2026-03-11 17:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `live_classes`
--

CREATE TABLE `live_classes` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `meeting_link` varchar(500) NOT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `scheduled_at` datetime NOT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `is_unlocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `file_type` enum('pdf','video','slide','document','other') NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_size` int(11) DEFAULT NULL,
  `ai_summary` text DEFAULT NULL,
  `ai_flashcards` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ai_flashcards`)),
  `uploaded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `course_id`, `lecture_id`, `title`, `file_type`, `file_path`, `file_size`, `ai_summary`, `ai_flashcards`, `uploaded_at`) VALUES
(8, 2, NULL, 'Artificial intelligence .pdf', 'pdf', 'courses/2/Artificial_intelligence_f196f6b3.pdf', 0, 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business. Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.\n\nIn education, AI-driven adaptive learning platforms personalize learning experiences for students worldwide, offering tailored content that enhances understanding and retention. Virtual tutors and AI-powered assistants make knowledge more accessible, particularly in regions with limited educational resources.\n\nThe business world is also experiencing a major shift due to AI innovation, with companies leveraging it for customer service through chatbots, predictive analytics, and automation of repetitive tasks. This allows employees to focus on creative and strategic work.\n\nHowever, the rise of AI raises important ethical and societal questions, including concerns about data privacy, bias in algorithms, and employment impacts. Governments, organizations, and individuals must collaborate to ensure that AI development is guided by fairness, transparency, and accountability, minimizing risks while fully harnessing its benefits.', NULL, '2026-03-24 11:52:14'),
(9, 1, NULL, 'Artificial intelligence .pdf', 'pdf', 'courses/1/Artificial_intelligence_fb2bb328.pdf', 0, 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld. From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable. This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems. In the field of education, AI is personalizing learning experiences for students across the globe. As a result, learning is becoming more inclusive, flexible, and responsive to individual \nneeds. The business world is also experiencing a major shift due to AI innovation. This allows employees to focus on mor e creative and strategic \nwork. Despite its many advantages, the rise of AI also raises important ethical and societal questions. Concerns about data privacy, bias in algorithms, and the impact on employment must be \ncarefully addressed. In doing so, society can fully harness the benefits of AI while minimizing its \nrisks.', NULL, '2026-03-24 11:53:13'),
(10, 3, NULL, 'Artificial intelligence .pdf', 'pdf', 'courses/3/Artificial_intelligence_e338fb57.pdf', 0, 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld. From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable. Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions. This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.  \nIn the field of education, AI is personalizing learning experiences for students across the globe. \nAdaptive learning platforms can identify a student’s strengths and weaknesses, offering tailored \ncontent that improves understanding and retention. Virtual t utors and AI -powered assistants \nare making knowledge more accessible, especially in regions where educational resources are \nlimited. As a result, learning is becoming more inclusive, flexible, and responsive to individual \nneeds.  \nThe business world is also experiencing a major shift due to AI innovation. Companies are \nleveraging AI for customer service through chatbots, predictive analytics for market trends, and \nautomation of repetitive tasks. This allows employees to focus on mor e creative and strategic \nwork. At the same time, AI is driving the development of new industries and job roles, \nemphasizing the importance of digital skills and continuous learning in the modern workforce.  \nDespite its many advantages, the rise of AI also raises important ethical and societal questions. \nConcerns about data privacy, bias in algorithms, and the impact on employment must be \ncarefully addressed. As AI continues to evolve, it is crucial for govern ments, organizations, and \nindividuals to work together to ensure that its development is guided by fairness, transparency, \nand accountability. In doing so, society can fully harness the benefits of AI while minimizing', NULL, '2026-03-24 11:53:44'),
(11, 4, NULL, 'Artificial intelligence .pdf', 'pdf', 'courses/4/Artificial_intelligence_a9097e84.pdf', 0, 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld. From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable. Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions. This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.  \nIn the field of education, AI is personalizing learning experiences for students across the globe. \nAdaptive learning platforms can identify a student’s strengths and weaknesses, offering tailored \ncontent that improves understanding and retention. Virtual t utors and AI -powered assistants \nare making knowledge more accessible, especially in regions where educational resources are \nlimited. As a result, learning is becoming more inclusive, flexible, and responsive to individual \nneeds.  \nThe business world is also experiencing a major shift due to AI innovation. Companies are \nleveraging AI for customer service through chatbots, predictive analytics for market trends, and \nautomation of repetitive tasks. This allows employees to focus on mor e creative and strategic \nwork. At the same time, AI is driving the development of new industries and job roles, \nemphasizing the importance of digital skills and continuous learning in the modern workforce.  \nDespite its many advantages, the rise of AI also raises important ethical and societal questions. \nConcerns about data privacy, bias in algorithms, and the impact on employment must be \ncarefully addressed. As AI continues to evolve, it is crucial for govern ments, organizations, and \nindividuals to work together to ensure that its development is guided by fairness, transparency, \nand accountability. In doing so, society can fully harness the benefits of AI while minimizing', NULL, '2026-03-24 11:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `question_type` enum('mcq','short_answer','essay') NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `correct_answer` text DEFAULT NULL,
  `marks` float NOT NULL,
  `difficulty` enum('remember','understand','apply','analyze','evaluate','create') DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  `explanation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `exam_id`, `question_text`, `question_type`, `options`, `correct_answer`, `marks`, `difficulty`, `order_index`, `explanation`) VALUES
(1, 4, 'Fill in the blank: By using  NLP  techniques,  the system  can interpret  \nunstructured  textual  data within CVs and convert it into structured _____ that can be efficiently \nanalyzed and ranked.', 'mcq', '[\"organizations\", \"recruitment\", \"information\", \"process\"]', '2', 2, 'understand', 0, 'By using  NLP  techniques,  the system  can interpret  \nunstructured  textual  data within CVs and convert it into structured information that can be efficiently \nanalyzed and ranked.'),
(2, 4, 'Fill in the blank: Human resource professionals often spend significant time manually \n_____ CVs to identify candidates who match job requirements.', 'mcq', '[\"screening\", \"process\", \"recruitment\", \"organizations\"]', '0', 2, 'understand', 1, 'Human resource professionals often spend significant time manually \nscreening CVs to identify candidates who match job requirements.'),
(3, 4, 'Explain screening in your own words.', 'short_answer', 'null', 'Human resource professionals often spend significant time manually \nscreening CVs to identify candidates who match job requirements.', 5, 'understand', 2, 'Reference: Human resource professionals often spend significant time manually \nscreening CVs to identify candidates who match job requirements.'),
(4, 4, 'Explain recruitment in your own words.', 'short_answer', 'null', 'MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.', 5, 'understand', 3, 'Reference: MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.'),
(5, 4, 'Fill in the blank: As the volume  of job applications  \ncontinues  to increase  due to online  _____ platforms, recruiters may overlook qualified \ncandidates or make decisions based on incomplete analysis.', 'mcq', '[\"information\", \"recruitment\", \"process\", \"organizations\"]', '1', 2, 'understand', 4, 'As the volume  of job applications  \ncontinues  to increase  due to online  recruitment platforms, recruiters may overlook qualified \ncandidates or make decisions based on incomplete analysis.'),
(6, 5, 'Explain process in your own words.', 'short_answer', 'null', 'MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.', 5, 'understand', 0, 'Reference: MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.'),
(7, 5, 'Describe recruitment and organizations.', 'essay', 'null', NULL, 20, 'understand', 1, 'Evaluate based on depth, clarity, and evidence.'),
(8, 5, 'Explain recruitment in your own words.', 'short_answer', 'null', 'MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.', 5, 'understand', 2, 'Reference: MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.'),
(9, 5, 'What is the significance of information?', 'short_answer', 'null', 'MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.', 5, 'understand', 3, 'Reference: MOUNT  KENYA  UNIVERSITY  \n \nSCHOOL  OF COMPUTING  AND  INFORMATICS  DEPARTMENT  OF INFORMATION \nTECHNOLOGY  \n \nNATURAL LANGUAGE PROCESSING  \nBIT4133  \n \nAI Recruitment  CV Analyzer  System  Using  Natural  Language  Processing  \n(ATS SYSTEM)  \n \n \n \n \nNAME: EDWIN MEITEIKINI  \nREG; BSCCS/2024/44160  \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nBACHELOR OF SCIENCE IN COMPUTER SCIENCE  \nJANUARY 202  \n \n\n1.'),
(10, 5, 'Describe organizations.', 'short_answer', 'null', 'Problem  Description  \nRecruitment processes in many organizations involve reviewing a large number of  job applications \nand curriculum vitae (CVs).', 5, 'understand', 4, 'Reference: Problem  Description  \nRecruitment processes in many organizations involve reviewing a large number of  job applications \nand curriculum vitae (CVs).'),
(11, 5, 'What is the significance of screening?', 'short_answer', 'null', 'Human resource professionals often spend significant time manually \nscreening CVs to identify candidates who match job requirements.', 5, 'understand', 5, 'Reference: Human resource professionals often spend significant time manually \nscreening CVs to identify candidates who match job requirements.'),
(12, 6, 'What is the significance of REST?', 'short_answer', 'null', 'Question 2  \nInvestigate the evolution from xml -based database to restful Jason based APIs \nevaluate an ecommerce scalability then design an integration model for \nMount Kenya online ordering system  \nEarly enterprise systems used XML databases (e.g.', 5, 'understand', 0, 'Reference: Question 2  \nInvestigate the evolution from xml -based database to restful Jason based APIs \nevaluate an ecommerce scalability then design an integration model for \nMount Kenya online ordering system  \nEarly enterprise systems used XML databases (e.g.'),
(13, 6, 'Fill in the blank: separate _____ for customers, orders, products, etc.) ensures updates \noccur in one place, preventing anomalies.', 'mcq', '[\"JSON\", \"data\", \"tables\", \"denormalized\"]', '2', 2, 'understand', 1, 'separate tables for customers, orders, products, etc.) ensures updates \noccur in one place, preventing anomalies.'),
(14, 6, 'Fill in the blank: In contrast, denormalization intentionally \nduplicates _____ across tables (or merges tables) to speed up reads at the cost of storage and \npotential inconsistencies.', 'mcq', '[\"JSON\", \"REST\", \"data\", \"denormalized\"]', '2', 2, 'understand', 2, 'In contrast, denormalization intentionally \nduplicates data across tables (or merges tables) to speed up reads at the cost of storage and \npotential inconsistencies.'),
(15, 6, 'Fill in the blank: For example, a Netflix design splits a giant user -\nactiv ity table into Users, Movies, and ViewingHistory _____, saving space and ensuring \nconsistency (e.g.', 'mcq', '[\"tables\", \"JSON\", \"denormalized\", \"data\"]', '0', 2, 'understand', 3, 'For example, a Netflix design splits a giant user -\nactiv ity table into Users, Movies, and ViewingHistory tables, saving space and ensuring \nconsistency (e.g.'),
(16, 6, 'Summarize the concept of tables.', 'short_answer', 'null', 'DATABASE SYSTEMS 2  \nBIT3107  \nTeam  \nName               Reg No  \n1 \n2 \n3 \n4 \n5 \n6 \n7 \n8 \n9 \n10 \n11 \n12 \n \nQuestion 1  \nConduct an empirical  investigation into the tradeoffs between full normalization and \nstrategic denormalization in high volume transaction systems, use real examples measure \nperformance storage efficiency and a normally risk and propose an optimization \nframework  \nDatabase normalization is the process of organizing tables to reduce redundancy and avoid \nanomalies ( update , insert , delete problems )  \nDatabase normalization (usually up to 3NF or BCNF) and strategic denormalization are opposite \napproaches to organizing data.', 5, 'understand', 4, 'Reference: DATABASE SYSTEMS 2  \nBIT3107  \nTeam  \nName               Reg No  \n1 \n2 \n3 \n4 \n5 \n6 \n7 \n8 \n9 \n10 \n11 \n12 \n \nQuestion 1  \nConduct an empirical  investigation into the tradeoffs between full normalization and \nstrategic denormalization in high volume transaction systems, use real examples measure \nperformance storage efficiency and a normally risk and propose an optimization \nframework  \nDatabase normalization is the process of organizing tables to reduce redundancy and avoid \nanomalies ( update , insert , delete problems )  \nDatabase normalization (usually up to 3NF or BCNF) and strategic denormalization are opposite \napproaches to organizing data.'),
(17, 6, 'Fill in the blank: DATABASE SYSTEMS 2  \nBIT3107  \nTeam  \nName               Reg No  \n1 \n2 \n3 \n4 \n5 \n6 \n7 \n8 \n9 \n10 \n11 \n12 \n \nQuestion 1  \nConduct an empirical  investigation into the tradeoffs between full normalization and \nstrategic denormalization in high volume transaction systems, use real examples measure \nperformance storage efficiency and a normally risk and propose an optimization \nframework  \nDatabase normalization is the process of organizing tables to reduce redundancy and avoid \nanomalies ( update , insert , delete problems )  \nDatabase normalization (usually up to 3NF or BCNF) and strategic denormalization are opposite \napproaches to organizing _____.', 'mcq', '[\"denormalized\", \"data\", \"JSON\", \"REST\"]', '1', 2, 'understand', 5, 'DATABASE SYSTEMS 2  \nBIT3107  \nTeam  \nName               Reg No  \n1 \n2 \n3 \n4 \n5 \n6 \n7 \n8 \n9 \n10 \n11 \n12 \n \nQuestion 1  \nConduct an empirical  investigation into the tradeoffs between full normalization and \nstrategic denormalization in high volume transaction systems, use real examples measure \nperformance storage efficiency and a normally risk and propose an optimization \nframework  \nDatabase normalization is the process of organizing tables to reduce redundancy and avoid \nanomalies ( update , insert , delete problems )  \nDatabase normalization (usually up to 3NF or BCNF) and strategic denormalization are opposite \napproaches to organizing data.'),
(18, 6, 'Fill in the blank: Normalization breaks _____ into multiple tables linked by keys.', 'mcq', '[\"denormalized\", \"REST\", \"data\", \"JSON\"]', '2', 2, 'understand', 6, 'Normalization breaks data into multiple tables linked by keys.'),
(19, 6, 'Fill in the blank: Textbooks note that normalization was \nintroduced by Codd to “minimize redundancy and improve _____ integrity”  \nNOTE;  3NF (Third Normal Form)  is where a relation  table is alre ady in second Normal Form \nand non -prime attribute  is transitively dependent on the primary key  \nBoyce -codd Normal Form ( BCNF) - is a relation where for every functional dependency (X -Y) X \nmust be a super key  \n \nDenormalization : Merges related data to eliminate JOINs, improving read/query performance.', 'mcq', '[\"data\", \"JSON\", \"REST\", \"denormalized\"]', '0', 2, 'understand', 7, 'Textbooks note that normalization was \nintroduced by Codd to “minimize redundancy and improve data integrity”  \nNOTE;  3NF (Third Normal Form)  is where a relation  table is alre ady in second Normal Form \nand non -prime attribute  is transitively dependent on the primary key  \nBoyce -codd Normal Form ( BCNF) - is a relation where for every functional dependency (X -Y) X \nmust be a super key  \n \nDenormalization : Merges related data to eliminate JOINs, improving read/query performance.'),
(20, 6, 'Describe denormalized.', 'short_answer', 'null', 'In practice, fully normalized schemas are id eal for write -heavy OLTP \n(since smaller tables mean faster updates), whereas denormalized schemas favor read -heavy \nworkloads (trading extra space for fewer JOINs)  \n \nIn high -volume systems such as financial platforms, e -commerce systems, and social networks , \nthe choice between normalization and denormalization involves complex trade -offs between:  \n1.', 5, 'understand', 8, 'Reference: In practice, fully normalized schemas are id eal for write -heavy OLTP \n(since smaller tables mean faster updates), whereas denormalized schemas favor read -heavy \nworkloads (trading extra space for fewer JOINs)  \n \nIn high -volume systems such as financial platforms, e -commerce systems, and social networks , \nthe choice between normalization and denormalization involves complex trade -offs between:  \n1.'),
(21, 6, 'Describe data.', 'short_answer', 'null', 'DATABASE SYSTEMS 2  \nBIT3107  \nTeam  \nName               Reg No  \n1 \n2 \n3 \n4 \n5 \n6 \n7 \n8 \n9 \n10 \n11 \n12 \n \nQuestion 1  \nConduct an empirical  investigation into the tradeoffs between full normalization and \nstrategic denormalization in high volume transaction systems, use real examples measure \nperformance storage efficiency and a normally risk and propose an optimization \nframework  \nDatabase normalization is the process of organizing tables to reduce redundancy and avoid \nanomalies ( update , insert , delete problems )  \nDatabase normalization (usually up to 3NF or BCNF) and strategic denormalization are opposite \napproaches to organizing data.', 5, 'understand', 9, 'Reference: DATABASE SYSTEMS 2  \nBIT3107  \nTeam  \nName               Reg No  \n1 \n2 \n3 \n4 \n5 \n6 \n7 \n8 \n9 \n10 \n11 \n12 \n \nQuestion 1  \nConduct an empirical  investigation into the tradeoffs between full normalization and \nstrategic denormalization in high volume transaction systems, use real examples measure \nperformance storage efficiency and a normally risk and propose an optimization \nframework  \nDatabase normalization is the process of organizing tables to reduce redundancy and avoid \nanomalies ( update , insert , delete problems )  \nDatabase normalization (usually up to 3NF or BCNF) and strategic denormalization are opposite \napproaches to organizing data.'),
(32, 8, 'Fill in the blank: Problem Descriptio n Recruitment processes in many organizations involve reviewing a large number of job _____ and curriculum vitae (CVs).', 'mcq', '[\"screening\", \"information\", \"candidates\", \"applications\"]', '3', 2, 'understand', 0, 'Problem Descriptio n Recruitment processes in many organizations involve reviewing a large number of job applications and curriculum vitae (CVs).'),
(33, 8, 'Fill in the blank: As the volume of job _____ continues to increase due to online recruitment platforms, recruiters may overlook qualified candidates or make decisions based o n incomplete analysis.', 'mcq', '[\"applications\", \"information\", \"candidates\", \"screening\"]', '0', 2, 'understand', 1, 'As the volume of job applications continues to increase due to online recruitment platforms, recruiters may overlook qualified candidates or make decisions based o n incomplete analysis.'),
(34, 8, 'What is the significance of applications?', 'short_answer', 'null', 'Problem Descriptio n Recruitment processes in many organizations involve reviewing a large number of job applications and curriculum vitae (CVs).', 5, 'understand', 2, 'Reference: Problem Descriptio n Recruitment processes in many organizations involve reviewing a large number of job applications and curriculum vitae (CVs).'),
(35, 8, 'Fill in the blank: MOUNT KENYA UNIVERSITY SCHOOL OF COMPUTING AND INFORMATICS DEPARTMENT OF INFORMATION TECHNOLOGY NATURAL LANGUAGE PROCESSING BIT 4133 AI Recruitment CV Analyzer System Using Natural Language Processing (ATS SYSTEM) NAME: EDWIN MEITEIKINI ADM NO: BSCCS/2024/44160 BACHELOR OF SCIENCE IN COMPUTER SCIENCE JANUARY 2026 1.', 'mcq', '[\"candidates\", \"applications\", \"information\", \"screening\"]', '2', 2, 'understand', 3, 'MOUNT KENYA UNIVERSITY SCHOOL OF COMPUTING AND INFORMATICS DEPARTMENT OF INFORMATION TECHNOLOGY NATURAL LANGUAGE PROCESSING BIT 4133 AI Recruitment CV Analyzer System Using Natural Language Processing (ATS SYSTEM) NAME: EDWIN MEITEIKINI ADM NO: BSCCS/2024/44160 BACHELOR OF SCIENCE IN COMPUTER SCIENCE JANUARY 2026 1.'),
(36, 8, 'Fill in the blank: Recruiters are required to review hundreds or even thousands of _____ for a single job opening, which often leads to delays in hiring and potential loss of highly qualified candidates.', 'mcq', '[\"candidates\", \"screening\", \"information\", \"applications\"]', '3', 2, 'understand', 4, 'Recruiters are required to review hundreds or even thousands of applications for a single job opening, which often leads to delays in hiring and potential loss of highly qualified candidates.'),
(37, 8, 'Explain candidates in your own words.', 'short_answer', 'null', 'Human resource professionals often spend significant time manually screening CVs to identify candidates who match job requirements.', 5, 'understand', 5, 'Reference: Human resource professionals often spend significant time manually screening CVs to identify candidates who match job requirements.'),
(38, 8, 'What is the significance of information?', 'short_answer', 'null', 'MOUNT KENYA UNIVERSITY SCHOOL OF COMPUTING AND INFORMATICS DEPARTMENT OF INFORMATION TECHNOLOGY NATURAL LANGUAGE PROCESSING BIT 4133 AI Recruitment CV Analyzer System Using Natural Language Processing (ATS SYSTEM) NAME: EDWIN MEITEIKINI ADM NO: BSCCS/2024/44160 BACHELOR OF SCIENCE IN COMPUTER SCIENCE JANUARY 2026 1.', 5, 'understand', 6, 'Reference: MOUNT KENYA UNIVERSITY SCHOOL OF COMPUTING AND INFORMATICS DEPARTMENT OF INFORMATION TECHNOLOGY NATURAL LANGUAGE PROCESSING BIT 4133 AI Recruitment CV Analyzer System Using Natural Language Processing (ATS SYSTEM) NAME: EDWIN MEITEIKINI ADM NO: BSCCS/2024/44160 BACHELOR OF SCIENCE IN COMPUTER SCIENCE JANUARY 2026 1.'),
(39, 8, 'Fill in the blank: By using NLP techniques, the system can interpret unstructured textual data within CVs and convert it into structured _____ that can be efficiently analyzed and ranke d.', 'mcq', '[\"applications\", \"information\", \"candidates\", \"screening\"]', '1', 2, 'understand', 7, 'By using NLP techniques, the system can interpret unstructured textual data within CVs and convert it into structured information that can be efficiently analyzed and ranke d.'),
(40, 8, 'Fill in the blank: Human resource professionals often spend significant time manually _____ CVs to identify candidates who match job requirements.', 'mcq', '[\"candidates\", \"information\", \"screening\", \"applications\"]', '2', 2, 'understand', 8, 'Human resource professionals often spend significant time manually screening CVs to identify candidates who match job requirements.'),
(41, 8, 'Fill in the blank: The system can then compare this _____ with job descriptions to determine candidate suitability.', 'mcq', '[\"candidates\", \"screening\", \"information\", \"applications\"]', '2', 2, 'understand', 9, 'The system can then compare this information with job descriptions to determine candidate suitability.'),
(92, 14, 'Fill in the blank: Artificial intelligence (AI) has transformed various aspects of life, _____ healthcare, education, and business.', 'mcq', '[\"education\", \"business\", \"including\", \"learning\"]', '2', 3, 'understand', 0, 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(93, 14, 'Summarize the concept of business.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 3, 'understand', 1, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(94, 14, 'Describe including.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 3, 'understand', 2, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(95, 14, 'What is the significance of learning?', 'short_answer', 'null', 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 3, 'understand', 3, 'Reference: Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(96, 14, 'Fill in the blank: Key concepts include machine _____ algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 'mcq', '[\"learning\", \"including\", \"education\", \"business\"]', '0', 3, 'understand', 4, 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(97, 14, 'Fill in the blank: Virtual tutors and AI-powered assistants make knowledge more accessible, particularly in regions with limited _____al resources.', 'mcq', '[\"including\", \"learning\", \"education\", \"business\"]', '2', 3, 'understand', 5, 'Virtual tutors and AI-powered assistants make knowledge more accessible, particularly in regions with limited educational resources.'),
(98, 14, 'Fill in the blank: However, the rise of AI raises important ethical and societal questions, _____ concerns about data privacy, bias in algorithms, and employment impacts.', 'mcq', '[\"business\", \"education\", \"including\", \"learning\"]', '2', 3, 'understand', 6, 'However, the rise of AI raises important ethical and societal questions, including concerns about data privacy, bias in algorithms, and employment impacts.'),
(99, 14, 'Fill in the blank: The _____ world is also experiencing a major shift due to AI innovation, with companies leveraging it for customer service through chatbots, predictive analytics, and automation of repetitive tasks.', 'mcq', '[\"education\", \"business\", \"including\", \"learning\"]', '1', 3, 'understand', 7, 'The business world is also experiencing a major shift due to AI innovation, with companies leveraging it for customer service through chatbots, predictive analytics, and automation of repetitive tasks.'),
(100, 14, 'Summarize the concept of education.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 3, 'understand', 8, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(101, 14, 'Fill in the blank: In education, AI-driven adaptive _____ platforms personalize learning experiences for students worldwide, offering tailored content that enhances understanding and retention.', 'mcq', '[\"education\", \"learning\", \"including\", \"business\"]', '1', 3, 'understand', 9, 'In education, AI-driven adaptive learning platforms personalize learning experiences for students worldwide, offering tailored content that enhances understanding and retention.'),
(102, 15, 'What is the significance of algorithms?', 'short_answer', 'null', 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 3, 'understand', 0, 'Reference: Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(103, 15, 'Fill in the blank: In education, AI-driven adaptive _____ platforms personalize learning experiences for students worldwide, offering tailored content that enhances understanding and retention.', 'mcq', '[\"business\", \"education\", \"learning\", \"including\"]', '2', 3, 'understand', 1, 'In education, AI-driven adaptive learning platforms personalize learning experiences for students worldwide, offering tailored content that enhances understanding and retention.'),
(104, 15, 'Describe learning.', 'short_answer', 'null', 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 3, 'understand', 2, 'Reference: Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(105, 15, 'Fill in the blank: Key concepts include machine _____ algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 'mcq', '[\"education\", \"learning\", \"including\", \"business\"]', '1', 3, 'understand', 3, 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(106, 15, 'Fill in the blank: Artificial intelligence (AI) has transformed various aspects of life, _____ healthcare, education, and business.', 'mcq', '[\"business\", \"education\", \"learning\", \"including\"]', '3', 3, 'understand', 4, 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(107, 15, 'Fill in the blank: Virtual tutors and AI-powered assistants make knowledge more accessible, particularly in regions with limited _____al resources.', 'mcq', '[\"learning\", \"including\", \"business\", \"education\"]', '3', 3, 'understand', 5, 'Virtual tutors and AI-powered assistants make knowledge more accessible, particularly in regions with limited educational resources.'),
(108, 15, 'Summarize the concept of including.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 3, 'understand', 6, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(109, 15, 'Summarize the concept of education.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 3, 'understand', 7, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(110, 15, 'Fill in the blank: However, the rise of AI raises important ethical and societal questions, _____ concerns about data privacy, bias in algorithms, and employment impacts.', 'mcq', '[\"business\", \"learning\", \"education\", \"including\"]', '3', 3, 'understand', 8, 'However, the rise of AI raises important ethical and societal questions, including concerns about data privacy, bias in algorithms, and employment impacts.'),
(111, 15, 'Fill in the blank: The _____ world is also experiencing a major shift due to AI innovation, with companies leveraging it for customer service through chatbots, predictive analytics, and automation of repetitive tasks.', 'mcq', '[\"including\", \"business\", \"learning\", \"education\"]', '1', 3, 'understand', 9, 'The business world is also experiencing a major shift due to AI innovation, with companies leveraging it for customer service through chatbots, predictive analytics, and automation of repetitive tasks.'),
(122, 17, 'Fill in the blank: Artificial intelligence (AI) has transformed various aspects of life, _____ healthcare, education, and business.', 'mcq', '[\"learning\", \"including\", \"business\", \"education\"]', '1', 6, 'understand', 0, 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(123, 17, 'Explain including in your own words.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 6, 'understand', 1, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(124, 17, 'Explain learning and including in your own words.', 'essay', 'null', NULL, 6, 'understand', 2, 'Evaluate based on depth, clarity, and evidence.'),
(125, 17, 'Fill in the blank: However, the rise of AI raises important ethical and societal questions, _____ concerns about data privacy, bias in algorithms, and employment impacts.', 'mcq', '[\"business\", \"learning\", \"including\", \"education\"]', '2', 6, 'understand', 3, 'However, the rise of AI raises important ethical and societal questions, including concerns about data privacy, bias in algorithms, and employment impacts.'),
(126, 17, 'Explain education in your own words.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 6, 'understand', 4, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(127, 17, 'Fill in the blank: In education, AI-driven adaptive _____ platforms personalize learning experiences for students worldwide, offering tailored content that enhances understanding and retention.', 'mcq', '[\"learning\", \"education\", \"including\", \"business\"]', '0', 6, 'understand', 5, 'In education, AI-driven adaptive learning platforms personalize learning experiences for students worldwide, offering tailored content that enhances understanding and retention.'),
(128, 17, 'Summarize the concept of learning.', 'short_answer', 'null', 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 6, 'understand', 6, 'Reference: Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(129, 17, 'Fill in the blank: Key concepts include machine _____ algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 'mcq', '[\"business\", \"learning\", \"education\", \"including\"]', '1', 6, 'understand', 7, 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(130, 17, 'Describe business.', 'short_answer', 'null', 'Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.', 6, 'understand', 8, 'Reference: Artificial intelligence (AI) has transformed various aspects of life, including healthcare, education, and business.'),
(131, 17, 'Fill in the blank: The _____ world is also experiencing a major shift due to AI innovation, with companies leveraging it for customer service through chatbots, predictive analytics, and automation of repetitive tasks.', 'mcq', '[\"learning\", \"education\", \"business\", \"including\"]', '2', 6, 'understand', 9, 'The business world is also experiencing a major shift due to AI innovation, with companies leveraging it for customer service through chatbots, predictive analytics, and automation of repetitive tasks.'),
(132, 17, 'Fill in the blank: Virtual tutors and AI-powered assistants make knowledge more accessible, particularly in regions with limited _____al resources.', 'mcq', '[\"including\", \"business\", \"education\", \"learning\"]', '2', 5, 'understand', 10, 'Virtual tutors and AI-powered assistants make knowledge more accessible, particularly in regions with limited educational resources.'),
(133, 17, 'What is the significance of algorithms?', 'short_answer', 'null', 'Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.', 5, 'understand', 11, 'Reference: Key concepts include machine learning algorithms that analyze vast amounts of data in seconds to improve efficiency, accuracy, and accessibility.'),
(164, 21, 'Fill in the blank: Machine learnin g _____ can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.', 'mcq', '[\"education\", \"learning\", \"algorithms\", \"world\"]', '2', 3, 'understand', 0, 'Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.'),
(165, 21, 'What is the significance of algorithms?', 'short_answer', 'null', 'Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.', 3, 'understand', 1, 'Reference: Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.'),
(166, 21, 'Fill in the blank: The business _____ is also experiencing a major shift due to AI innovation.', 'mcq', '[\"algorithms\", \"learning\", \"education\", \"world\"]', '3', 3, 'understand', 2, 'The business world is also experiencing a major shift due to AI innovation.'),
(167, 21, 'Fill in the blank: This wave of _____ is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.', 'mcq', '[\"innovation\", \"education\", \"world\", \"learning\"]', '0', 3, 'understand', 3, 'This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.'),
(168, 21, 'Fill in the blank: Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \n_____.', 'mcq', '[\"education\", \"world\", \"algorithms\", \"learning\"]', '1', 3, 'understand', 4, 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.'),
(169, 21, 'Fill in the blank: As a result, _____ is becoming more inclusive, flexible, and responsive to individual \nneeds.', 'mcq', '[\"learning\", \"algorithms\", \"world\", \"education\"]', '0', 3, 'understand', 5, 'As a result, learning is becoming more inclusive, flexible, and responsive to individual \nneeds.'),
(170, 21, 'Fill in the blank: Companies are \nleveraging AI for customer service through chatbots, predictive analytics for market trends, and \n_____ of repetitive tasks.', 'mcq', '[\"world\", \"automation\", \"education\", \"learning\"]', '1', 3, 'understand', 6, 'Companies are \nleveraging AI for customer service through chatbots, predictive analytics for market trends, and \nautomation of repetitive tasks.'),
(171, 21, 'What is the significance of education?', 'short_answer', 'null', 'From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable.', 3, 'understand', 7, 'Reference: From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable.'),
(172, 21, 'Describe data.', 'short_answer', 'null', 'Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.', 3, 'understand', 8, 'Reference: Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.'),
(173, 21, 'Explain world in your own words.', 'short_answer', 'null', 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.', 3, 'understand', 9, 'Reference: Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.'),
(201, 25, 'Fill in the blank: Companies are \nleveraging AI for customer service through chatbots, predictive analytics for market trends, and \n_____ of repetitive tasks.', 'mcq', '[\"world\", \"education\", \"automation\", \"learning\"]', '2', 3, 'understand', 0, 'Companies are \nleveraging AI for customer service through chatbots, predictive analytics for market trends, and \nautomation of repetitive tasks.'),
(202, 25, 'What is the significance of world?', 'short_answer', 'null', 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.', 3, 'understand', 1, 'Reference: Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.'),
(203, 25, 'Explain learning in your own words.', 'short_answer', 'null', 'In the field of education, AI is personalizing learning experiences for students across the globe.', 3, 'understand', 2, 'Reference: In the field of education, AI is personalizing learning experiences for students across the globe.'),
(204, 25, 'Fill in the blank: Virtual t utors and AI -powered assistants \nare making knowledge more accessible, especially in regions where _____al resources are \nlimited.', 'mcq', '[\"world\", \"learning\", \"algorithms\", \"education\"]', '3', 3, 'understand', 3, 'Virtual t utors and AI -powered assistants \nare making knowledge more accessible, especially in regions where educational resources are \nlimited.'),
(205, 25, 'Fill in the blank: This wave of _____ is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.', 'mcq', '[\"education\", \"learning\", \"innovation\", \"world\"]', '2', 3, 'understand', 4, 'This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.'),
(206, 25, 'Fill in the blank: In the field of education, AI is personalizing _____ experiences for students across the globe.', 'mcq', '[\"education\", \"algorithms\", \"world\", \"learning\"]', '3', 3, 'understand', 5, 'In the field of education, AI is personalizing learning experiences for students across the globe.'),
(207, 25, 'Fill in the blank: The business _____ is also experiencing a major shift due to AI innovation.', 'mcq', '[\"world\", \"algorithms\", \"education\", \"learning\"]', '0', 3, 'understand', 6, 'The business world is also experiencing a major shift due to AI innovation.'),
(208, 25, 'Summarize the concept of data.', 'short_answer', 'null', 'Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.', 3, 'understand', 7, 'Reference: Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.'),
(209, 25, 'Fill in the blank: Machine learnin g _____ can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.', 'mcq', '[\"algorithms\", \"education\", \"learning\", \"world\"]', '0', 3, 'understand', 8, 'Machine learnin g algorithms can now \nanalyze vast amounts of data in seconds, helping doctors detect diseases earlier and enabling \nbusinesses to make smarter decisions.'),
(210, 25, 'Fill in the blank: Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \n_____.', 'mcq', '[\"world\", \"learning\", \"education\", \"algorithms\"]', '0', 3, 'understand', 9, 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.'),
(211, 26, 'Fill in the blank: The business _____ is also experiencing a major shift due to AI innovation.', 'mcq', '[\"innovation\", \"world\", \"education\", \"learning\"]', '1', 3, 'understand', 0, 'The business world is also experiencing a major shift due to AI innovation.'),
(212, 26, 'Summarize the concept of education.', 'short_answer', 'null', 'From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable.', 3, 'understand', 1, 'Reference: From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable.'),
(213, 26, 'Summarize the concept of learning.', 'short_answer', 'null', 'In the field of education, AI is personalizing learning experiences for students across the globe.', 3, 'understand', 2, 'Reference: In the field of education, AI is personalizing learning experiences for students across the globe.'),
(214, 26, 'Summarize the concept of world.', 'short_answer', 'null', 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.', 3, 'understand', 3, 'Reference: Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.'),
(215, 26, 'Fill in the blank: Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \n_____.', 'mcq', '[\"world\", \"education\", \"learning\", \"innovation\"]', '0', 3, 'understand', 4, 'Artificial intelligence has rapidly become one of the most transformative forces shaping today’s \nworld.'),
(216, 26, 'Fill in the blank: As a result, _____ is becoming more inclusive, flexible, and responsive to individual \nneeds.', 'mcq', '[\"learning\", \"innovation\", \"education\", \"world\"]', '0', 3, 'understand', 5, 'As a result, learning is becoming more inclusive, flexible, and responsive to individual \nneeds.'),
(217, 26, 'Fill in the blank: From healthcare to _____, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable.', 'mcq', '[\"learning\", \"world\", \"education\", \"innovation\"]', '2', 3, 'understand', 6, 'From healthcare to education, AI -driven tools are improving efficiency, accuracy, and \naccessibility in ways that were once unimaginable.'),
(218, 26, 'Fill in the blank: In the field of _____, AI is personalizing learning experiences for students across the globe.', 'mcq', '[\"education\", \"world\", \"innovation\", \"learning\"]', '0', 3, 'understand', 7, 'In the field of education, AI is personalizing learning experiences for students across the globe.'),
(219, 26, 'Describe innovation.', 'short_answer', 'null', 'This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.', 3, 'understand', 8, 'Reference: This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.'),
(220, 26, 'Fill in the blank: This wave of _____ is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.', 'mcq', '[\"innovation\", \"learning\", \"world\", \"education\"]', '0', 3, 'understand', 9, 'This wave of innovation is not just about automation —\nit’s about enhancing human potential and redefinin g how we approach complex problems.');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `total_score` float DEFAULT NULL,
  `is_graded` tinyint(1) DEFAULT NULL,
  `is_flagged` tinyint(1) DEFAULT NULL,
  `risk_score` int(11) DEFAULT NULL,
  `status` enum('in_progress','submitted','graded') DEFAULT NULL,
  `face_verified` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`id`, `exam_id`, `student_id`, `started_at`, `submitted_at`, `total_score`, `is_graded`, `is_flagged`, `risk_score`, `status`, `face_verified`) VALUES
(1, 4, 2, '2026-03-06 13:48:49', '2026-03-06 13:49:33', 2, 0, 0, 10, 'submitted', 1),
(2, 5, 6, '2026-03-06 18:47:32', '2026-03-06 18:49:33', 0, 0, 0, 90, 'submitted', 1),
(3, 6, 2, '2026-03-10 06:54:07', '2026-03-10 06:55:42', 2, 0, 0, 25, 'submitted', 1),
(5, 8, 2, '2026-03-11 17:41:54', '2026-03-11 17:49:41', 8, 0, 0, 60, 'submitted', 1),
(7, 14, 2, '2026-03-24 13:09:52', '2026-03-24 13:15:04', 15, 0, 1, 495, 'submitted', 1),
(10, 21, 2, '2026-03-25 08:33:11', '2026-03-25 08:33:48', 10, 1, 0, 65, 'graded', 1),
(11, 25, 2, '2026-03-25 08:40:37', '2026-03-25 08:45:59', 10, 1, 1, 475, 'graded', 1),
(12, 26, 2, '2026-03-25 08:49:27', '2026-03-25 08:55:12', 10, 1, 1, 360, 'graded', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `role` enum('admin','lecturer','student') NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `face_encoding` blob DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL,
  `share_contact` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `first_name`, `last_name`, `role`, `profile_image`, `face_encoding`, `is_active`, `created_at`, `updated_at`, `phone_number`, `bio`, `reset_token`, `reset_token_expires`, `share_contact`) VALUES
(2, 'user@gmail.com', '$2b$12$LaHTXM/ifCNNtJL5yEeIK.E8FAT.BO2qGLOV0jNItK1MAs.KOfyN2', 'user', 'user', 'student', 'profiles/_26f3864c.jpg', 0x8004958c040000000000008c156e756d70792e636f72652e6d756c74696172726179948c0c5f7265636f6e7374727563749493948c056e756d7079948c076e6461727261799493944b0085944301629487945294284b014d0001859468038c0564747970659493948c02663494898887945294284b038c013c944e4e4e4affffffff4affffffff4b007494628942000400000000000000000000000000000000000000000000000000000000000000000000db562a3bdb56aa3b2c4e193c41f5653c6d37ea3c2c4e193d3ae2013d24474a3da080bd3ddb13853d5716e83d331ed83d49b90f3eff91df3d1d770b3e03310f3ed7ee0a3e5bb5173e6df4443e2fb6383e5716683e50cc733ecc05673eaf574b3eaf9a703e9d5b433e2065753ef1ba513ee2e3433ea4a5373ea4a5373e7863333e20df2a3e9d181e3eba83143ec1cd083e1952113edb99cf3dff91df3d33dbb23d1570bc3d3a68cc3dea70dd3da8cab13df177ac3d75fb933d0756893d8b1c963dd4c9903de2e3433df1fd763d5f1d373da0803d3db6a13f3dbea80e3daf14263db6a13f3d5003043d4882ff3ceaea123d99f3233d3a68cc3c6624063d8a5fbb3c8a5fbb3c8a5fbb3c9979ee3c9979ee3c5003043d8a5fbb3cea70dd3cdb56aa3c0e26c83cf1fd763c0799ae3c41f5653ca8878c3cdb562a3c48827f3c5003843cd4c9903c7c45883ce2e3433cd4c9103c99796e3cd4c9103c41f5653cd4c9103c83d2213c41f5653cdb562a3cdb562a3cf1fd763c7c45083c2c4e193cea705d3c3a68cc3bea70dd3bdb562a3cd4c9103cd4c9103c3a684c3cdb562a3c33db323ce2e3433c8a5fbb3b3a68cc3bdb562a3c4882ff3b8a5fbb3b33db323c3a68cc3adb56aa3bdb56aa3b7c45883b7c45883bdb56aa3b7c45883b2c4e993b3a684c3b3a684c3b7c45883bdb562a3b3a684c3b99796e3b7c45883b3a684c3b99796e3b8a5fbb3b99796e3b99796e3bdb56aa3bdb56aa3bdb56aa3bdb56aa3b7c45883b3a68cc3b99796e3b8a5fbb3b7c45883b3a684c3b9979ee3b99796e3b99796e3b3a684c3b3a684c3b9979ee3b3a684c3b2c4e993b99796e3b3a68cc3b7c45883b7c45083b3a68cc3b3a684c3b99796e3b2c4e993b3a684c3b7c45083cdb56aa3b8a5fbb3bdb56aa3bea70dd3b9979ee3b33db323c8a5fbb3b9979ee3b2c4e993b3a68cc3b8a5fbb3b83d2213c3a68cc3b2c4e193c7c45883b9979ee3b7c45083c4882ff3b9979ee3b48827f3c48827f3c2c4e193cea705d3c9979ee3bdb562a3c99796e3cea70dd3b2c4e193cf1fd763c9979ee3b8a5f3b3c92ec543c7c45083cd4c9903cdb562a3c41f5653cd4c9103ce2e3433cd4c9103cd4c9903ce2e3433cf1fd763c99796e3c41f5653c83d2213c33dbb23cf1fd763c83d2a13c0799ae3c83d2a13cdb562a3cea705d3cd4c9903cf1fd763ca8878c3cd4c9903cdb56aa3caf14a63c99796e3cf1fd763c41f5653c2c4e993cf1fd763ca8878c3c99796e3c5003843c83d2a13cf1fd763c7c45883c33db323c83d2a13cf1fd763c48827f3c92ec543cdb562a3cea705d3ce2e3433cd4c9103cf1fd763c2c4e193c4882ff3b9979ee3bdb562a3c2c4e993b2c4e993bdb562a3b3a684c3bdb562a3b3a684c3b947494622e, 1, '2026-03-06 10:55:03', '2026-03-24 11:19:30', '0746075436', 'i love books', NULL, NULL, 0),
(3, 'lec@gmail.com', '$2b$12$o6J7..Zl4B0p57BWzHoiZ.Nh72VD04jF5WfJ/qEwFdYy0eXMW15Hi', 'Dr Lec', 'Rich', 'lecturer', 'profiles/_a6d187e9.jpg', NULL, 1, '2026-03-06 11:10:31', '2026-03-25 07:07:19', '0700000000', 'i love teaching', NULL, NULL, 1),
(5, 'admin@gmail.com', '$2b$12$f92QtBuhZmNPTYm8SPWVGesAvRzyYPb7221wqkEuuJ9zTKp1p5oj2', 'admin', 'admin', 'admin', NULL, NULL, 1, '2026-03-06 12:16:12', '2026-03-06 12:16:12', NULL, NULL, NULL, NULL, 0),
(6, 'jane123@gmail.com', '$2b$12$vWbZld8Tv8v56/uE4bFGxenUs/qzxwdhRc9h5UjbGyK6.PtxA1Sfi', 'jane ', 'doe', 'student', 'profiles/qr-code_53137d96.png', NULL, 1, '2026-03-06 18:25:58', '2026-03-06 18:53:52', '0799009660', 'i am a nursing student', NULL, NULL, 1),
(7, 'edwinmeiteikini@gmail.com', '$2b$12$4EJ1cCXc1Min23ICXQzykeDs57BfZq2BDKnL.G5zOl0uLmNvQI0c.', 'Edwin', 'Meiteikini', 'student', 'profiles/download_1_23a85ef9.jpg', 0x8004958d040000000000008c166e756d70792e5f636f72652e6d756c74696172726179948c0c5f7265636f6e7374727563749493948c056e756d7079948c076e6461727261799493944b0085944301629487945294284b014d0001859468038c0564747970659493948c02663494898887945294284b038c013c944e4e4e4affffffff4affffffff4b0074946289420004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007366ac3a73662c3ad64c013ba5d9963b73662c3b0ca0213c3d138c3c43e3dc3c1270f23cdba4443d7746623d0d18af3dda2cb73da9b9cc3d103cde3d11f8e43d3d57053e0bca103e11f8e43d0b28143e71180e3e0a6c0d3e7176113e0c5c283ea651243ea66b2e3ea5f3203e0c5c283edace333e0e32393e0f664d3e0d76323ea651243e0a6c0d3e0be41a3e3f03273e0b86173e71180e3e3d130c3e3e8b193e1270f23ddbe8bd3d43e3dc3da841bf3da7c9b13d7366ac3ddc1cd23da8fdc53d7322b33d7322b33dd9f8a23dda2cb73dd880953d0dd4b53da785b83dd83c9c3d3d57853dd83c9c3dda70b03d0a6c8d3d71ba8a3d0a6c8d3d71ba8a3d445b6a3dde0c6d3d43e35c3d76ce543da9b94c3daba9673ddba4443d13e87f3d426b4f3d41f3413da7c9313d41f3413d43e35c3d7556473ddba4443ddba4443d1080573d3e8b193d407b343d0e903c3d0d182f3d0ab0063dd7c40e3d70fe033d1270f23c7176113d3f03a73c7556c73cd64c013d41f3c13cda2cb73c0ca0a13c0ca0a13c7556c73cd64c813cda2cb73c7176913c3d138c3c0ab0863ca9b94c3cd83c9c3cd83c9c3c41f3c13cd83c9c3c7556c73c45d3f73ca7c9b13c0ab0863c45d3773c0ab0863cd64c813ca9b94c3cda2c373c3f03a73c0e90bc3ca9b9cc3cd83c9c3c0ca0a13c73662c3ca9b94c3c0ab0863c7746623c7366ac3cdc1cd23cd64c013d0e90bc3c7556c73c1080d73c41f3c13ca7c9b13ca651243d41f3c13c1080d73c3d130c3d7176113ddf847a3d7746623d0b28943d7232983da785b83da785b83d426bcf3dd9b4a93d71ba8a3d71ba8a3d79367d3d79367d3d0f084a3daba9673d3ecf923d1270723daa315a3d70fe833da9b94c3dda2c373d0f084a3d70fe033d70fe033d7176113ddc1cd23cd83c1c3d7176113da461093daba9e73cde0ced3c0ab0063d0ca0a13c7556c73c0e90bc3c43e3dc3c1270f23c7556c73c41f3c13c0e90bc3ca5d9163d41f3c13c7556c73caba9e73cd83c9c3cd64c813c1080573c0ca0213c3d130c3c7746623c41f3c13bde0ced3b1080573c73662c3c1080d73b73662c3ca5d9163cde0ced3b1080573b41f3c13bd64c813b7366ac3a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000947494622e, 1, '2026-03-11 17:26:40', '2026-03-11 17:35:04', '+254746075436', 'i like computer science', NULL, NULL, 0),
(8, 'hakeem@gmail.com', '$2b$12$B0NTCGY1kWf1dAjmLqse5.G8ioLCwpjC5zFnEkybfZlQUDIih.nN.', 'hakeem', 'ibrahim', 'student', 'profiles/Screenshot_2026-03-11_133720_02714813.png', NULL, 1, '2026-03-12 11:49:52', '2026-03-12 11:51:22', '+254746075436', 'tester', NULL, NULL, 0),
(9, 'actor@gmail.com', '$2b$12$qTNogxKhphinD4cn6y4C8uuftllsKAJe7iChiBwycEojHACJaRp12', 'actor ', 'actor ', 'student', NULL, NULL, 1, '2026-03-12 12:20:21', '2026-03-12 12:20:21', NULL, NULL, NULL, NULL, 0),
(10, 'wahbih837@gmail.com', '$2b$12$Azu1.hUN/N/xLpmDRkTbmeSaCF0SB.DssoJ9969Oeu7PnbMAO9EnG', 'wahbi', 'hassan', 'student', 'profiles/Computer_Graphics_Assignment_ac52846a.png', NULL, 1, '2026-03-18 12:10:12', '2026-03-18 12:11:17', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_analytics`
--

CREATE TABLE `user_analytics` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `metric_type` varchar(50) NOT NULL,
  `metric_value` float DEFAULT NULL,
  `metadata_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata_json`)),
  `recorded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `violation_type` enum('multiple_faces','no_face','eye_gaze','head_pose','lip_movement','phone_detected','tab_switch','background_person','other') NOT NULL,
  `severity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `screenshot_path` varchar(500) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `video_path` varchar(500) DEFAULT NULL,
  `video_format` varchar(50) DEFAULT NULL,
  `video_duration` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`id`, `submission_id`, `violation_type`, `severity`, `description`, `screenshot_path`, `timestamp`, `video_path`, `video_format`, `video_duration`) VALUES
(1, 1, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-06 13:49:38', NULL, NULL, NULL),
(2, 2, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-06 18:48:19', NULL, NULL, NULL),
(3, 2, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-06 18:48:28', NULL, NULL, NULL),
(4, 2, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-06 18:48:48', NULL, NULL, NULL),
(5, 2, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-06 18:48:58', NULL, NULL, NULL),
(6, 2, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-06 18:49:18', NULL, NULL, NULL),
(7, 2, 'background_person', 40, 'Background person detected', 'v_2_20260306_184918.png', '2026-03-06 18:49:18', NULL, NULL, NULL),
(8, 2, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-06 18:49:28', NULL, NULL, NULL),
(9, 2, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-06 18:49:37', NULL, NULL, NULL),
(10, 3, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-10 06:55:11', NULL, NULL, NULL),
(11, 3, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-10 06:55:46', NULL, NULL, NULL),
(15, 5, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-11 17:48:43', NULL, NULL, NULL),
(16, 5, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-11 17:48:53', NULL, NULL, NULL),
(17, 5, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-11 17:49:03', NULL, NULL, NULL),
(18, 5, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-11 17:49:13', NULL, NULL, NULL),
(19, 5, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-11 17:49:23', NULL, NULL, NULL),
(20, 5, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-11 17:49:33', NULL, NULL, NULL),
(21, 5, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-11 17:49:44', NULL, NULL, NULL),
(127, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:10:22', NULL, NULL, NULL),
(128, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:10:33', NULL, NULL, NULL),
(129, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:10:41', NULL, NULL, NULL),
(130, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:10:48', NULL, NULL, NULL),
(131, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:10:52', NULL, NULL, NULL),
(132, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:11:02', NULL, NULL, NULL),
(133, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:11:09', NULL, NULL, NULL),
(134, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:11:11', NULL, NULL, NULL),
(135, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:11:21', NULL, NULL, NULL),
(136, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:11:30', NULL, NULL, NULL),
(137, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:11:40', NULL, NULL, NULL),
(138, 7, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-24 13:11:51', NULL, NULL, NULL),
(139, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:12:02', NULL, NULL, NULL),
(140, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:12:04', NULL, NULL, NULL),
(141, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:12:11', NULL, NULL, NULL),
(142, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:12:20', NULL, NULL, NULL),
(143, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:12:30', NULL, NULL, NULL),
(144, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:12:35', NULL, NULL, NULL),
(145, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:12:41', NULL, NULL, NULL),
(146, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:12:50', NULL, NULL, NULL),
(147, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:12:51', NULL, NULL, NULL),
(148, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:13:01', NULL, NULL, NULL),
(149, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:13:01', NULL, NULL, NULL),
(150, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:13:10', NULL, NULL, NULL),
(151, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:13:21', NULL, NULL, NULL),
(152, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:13:30', NULL, NULL, NULL),
(153, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:13:30', NULL, NULL, NULL),
(154, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:13:40', NULL, NULL, NULL),
(155, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:13:43', NULL, NULL, NULL),
(156, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:13:51', NULL, NULL, NULL),
(157, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:14:01', NULL, NULL, NULL),
(158, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:14:11', NULL, NULL, NULL),
(159, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:14:19', NULL, NULL, NULL),
(160, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:14:21', NULL, NULL, NULL),
(161, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:14:30', NULL, NULL, NULL),
(162, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:14:40', NULL, NULL, NULL),
(163, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:14:50', NULL, NULL, NULL),
(164, 7, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-24 13:15:00', NULL, NULL, NULL),
(165, 7, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-24 13:15:08', NULL, NULL, NULL),
(346, 10, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:33:25', NULL, NULL, NULL),
(347, 10, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:33:35', NULL, NULL, NULL),
(348, 10, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:33:45', NULL, NULL, NULL),
(349, 10, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:33:48', NULL, NULL, NULL),
(350, 10, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:33:49', NULL, NULL, NULL),
(351, 11, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:40:56', NULL, NULL, NULL),
(352, 11, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:40:57', NULL, NULL, NULL),
(353, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:41:12', NULL, NULL, NULL),
(354, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:41:22', NULL, NULL, NULL),
(355, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:41:32', NULL, NULL, NULL),
(356, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:41:42', NULL, NULL, NULL),
(357, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:41:52', NULL, NULL, NULL),
(358, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:42:02', NULL, NULL, NULL),
(359, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:42:12', NULL, NULL, NULL),
(360, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:42:22', NULL, NULL, NULL),
(361, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:42:32', NULL, NULL, NULL),
(362, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:42:42', NULL, NULL, NULL),
(363, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:42:52', NULL, NULL, NULL),
(364, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:43:02', NULL, NULL, NULL),
(365, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:43:12', NULL, NULL, NULL),
(366, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:43:22', NULL, NULL, NULL),
(367, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:43:32', NULL, NULL, NULL),
(368, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:43:42', NULL, NULL, NULL),
(369, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:43:52', NULL, NULL, NULL),
(370, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:44:02', NULL, NULL, NULL),
(371, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:44:12', NULL, NULL, NULL),
(372, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:44:22', NULL, NULL, NULL),
(373, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:44:32', NULL, NULL, NULL),
(374, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:44:42', NULL, NULL, NULL),
(375, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:44:52', NULL, NULL, NULL),
(376, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:45:02', NULL, NULL, NULL),
(377, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:45:12', NULL, NULL, NULL),
(378, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:45:22', NULL, NULL, NULL),
(379, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:45:32', NULL, NULL, NULL),
(380, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:45:42', NULL, NULL, NULL),
(381, 11, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:45:52', NULL, NULL, NULL),
(382, 11, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:45:59', NULL, NULL, NULL),
(383, 11, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:46:00', NULL, NULL, NULL),
(384, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:49:41', NULL, NULL, NULL),
(385, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:49:51', NULL, NULL, NULL),
(386, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:50:01', NULL, NULL, NULL),
(387, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:50:11', NULL, NULL, NULL),
(388, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:50:21', NULL, NULL, NULL),
(389, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:50:31', NULL, NULL, NULL),
(390, 12, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:50:33', NULL, NULL, NULL),
(391, 12, 'eye_gaze', 5, 'Looking away: unknown', NULL, '2026-03-25 08:50:41', NULL, NULL, NULL),
(392, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:50:51', NULL, NULL, NULL),
(393, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:51:01', NULL, NULL, NULL),
(394, 12, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:51:10', NULL, NULL, NULL),
(395, 12, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:51:11', NULL, NULL, NULL),
(396, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:51:29', NULL, NULL, NULL),
(397, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:51:39', NULL, NULL, NULL),
(398, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:51:49', NULL, NULL, NULL),
(399, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:51:59', NULL, NULL, NULL),
(400, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:52:09', NULL, NULL, NULL),
(401, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:52:19', NULL, NULL, NULL),
(402, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:52:29', NULL, NULL, NULL),
(403, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:52:39', NULL, NULL, NULL),
(404, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:52:49', NULL, NULL, NULL),
(405, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:52:59', NULL, NULL, NULL),
(406, 12, 'no_face', 15, 'No face detected in frame', NULL, '2026-03-25 08:53:09', NULL, NULL, NULL),
(407, 12, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:53:11', NULL, NULL, NULL),
(408, 12, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:53:12', NULL, NULL, NULL),
(409, 12, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:54:07', NULL, NULL, NULL),
(410, 12, 'tab_switch', 10, 'Student switched browser tab/window', NULL, '2026-03-25 08:54:08', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `lecturer_id` (`lecturer_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`student_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `idx_exams_course_created` (`course_id`,`created_at`);

--
-- Indexes for table `learning_progress`
--
ALTER TABLE `learning_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_learning_progress` (`student_id`,`material_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `live_classes`
--
ALTER TABLE `live_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `lecture_id` (`lecture_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_submission` (`exam_id`,`student_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `idx_submissions_exam_status_graded` (`exam_id`,`status`,`is_graded`),
  ADD KEY `idx_submissions_exam_flagged` (`exam_id`,`is_flagged`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_users_email` (`email`),
  ADD KEY `idx_reset_token` (`reset_token`);

--
-- Indexes for table `user_analytics`
--
ALTER TABLE `user_analytics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `idx_violations_submission_timestamp` (`submission_id`,`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `learning_progress`
--
ALTER TABLE `learning_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `live_classes`
--
ALTER TABLE `live_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_analytics`
--
ALTER TABLE `user_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `learning_progress`
--
ALTER TABLE `learning_progress`
  ADD CONSTRAINT `learning_progress_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `learning_progress_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`);

--
-- Constraints for table `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `lectures_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `live_classes`
--
ALTER TABLE `live_classes`
  ADD CONSTRAINT `live_classes_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `materials_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_analytics`
--
ALTER TABLE `user_analytics`
  ADD CONSTRAINT `user_analytics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_analytics_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `violations`
--
ALTER TABLE `violations`
  ADD CONSTRAINT `violations_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
