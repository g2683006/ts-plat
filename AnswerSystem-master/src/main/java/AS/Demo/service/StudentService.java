package AS.Demo.service;

import AS.Demo.dao.StudentMapper;
import AS.Demo.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Title: AnswerSystem
 * @Description:本controllr使用于登陆注册
 * @Date: 2021
 * @Version: 1.0
 */
@Service
public class StudentService {
    @Autowired
    private StudentMapper studentMapper;

    public void AddStudent(Student student) {
        studentMapper.AddStudent(student);
    }

    public Student SelectStudent(Student student) {
        return studentMapper.SelectStudent(student);
    }

    public Student SelectByStudentId(String student_id) {
        return studentMapper.SelectByStudentId(student_id);
    }


    public boolean updateStudent(String sId, String phone,String name) {
        return studentMapper.updateStudentInfo(sId,phone,name) == 1;
    }

    public List<Student> selectAll() {
        return studentMapper.selectAll();
    }

    public boolean deleteStudent(String sId) {
        return studentMapper.deleteStudent(sId) == 1;
    }
}
