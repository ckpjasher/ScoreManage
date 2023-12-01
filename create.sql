use scoreDB;

/*  删除数据库中所有的表 */
SELECT concat('DROP TABLE IF EXISTS' , table_name, ';')
FROM information_schema.tables
WHERE table_schema = 'scoreDB';


/* 班级信息表class */
drop table IF EXISTS class;
CREATE TABLE class(
                      classNo CHAR(10) PRIMARY KEY ,
                      className VARCHAR (20) NOT NULL,
                      institute VARCHAR (20) NOT NULL,
                      grade INT NOT NULL,
                      classNum INT NOT NULL
);

/*  插入班级信息 */
INSERT INTO class (classNo, className, institute, grade, classNum) VALUES
    ('2201', '软件2201','人工智能学院',1, 1);

/* 学生信息表student */
/* sex：0-未知 1-男 2-女 */
drop table IF EXISTS student;
CREATE TABLE student(
                        stuNo CHAR(10) PRIMARY KEY,
                        stuName VARCHAR (20) NOT NULL,
                        sex INT NOT NULL,
                        birthday DATE NOT NULL,
                        nat VARCHAR(20) NOT NULL,
                        classNo VARCHAR (20) NOT NULL
);

/*  插入学生信息 */
INSERT INTO student (stuNo, stuName, sex, birthday, nat, classNo) VALUES
    ('22120145','叶佳泽',1,'2000-01-01','汉族','2201');
INSERT INTO student (stuNo, stuName, sex, birthday, nat, classNo) VALUES
    ('20068','李子豪',1,'2000-06-06','汉族','2201');
INSERT INTO student (stuNo, stuName, sex, birthday, nat, classNo) VALUES
    ('20088','苏梅',2,'2000-02-12','汉族','2201');

/*  重新计算班级人数 */
UPDATE class SET classNum = (select count(*) from  student where classNo='2201')
where classNo='2201';



/*  课程信息表course */
drop TABLE  IF EXISTS course;
CREATE TABLE course(
                       courseNo CHAR(10) PRIMARY KEY,
                       courseName VARCHAR (20) NOT NULL,
                       credit INT NOT NULL,
                       courseHour INT NOT NULL,
                       priorCourse VARCHAR (20) NOT NULL
);

/*  插入课程信息 */
INSERT INTO course (courseNo, courseName, credit, courseHour, priorCourse) VALUES
    ('ke-001','JavaWeb',4, 60, 'null');
INSERT INTO course (courseNo, courseName, credit, courseHour, priorCourse) VALUES
    ('ke-002','哲学',4, 60, 'null');
INSERT INTO course (courseNo, courseName, credit, courseHour, priorCourse) VALUES
    ('ke-003','概率论',4, 60, '高等数学');
INSERT INTO course (courseNo, courseName, credit, courseHour, priorCourse) VALUES
    ('ke-004','几何学',4, 60, '高等数学');
INSERT INTO course (courseNo, courseName, credit, courseHour, priorCourse) VALUES
    ('ke-005','线性代数',4, 60, '高等数学');
INSERT INTO course (courseNo, courseName, credit, courseHour, priorCourse) VALUES
    ('ke-006','人工智能',4, 60, '高等数学');

/*  成绩表score */
drop TABLE  IF EXISTS score;
CREATE TABLE score(
                      stuNo CHAR(10) ,
                      courseNo CHAR(10) ,
                      term VARCHAR (10) NOT NULL,
                      score INT NOT NULL,
                      PRIMARY KEY (stuNo, courseNo)
);

/*  插入成绩信息 */
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('22120145', 'ke-001', '2023年冬季学期', 100);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('22120145', 'ke-002', '2023年冬季学期', 100);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('22120145', 'ke-003', '2023年冬季学期', 100);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('22120145', 'ke-004', '2023年冬季学期', 100);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('22120145', 'ke-005', '2023年冬季学期', 100);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('22120145', 'ke-006', '2023年冬季学期', 100);


INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20068', 'ke-001', '2023年冬季学期', 60);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20068', 'ke-002', '2023年冬季学期', 68);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20068', 'ke-003', '2023年冬季学期', 68);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20068', 'ke-004', '2023年冬季学期', 68);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20068', 'ke-005', '2023年冬季学期', 68);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20068', 'ke-006', '2023年冬季学期', 68);

INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20088', 'ke-001', '2023年冬季学期', 90);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20088', 'ke-002', '2023年冬季学期', 98);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20088', 'ke-003', '2023年冬季学期', 98);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20088', 'ke-004', '2023年冬季学期', 98);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20088', 'ke-005', '2023年冬季学期', 98);
INSERT INTO score (stuNo, courseNo, term, score) VALUES
    ('20088', 'ke-006', '2023年冬季学期', 98);

/*  用户表user */
/*  authority是权限字段，共设两个值 1-学生 2-教师 */
drop TABLE IF EXISTS account;
CREATE TABLE account(
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        username VARCHAR(20) NOT NULL,
                        password VARCHAR(20) NOT NULL,
                        authority INT NOT NULL
);
/*  用户表插入值 */
INSERT INTO account (username, password, authority) VALUES ('22120145', '666666', 1);
INSERT INTO account (username, password, authority) VALUES ('20068', '666666', 1);
INSERT INTO account (username, password, authority) VALUES ('20088', '666666', 1);
INSERT INTO account (username, password, authority) VALUES ('teacher', '666666', 2);