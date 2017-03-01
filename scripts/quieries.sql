#Вивести усі іспити
SELECT course_name, group_year, date, professor_id, aud
FROM exam;

#Вивести аудиторії, які за певною датою не мають іспитів
SELECT auditorium.number
FROM auditorium
WHERE number NOT IN (SELECT aud
                     FROM exam
                     WHERE date = '21');

#вибрати exam, де у course outcome = 'zalik'
SELECT course_name, group_year, date, professor_id, aud
FROM exam
WHERE course_name IN (SELECT name
                      FROM course
                      WHERE outcome = 'zalik');

#Вивести екзамени, які проводить заданий викладач
SELECT * FROM EXAM
WHERE professor_id = (SELECT id FROM TEACHER
WHERE TEACHER.name = 'Glyb')
ORDER BY date;

#Знайти екзамен за назвою дисципліни і роком групи
SELECT * FROM EXAM
WHERE course_name = 'BMT' AND group_year='3';

# Запит: Вивести екзамени, які організовує задана кафедра


# Запит: Вивести екзамени, які складає задана група


# Запит: Вивести екзамени, які проводяться у вказану дату


# Запит: Для заданого іспиту вивести к-сть студентів із заданим балом


# Запит: Для заданого іспиту вивести к-сть неявок


# Запит: Для заданого іспиту вивести середній бал студентів