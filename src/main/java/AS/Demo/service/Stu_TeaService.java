package AS.Demo.service;

import AS.Demo.dao.Stu_TeaMapper;
import AS.Demo.dao.Sub_TeaMapper;
import AS.Demo.dao.SubjectMapper;
import AS.Demo.dao.TeacherMapper;
import AS.Demo.po.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Title: AnswerSystem
 * @Description:
 * @Date: 2021
 * @Version: 1.0
 */
@Service
public class Stu_TeaService {
    @Autowired
    private Stu_TeaMapper stu_teaMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private Sub_TeaMapper sub_teaMapper;

    public void AddContact(String student_id, String teacher_id) {
        stu_teaMapper.AddContact(student_id, teacher_id);
    }

    public List<Stu_Tea> SelectByteacherId(String teacher_id) {
        return stu_teaMapper.SelectByteacherId(teacher_id);
    }

    public void DeleteContact(String student_id, String teacher_id) {
        stu_teaMapper.DeleteContact(student_id, teacher_id);
    }


    public List<TeacherSubjectVO> getTeacherAndSubject(String sId) {
        List<TeacherSubjectVO> list = new ArrayList<>();
        List<String> teaIdList = stu_teaMapper.selectAllBysId(sId);
        List<Teacher> teacherList = teacherMapper.selectTeacherById(teaIdList);
        for (Teacher teacher : teacherList) {
            List<Sub_Tea> subList = sub_teaMapper.selectByTeacId(teacher.getTeacher_id());
            for (Sub_Tea sub_tea : subList) {
                TeacherSubjectVO teacherSubjectVO = new TeacherSubjectVO();
                teacherSubjectVO.setTeacher(teacher);
                teacherSubjectVO.setSubjectName(sub_tea.getSubName());
                list.add(teacherSubjectVO);
            }
        }
        return list;
    }

    public List<Sub_Tea> selectSelfSub(String tId) {
        System.out.println(tId);
        return sub_teaMapper.selectByTeacId(tId);
    }
}
