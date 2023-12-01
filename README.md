## 学生成绩管理系统

### 数据库设计

使用数据库为scoreDB

#### 班级信息表class

| 字段名    | 描述     | 数据类型    | 约束        |
| :-------- | :------- | ----------- | ----------- |
| classNo   | 班级编号 | char(10)    | primary key |
| className | 班级名称 | varchar(20) | not null    |
| institute | 所属学院 | varchar(20) | not null    |
| grade     | 年级     | int         | not null    |
| classNum  | 班级人数 | int         | not null    |

#### 学生信息表student

| 字段名   | 描述     | 数据类型    | 约束        |
| -------- | -------- | ----------- | ----------- |
| stuNo    | 学号     | char(10)    | primary key |
| stuName  | 姓名     | varchar(20) | not null    |
| sex      | 性别     | int         | not null    |
| birthday | 出生日期 | date        | not null    |
| nat      | 民族     | varchar(20) | not null    |
| classNo  | 所属班级 | varchar(20) | not null    |

#### 课程信息表course

| 字段名      | 属性     | 数据类型    | 约束        |
| ----------- | -------- | ----------- | ----------- |
| courseNo    | 课程号   | char(10)    | primary key |
| courseName  | 课程名   | varchar(20) | not null    |
| credit      | 学分     | int         | not null    |
| courseHour  | 课时数   | int         | not null    |
| priorCourse | 先修课程 | varchar(20) | not null    |

#### 成绩表score

| 字段名   | 属性     | 数据类型 | 约束        |
| -------- | -------- | -------- | ----------- |
| stuNo    | 学号     | char(10) | primary key |
| courseNo | 课程号   | char(10) | primary key |
| term     | 开课学期 | char(10) | not null    |
| score    | 成绩     | int      | not null    |

#### 账号表account

| 字段名    | 描述     | 数据类型    | 约束                         |
| --------- | -------- | ----------- | ---------------------------- |
| id        | 用户id   | int         | primary key ,auto_increament |
| username  | 用户名   | varchar(20) | not null                     |
| password  | 密码     | varchar(20) | not null                     |
| authority | 用户权限 | int         | not null                     |

#### 详细建表sql

```sql
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
```



### 模块设计

#### 账号模块

登录模块用到的是account表，里面记录了用户名，密码，还有用户想权限信息，目前使用两种权限，1-学生，2-教师。不同的权限可以使用不同的功能。

##### 注册账号

学生注册账号的时候使用的账号必须是student学生表中已经有的学号，此后，这个账号只能查询相对应学生信息；老师注册账号的时候账号不能重复

