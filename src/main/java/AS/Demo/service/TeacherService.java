package AS.Demo.service;

import AS.Demo.dao.Sub_TeaMapper;
import AS.Demo.dao.TeacherMapper;
import AS.Demo.po.Sub_Tea;
import AS.Demo.po.Teacher;
import AS.Demo.po.TeacherSubjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Title: AnswerSystem
 * @Description:本controllr使用于登陆注册
 * @Date: 2021
 * @Version: 1.0
 */
@Service
public class TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private Sub_TeaMapper sub_teaMapper;

    public void AddTeacher(Teacher teacher) {
        teacherMapper.AddTeacher(teacher);
    }

    public Teacher SelectTeacher(Teacher teacher) {
        return teacherMapper.SelectTeacher(teacher);
    }

    public Teacher SelectByTeacherId(String teacher_id) {
        return teacherMapper.SelectByTeacherId(teacher_id);
    }

    public void updateTeacher(String tId, String phone,String name) {
        teacherMapper.updateTeacher(tId, phone,name);
    }

    public List<Teacher> selectAll() {
        return teacherMapper.selectAll();
    }

    public boolean deleteTeacher(String tId) {
        return teacherMapper.deleteTeacher(tId) == 1;
    }

    public List<TeacherSubjectVO> selectTeacherAndSubject() {
        List<TeacherSubjectVO> teacherSubjectVOS = new ArrayList<>();
        List<Teacher> teacherList = teacherMapper.selectAll();
        for (Teacher teacher : teacherList) {
            List<Sub_Tea> sub_teas = sub_teaMapper.selectByTeacId(teacher.getTeacher_id());
            for (Sub_Tea sub_tea : sub_teas) {
                TeacherSubjectVO teacherSubjectVO = new TeacherSubjectVO();
                teacherSubjectVO.setTeacher(teacher);
                teacherSubjectVO.setSubjectName(sub_tea.getSubName());
                teacherSubjectVOS.add(teacherSubjectVO);
            }
        }
        return teacherSubjectVOS;
    }

    public boolean addSubTea(String subName, String tId) {
        return sub_teaMapper.insert(subName,tId) == 1;
    }

    public boolean deleteSubTea(String name, String tId) {
        return sub_teaMapper.delete(name,tId) == 1;
    }
}
