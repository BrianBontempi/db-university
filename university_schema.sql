-- Struttura del database db_university

CREATE DATABASE IF NOT EXISTS `db_university`;
USE `db_university`;

CREATE TABLE `departments` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(20) NULL,
    `email` VARCHAR(100) NULL,
    `website` VARCHAR(255) NULL,
    `head_of_department` VARCHAR(100) NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `degrees` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `department_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `level` VARCHAR(20) NOT NULL,
    `address` VARCHAR(255) NULL,
    `email` VARCHAR(100) NULL,
    `website` VARCHAR(255) NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
);

CREATE TABLE `courses` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `degree_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT NULL,
    `period` VARCHAR(20) NOT NULL,
    `year` TINYINT UNSIGNED NOT NULL,
    `cfu` TINYINT UNSIGNED NOT NULL,
    `website` VARCHAR(255) NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`)
);

CREATE TABLE `teachers` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `surname` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(20) NULL,
    `email` VARCHAR(100) NOT NULL,
    `office_address` VARCHAR(255) NULL,
    `office_number` VARCHAR(10) NULL,
    PRIMARY KEY (`id`)
);

-- tabella ponte: un corso puo' avere piu' insegnanti e un insegnante piu' corsi
CREATE TABLE `course_teacher` (
    `course_id` BIGINT UNSIGNED NOT NULL,
    `teacher_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`course_id`, `teacher_id`),
    FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
    FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
);

CREATE TABLE `exams` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `course_id` BIGINT UNSIGNED NOT NULL,
    `date` DATE NOT NULL,
    `hour` TIME NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `address` VARCHAR(255) NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
);

CREATE TABLE `students` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `degree_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `surname` VARCHAR(50) NOT NULL,
    `date_of_birth` DATE NOT NULL,
    `fiscal_code` CHAR(16) NOT NULL UNIQUE,
    `enrolment_date` DATE NOT NULL,
    `registration_number` VARCHAR(10) NOT NULL UNIQUE,
    `email` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`)
);

-- tabella ponte: iscrizioni agli appelli con il voto (anche se non sufficiente)
CREATE TABLE `exam_student` (
    `exam_id` BIGINT UNSIGNED NOT NULL,
    `student_id` BIGINT UNSIGNED NOT NULL,
    `vote` TINYINT UNSIGNED NULL,
    PRIMARY KEY (`exam_id`, `student_id`),
    FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
    FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
);
