--1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `n_immatricolazioni`, YEAR(`enrolment_date`) AS `anno` FROM `students` GROUP BY YEAR(`enrolment_date`);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS `num_insegnanti`, `office_address` AS `edificio_in_comune` FROM `teachers` GROUP BY `office_address`;

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id` AS `id_appello`, AVG(`Vote`) AS 'media_voti' FROM `exam_student` GROUP BY `exam_id`;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id` AS "id_dipartimento", COUNT(`name`) AS "numero_corsi" FROM `degrees` GROUP BY `department_id`; 