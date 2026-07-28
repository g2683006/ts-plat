package AS.Demo.controller;

import AS.Demo.dao.KnowledgeMapper;
import AS.Demo.dao.Sub_TeaMapper;
import AS.Demo.po.*;
import AS.Demo.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Title: AnswerSystem
 * @Description:
 * @Date: 2021
 * @Version: 1.0
 */
@Controller
public class droppageController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private Stu_TeaService stu_teaService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private KnowledgeService knowledgeService;


    @RequestMapping(value = "/manage")
    public ModelAndView questionmanage(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView=new ModelAndView("teacher_manage");
        String teacher_id=request.getParameter("teacher_id");
        Teacher teacher=teacherService.SelectByTeacherId(teacher_id);
        List<Stu_Tea> stu_teaList=stu_teaService.SelectByteacherId(teacher_id);
        List<Question> questionList=questionService.SelectByPoId("test");
        for (int i=0;i<stu_teaList.size();i++){
            String student_id=stu_teaList.get(i).getStudent_id();
            List<Question> questionList1=questionService.SelectByPoId(student_id);
            if (!questionList1.isEmpty()){
                questionList.addAll(questionList1);
            }
        }
        modelAndView.addObject("teacher_id",teacher_id);
        modelAndView.addObject("questionList",questionList);
        return modelAndView;
    }

    @RequestMapping(value = "updateSubTea")
    public ModelAndView updateSubTea(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        String newSubName = request.getParameter("newSubName");
        String newTid = request.getParameter("newTid");
        String subName = request.getParameter("subName");
        String teaId = request.getParameter("teaId");
        System.out.println(newSubName);
        System.out.println(newTid);
        System.out.println(subName);
        System.out.println(teaId);
        subjectService.updateSubTea(newSubName,newTid,subName,teaId);
        modelAndView.addObject("message","修改成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/subjectManage");
        return modelAndView;
    }

    @RequestMapping(value = "showUpdateSub",method = RequestMethod.GET)
    public ModelAndView showUpdateSub(HttpServletRequest request) throws UnsupportedEncodingException{
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("sub_tea_update");
        Sub_Tea sub_tea = new Sub_Tea();
        sub_tea.setSubName(request.getParameter("name"));
        sub_tea.setTeaId(request.getParameter("id"));
        modelAndView.addObject("item",sub_tea);
        List<Subject> subjectList = subjectService.selectAllSubject();
        List<Teacher> teacherList = teacherService.selectAll();
        modelAndView.addObject("subList",subjectList);
        modelAndView.addObject("teaList",teacherList);
        return modelAndView;
    }


    @RequestMapping(value = "subjectManage")
    public ModelAndView subjectManage(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("subject_manage");
        List<TeacherSubjectVO> list = teacherService.selectTeacherAndSubject();
        List<Subject> subjectList = subjectService.selectAllSubject();
        List<Teacher> teacherList = teacherService.selectAll();
        modelAndView.addObject("list",list);
        modelAndView.addObject("subList",subjectList);
        modelAndView.addObject("teaList",teacherList);
        return modelAndView;
    }

    @RequestMapping(value = "deleteSubTea")
    public ModelAndView deleteSubTea(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        teacherService.deleteSubTea(request.getParameter("name"),request.getParameter("tId"));
        modelAndView.addObject("message","删除成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/subjectManage");
        return modelAndView;
    }

    @RequestMapping(value = "addSubjectAndTeacher")
    public ModelAndView addSubjectAndTeacher(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        teacherService.addSubTea(request.getParameter("subName"),request.getParameter("tId"));
        modelAndView.addObject("message","添加成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/subjectManage");
        return modelAndView;
    }

    @RequestMapping("addSubject")
    public ModelAndView addSubject(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        subjectService.addSubject(request.getParameter("name"));
        modelAndView.addObject("message","添加成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/subjectManage");
        return modelAndView;
    }

    @RequestMapping(value = "/teacher_stumanage")
    public ModelAndView teacher_stumanage(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView=new ModelAndView("teacher_stumanage");
        String teacher_id=request.getParameter("teacher_id");
        List<Stu_Tea> stu_teaList= stu_teaService.SelectByteacherId(teacher_id);
        Student student=new Student();
        List<Student> studentList=new ArrayList<Student>();
        for (int i = 0; i < stu_teaList.size(); i++) {
            student=studentService.SelectByStudentId(stu_teaList.get(i).getStudent_id());
            studentList.add(student);
        }
        modelAndView.addObject("teacher_id",teacher_id);
        modelAndView.addObject("stu_teaList",stu_teaList);
        modelAndView.addObject("studentList",studentList);
        return modelAndView;
    }

    @RequestMapping(value = "/adminCustomerManages")
    public ModelAndView adminStumanage(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView=new ModelAndView("adminCustomerManage");
        List<Student> studentList = studentService.selectAll();
        List<Teacher> teacherList = teacherService.selectAll();
        modelAndView.addObject("teacherList",teacherList);
        modelAndView.addObject("studentList",studentList);
        return modelAndView;
    }

    @RequestMapping(value = "deleteStudent")
    public ModelAndView deleteStudent(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        studentService.deleteStudent(request.getParameter("sId"));
        modelAndView.addObject("message","删除成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/adminCustomerManages");
        return modelAndView;
    }

    @RequestMapping(value = "deleteTeacher")
    public ModelAndView deleteTeacher(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        teacherService.deleteTeacher(request.getParameter("tId"));
        modelAndView.addObject("message","删除成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/adminCustomerManages");
        return modelAndView;
    }

    @RequestMapping(value = "/teacher_subject")
    public ModelAndView teacher_subject(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("teacher_submessage");
        modelAndView.addObject("subList",stu_teaService.selectSelfSub(request.getParameter("teacher_id")));
        return modelAndView;
    }

    @RequestMapping(value = "teacher_knowledge")
    public ModelAndView managementKnowledge(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("teacher_knowledge");
        //科目信息
        List<Subject> subjectList = subjectService.selectByTeaId(request.getParameter("teacher_id"));
        request.getSession().setAttribute("teacherId",request.getParameter("teacher_id"));
        modelAndView.addObject("subList",subjectList);
        //当前知识点信息
        List<KnowVO> knowledges = knowledgeService.selectKnowledge(subjectList);
        //知识点提问次数
        List<Statistics> statistics = knowledgeService.counts(subjectList);
        modelAndView.addObject("knowList",knowledges);
        modelAndView.addObject("countList",statistics);
        return modelAndView;
    }


    @RequestMapping(value = "addKnowledge")
    public ModelAndView addKnowledge(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        String name = request.getParameter("name");
        String subId = request.getParameter("subId");
        modelAndView.addObject("message","添加成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/teacher_knowledge?teacher_id="+request.getSession().getAttribute("teacherId"));
        knowledgeService.add(name,subId);
        return modelAndView;
    }

    @RequestMapping(value = "/deleteKnowledge")
    public ModelAndView deleteKnowledge(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        knowledgeService.deleteKnowledge(request.getParameter("id"));
        modelAndView.addObject("message","删除成功");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/teacher_knowledge?teacher_id="+request.getSession().getAttribute("teacherId"));
        return modelAndView;
    }

    @RequestMapping(value = "/showUpdate",method = RequestMethod.GET)
    public ModelAndView updateKnowledgeshow(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("teacher_knowledge_update");
        System.out.println("----------"+request.getParameter("id"));
        Knowledge knowledge = knowledgeService.selectKnowledgeOne(request.getParameter("id"));
        modelAndView.addObject("item",knowledge);
        return modelAndView;
    }

    @RequestMapping(value = "/updateKnowledge")
    public ModelAndView updateKnowledge(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        System.out.println(!request.getParameter("name").equals(""));
        if(request.getParameter("name").equals("")){
            modelAndView.addObject("message", "修改失败");
        }else{
            boolean result = knowledgeService.update(request.getParameter("name"),request.getParameter("id"));
            if(result) {
                modelAndView.addObject("message", "修改成功");
            }else{
                modelAndView.addObject("message", "修改失败");
            }
        }
        modelAndView.addObject("router", "/AnswerSystem_war_exploded/teacher_knowledge?teacher_id=" + request.getSession().getAttribute("teacherId"));
        return modelAndView;
    }

    @RequestMapping(value = "/studentinfo")
    public ModelAndView student_info(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("student_info");
        Student student=studentService.SelectByStudentId(request.getParameter("student_id"));
        modelAndView.addObject("student",student);
        return modelAndView;
    }

    @RequestMapping(value = "/studentUpdate")
    public ModelAndView studentUpdateMessage(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        modelAndView.addObject("message","修改成功!");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/studentinfo.action?student_id="+request.getParameter("sId"));
        studentService.updateStudent(request.getParameter("sId"),request.getParameter("phone"),request.getParameter("name"));
        return modelAndView;
    }

    @RequestMapping(value = "/teacherUpdate")
    public ModelAndView teacherUpdate(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("update_success");
        modelAndView.addObject("message","修改成功!");
        modelAndView.addObject("router","/AnswerSystem_war_exploded/teacherinfo?teacher_id="+request.getParameter("tId"));
        teacherService.updateTeacher(request.getParameter("tId"),request.getParameter("phone"),request.getParameter("name"));
        return modelAndView;
    }

    @RequestMapping(value = "/teacherinfo")
    public ModelAndView teacher_info(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("teacher_info");
        Teacher teacher=teacherService.SelectByTeacherId(request.getParameter("teacher_id"));
        modelAndView.addObject("teacher",teacher);
        return modelAndView;
    }
}