##### 主要代码（accountMapper.xml）

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.learn.system.mapper.AccountMapper">

    <select id="checkUsername" parameterType="String" resultType="int">
        select count(*) from account where username = #{username}
    </select>

    <insert id="insertAccount" parameterType="account">
        insert into account
        (username, password, authority) values
        (#{username}, #{password}, #{authority})
    </insert>

    <select id="checkPassword" parameterType="String" resultType="String">
        select password from account where username = #{username}
    </select>

    <select id="getAuthority" parameterType="String" resultType="int">
        select authority from account where username = #{username}
    </select>

    <select id="checkIsStuLegal" parameterType="String" resultType="int">
        select count(*) from student where stuNo = #{username}
    </select>
</mapper>
```

#### 学生可以使用的功能

- 查看个人信息 
- 查看培养计划（选修的课程）
- 查看成绩单

##### 主要代码(studentMapper.xml)

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.learn.system.mapper.StudentMapper">

    <select id="selectStu" parameterType="String" resultType="Student">
        select * from student where stuNo = #{stuNo}
    </select>

    <select id="selectAllStu" resultType="Student">
        select * from student
    </select>

    <select id="calStuSum" parameterType="String" resultType="int">
        select sum(score) from score where stuNo=#{stuNo}
    </select>

    <select id="getScoreNum" parameterType="String" resultType="int">
        select count(*) from score where stuNo = #{stuNo}
    </select>

    <select id="calStuCredit" parameterType="String" resultType="int">
        select sum(credit) from course
        where courseNo in
        (select DISTINCT courseNo from score where stuNo = #{stuNo})
    </select>

    <select id="queryAllCourse" parameterType="String" resultType="Course">
        select * from course where courseNo IN
        (select courseNo from student where stuNo = #{stuNo})
    </select>

    <select id="queryAllScore" parameterType="String" resultType="Score">
        select score.stuNo as stuNo,
               score.courseNo as courseNo,
               score.term as term,
               score.score as score,
               course.courseName as courseName
        from score left join course on
               score.courseNo = course.courseNo
        where score.stuNo = #{stuNo}
    </select>
</mapper>
```

![查看个人信息](https://github.com/hao297531173/studentManageSystem/blob/master/image/1.PNG)

![查看培养计划](https://github.com/hao297531173/studentManageSystem/blob/master/image/2.PNG)

![查看成绩单](https://github.com/hao297531173/studentManageSystem/blob/master/image/3.PNG)

#### 老师可以使用的功能

- 添加班级表

- 添加学生信息

- 删除学生信息

  

##### 主要代码(manageMapper.xml)

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.learn.system.mapper.TeacherMapper">

    <select id="isExistClassNo" parameterType="String" resultType="int">
        select count(*) from class where classNo = #{classNo}
    </select>

    <insert id="insertClassInfo" parameterType="ClassInfo">
        insert into class (classNo, className, institute, grade, classNum) values
        (#{classNo}, #{className}, #{institute}, #{grade}, 0)
    </insert>

    <select id="isExistStuNo" parameterType="String" resultType="int">
        select count(*) from student where stuNo = #{stuNo}
    </select>

    <insert id="insertStudentInfo" parameterType="Student">
        insert into student (stuNo, stuName, sex, birthday, nat, classNo) values
        (#{stuNo}, #{stuName}, #{sex}, #{birthday}, #{nat}, #{classNo})
    </insert>

    <select id="queryAllClassNo" resultType="String">
        select classNo from class
    </select>

    <update id="updateClassNum" parameterType="String">
        update class set classNum = classNum+1 where classNo = #{classNo}
    </update>

    <delete id="deleteStuByNo" parameterType="String">
        delete from student where stuNo = #{stuNo}
    </delete>

    <update id="updateClassNumM" parameterType="String">
        update class set classNum = classNum-1 where classNo = #{classNo}
    </update>

    <delete id="deleteScoreByNo" parameterType="String">
        delete from score where stuNo = #{stuNo}
    </delete>

    <select id="queryClassNoByStuNo" parameterType="String" resultType="String">
        select classNo from student where stuNo = #{stuNo}
    </select>

    <select id="queryAllStudent" resultType="Student">
        select * from student
    </select>

</mapper>
```

![写入班级信息](https://github.com/hao297531173/studentManageSystem/blob/master/image/4.PNG)

![写入学生信息](https://github.com/hao297531173/studentManageSystem/blob/master/image/5.png)

![删除学生信息](https://github.com/hao297531173/studentManageSystem/blob/master/image/6.png)

#### 分页写法

在这个项目中，分页是在service层进行的，在mapper层查出所有的数据，然后再service层对List集合进行裁剪

写法摘录如下

##### StudentServiceImpl.java

```java
 @Override
    public List<Course> querySomeCourse(List<Course> courseList, int pageNum, int offset) {
        List<Course> list = new ArrayList<Course>();    //pageNum是从0开始的
        int num = (pageNum-1)*offset;   //需要略过的课程数
        int cnt = 0;        //记录添加的数量
        for(Course li : courseList){
            if(num!=0){
                num--;
                continue;
            }
            list.add(li);
            cnt++;
            if(cnt == offset){
                return list;
            }
        }
        return list;    //这里是数量不足offset的时候的返回值
    }
```

##### StudentController.java

```java
//查询学生培养计划
    @RequestMapping(value="/checkPlan/{pageNum}", method = RequestMethod.GET)
    public ModelAndView checkPlan(@PathVariable("pageNum")int pageNum,
                                  ModelAndView mv, HttpSession session){
        int offset = 5;
        mv.addObject("userType", session.getAttribute("userType"));
        mv.addObject("userName",session.getAttribute("stuNo") );
        String stuNo = (String)session.getAttribute("stuNo");
        List<Course> courseList = new ArrayList<Course>();
        int cnt = 0;        //记录总的结果条数
        courseList = studentService.querySomeCourse(studentService.queryAllCourse(stuNo),
                pageNum, offset);
        cnt = studentService.queryAllCourse(stuNo).size();
        int totalPage = cnt / offset;
        if(cnt % offset != 0){
            totalPage++;
        }
        if(totalPage == 0){
            totalPage=1;
        }
        mv.addObject("totalPage", totalPage);
        //将当前页面号返回给前端
        mv.addObject("pageNum", pageNum);
        mv.addObject("courstList", courseList);
        mv.setViewName("checkCourse");
//        System.out.println(courseList);
        return mv;
    }
```

##### checkCourse.html

```html
<table class="table table-bordered">
                <tr >
                    <td>课程号</td>
                    <td>课程名</td>
                    <td>学分</td>
                    <td>课时数</td>
                    <td>先修课程</td>
                </tr>
                <tr th:each="list : ${courstList}">
                    <td th:text="${list.courseNo}"></td>
                    <td th:text="${list.courseName}"></td>
                    <td th:text="${list.credit}"></td>
                    <td th:text="${list.courseHour}"></td>
                    <td th:text="${list.priorCourse}"></td>
                </tr>
                <!--下面是进行翻页的控件-->
                <tr>
                    <td>
                        <a th:href="@{/checkPlan/{pageNum}(pageNum=1)}">首页</a>
                    </td>
                    <td th:if="${pageNum}!=1">
                        <a th:href="@{/checkPlan/{pageNum}(pageNum=${pageNum}-1)}">上一页</a>
                    </td>
                    <td th:if="${pageNum}!=${totalPage}">
                        <a th:href="@{/checkPlan/{pageNum}(pageNum=${pageNum}+1)}">下一页</a>
                    </td>
                    <td>
                        <a th:href="@{/checkPlan/{pageNum}(pageNum=${totalPage})}">尾页</a>
                    </td>
                    <td>
                        第<span th:text="${pageNum}"></span>页/<span th:text="${totalPage}"></span>页
                    </td>
                </tr>
            </table>
```