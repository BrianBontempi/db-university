--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT D.name AS 'Nome corso', S.`name` AS 'Nome studente', S.surname AS 'Cognome studente' FROM `students` AS S JOIN `degrees` AS D ON D.`id` = S.`degree_id` WHERE D.`name`= 'Corso di Laurea in Economia';

--2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT DEP.`name` AS 'Nome Dipartimento', DEG.`name` AS 'Nome corso' FROM `degrees` AS DEG JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id` WHERE DEP.`name` = 'Dipartimento di Neuroscienze';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT T.`name` AS 'Nome professore',T.`surname` AS 'Cognome professore',T.`id` AS 'ID professore', C.`name` AS 'Nome Corso',C.`id` AS 'ID Corso' FROM `course_teacher` AS CT JOIN `teachers` AS T ON T.`id` = CT.`teacher_id` JOIN `courses` AS C ON C.`id` = CT.`course_id` WHERE T.`id`=44;

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.`registration_number` AS 'n.matricola', S.`surname` AS 'Cognome Studente', S.`name` AS 'Nome Studente', DEG.`name` AS 'Corso di laurea', DEP.`name` AS 'Nome dipartimento' FROM `students` AS S JOIN `degrees` AS DEG ON DEG.`id` = S.`degree_id` JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id` ORDER BY S.`surname`, S.`name`;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT DISTINCT D.`name` AS 'Corso di Laurea', C.`name` AS 'Materia', T.`surname` AS 'Cognome Prof', T.`name` AS 'Nome Prof' FROM `course_teacher` AS CT JOIN `teachers` AS T ON T.`id` = CT.`teacher_id` JOIN `courses` AS C ON C.`id` = CT.`teacher_id` JOIN `degrees` AS D ON D.`id` = C.`degree_id`;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT DEP.`name` AS 'Nome Dipartimento', T.`surname` AS 'Cognome Prof', T.`name` AS 'Nome Prof' FROM `course_teacher` AS CT JOIN `teachers` AS T ON T.`id`= CT.`teacher_id` JOIN `courses` AS C ON C.`id`= CT.`course_id` JOIN `degrees` AS DEG ON DEG.`id`=C.`degree_id` JOIN `departments` AS DEP ON DEP.`id`=DEG.`department_id` WHERE DEP.`name`='Dipartimento di Matematica';