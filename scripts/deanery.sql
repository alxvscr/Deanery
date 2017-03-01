CREATE TABLE AUDITORIUM (
	number VARCHAR(6) NOT NULL,
	PRIMARY KEY (number)
);

CREATE TABLE DEPARTMENT (
	name VARCHAR(100) NOT NULL,
	aud VARCHAR(6) NOT NULL,
	PRIMARY KEY (name),
	FOREIGN KEY (aud) REFERENCES AUDITORIUM(number) ON UPDATE CASCADE
);

CREATE TABLE TEACHER (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	department_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (department_name) REFERENCES DEPARTMENT (name) ON UPDATE CASCADE
);

CREATE TABLE COURSE (
	name VARCHAR(100) NOT NULL,
	outcome VARCHAR(100) NOT NULL,
	credits int(11) NOT NULL,
	department_name VARCHAR(100) NOT NULL,
	precondition_course VARCHAR(100),
	PRIMARY KEY (name),
	FOREIGN KEY (department_name) REFERENCES DEPARTMENT(name) ON UPDATE CASCADE ,
	FOREIGN KEY (precondition_course) REFERENCES COURSE (name) ON UPDATE CASCADE
);

CREATE TABLE EXAM (
	course_name VARCHAR(100) NOT NULL,
	group_year int(11) NOT NULL,
	date date NOT NULL,
	professor_id int(11) NOT NULL,
	aud VARCHAR(100) NOT NULL,
	PRIMARY KEY (course_name, group_year),
	FOREIGN KEY (course_name) REFERENCES COURSE (name) ON UPDATE CASCADE,
	FOREIGN KEY (professor_id) REFERENCES TEACHER (id) ON UPDATE CASCADE
);

CREATE TABLE TGROUP (
	id int(11) NOT NULL,
	year int(11) NOT NULL,
	term VARCHAR(100) NOT NULL,
	number int(11) NOT NULL,
	professor_id int(11) NOT NULL,
	course_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (course_name) REFERENCES COURSE (name) ON UPDATE CASCADE,
	FOREIGN KEY (professor_id) REFERENCES TEACHER (id) ON UPDATE CASCADE
);

CREATE TABLE STUDENT (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	speciality VARCHAR(100) NOT NULL,
	study_start date NOT NULL,
	study_finish date,
	finish_reason VARCHAR(100),
	credits_total int(11) NOT NULL,
	PRIMARY KEY(id)
);


CREATE TABLE RESULT (
	group_id int(11) NOT NULL,
	student_id int(11) NOT NULL,
	mark VARCHAR(100),
	PRIMARY KEY (group_id, student_id),
	FOREIGN KEY (group_id) REFERENCES TGROUP (id) ON UPDATE CASCADE,
	FOREIGN KEY (student_id) REFERENCES STUDENT(id) ON UPDATE CASCADE
);

CREATE TABLE SCHEDULE (
	day VARCHAR(100) NOT NULL,
	lesson int(11) NOT NULL,
	group_id int(11) NOT NULL,
	aud VARCHAR(100) NOT NULL,
	PRIMARY KEY(day, lesson),
	FOREIGN KEY (group_id) REFERENCES TGROUP(id) ON UPDATE CASCADE,
	FOREIGN KEY (aud) REFERENCES AUDITORIUM (number) ON UPDATE CASCADE
);
