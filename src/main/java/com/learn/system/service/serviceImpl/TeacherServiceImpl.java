package com.learn.system.service.serviceImpl;

import com.learn.system.mapper.TeacherMapper;
import com.learn.system.pojo.ClassInfo;
import com.learn.system.pojo.Student;
import com.learn.system.service.TeacherService;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class TeacherServiceImpl implements TeacherService {

    private TeacherMapper teacherMapper;

    @Override
    public int isExistClassNo(String classNo) {
        return teacherMapper.isExistClassNo(classNo);
    }

    @Override
    public void insertClassInfo(ClassInfo cla) {
        teacherMapper.insertClassInfo(cla);
    }

    @Override
    public int isExistStuNo(String stuNo) {
        return teacherMapper.isExistStuNo(stuNo);
    }

    @Override
    public void insertStudentInfo(Student student) {    //这个要改
        teacherMapper.updateClassNum(student.getClassNo());
        teacherMapper.insertStudentInfo(student);
    }

    @Override
    public List<String> queryAllClassNo() {
        return teacherMapper.queryAllClassNo();
    }

    @Override
    public void updateClassNum(String classNo) {
        teacherMapper.updateClassNum(classNo);
    }

    @Override
    public void deleteStuByNo(String stuNo) {
        //删除成绩表
        deleteScoreByNo(stuNo);
        //班级人数减一
        updateClassNumM(teacherMapper.queryClassNoByStuNo(stuNo));
        //最后删除学生信息
        teacherMapper.deleteStuByNo(stuNo);
    }

    @Override
    public void updateClassNumM(String classNo) {
        teacherMapper.updateClassNumM(classNo);
    }

    @Override
    public void deleteScoreByNo(String stuNo) {
        teacherMapper.deleteScoreByNo(stuNo);
    }

    @Override
    public List<Student> queryAllStudent() {
        return teacherMapper.queryAllStudent();
    }

    @Override
    public List<Student> querySomeStudent(List<Student> studentList, int pageNum, int offset) {
        List<Student> list = new ArrayList<Student>();
        int cnt = (pageNum-1)*offset;
        int num=0;
        for(Student li : studentList){
            if(cnt!=0){
                cnt--;
                continue;
            }
            list.add(li);
            num++;
            if(num == offset){
                break;
            }
        }
        return list;
    }


}
