package AS.Demo.controller;

import AS.Demo.po.Admin;
import AS.Demo.po.Student;
import AS.Demo.po.Teacher;
import AS.Demo.service.TeacherService;
import AS.Demo.service.StudentService;
import AS.Demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * @Title: AnswerSystem
 * @Description:
 * @Date: 2021
 * @Version: 1.0
 */
@Controller
public class loginController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login")
    public ModelAndView loginCheck(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        System.out.println(request.getContextPath());
        if (request.getParameter("stu_tea").equals("0")) {
            System.out.println("进入学生操作");
            System.out.println(request.getParameter("id"));
            ModelAndView modelAndView = new ModelAndView("student_menu");
            Student student = new Student();
            student.setStudent_id(request.getParameter("id"));
            student.setStudent_password(request.getParameter("password"));
            student = studentService.SelectStudent(student);
            System.out.println(student);
            if (student != null) {
                modelAndView.addObject("student", student);
                return modelAndView;
            } else {
                return new ModelAndView("redirect:/jsp/error.html");
            }
        } else if (request.getParameter("stu_tea").equals("1")) {
            System.out.println("进入教师操作");
            ModelAndView modelAndView = new ModelAndView("teacher_menu");
            Teacher teacher = new Teacher();
            teacher.setTeacher_id(request.getParameter("id"));
            teacher.setTeacher_password(request.getParameter("password"));
            teacher = teacherService.SelectTeacher(teacher);
            if (teacher != null) {
                modelAndView.addObject("teacher", teacher);
                return modelAndView;
            } else {
                return new ModelAndView("redirect:/jsp/error.html");
            }
        }
        else{
            System.out.println("进入管理员操作");
            ModelAndView modelAndView = new ModelAndView("admin_menu");
            Admin admin = new Admin();
            admin.setAdmin_id(request.getParameter("id"));
            admin.setAdmin_password(request.getParameter("password"));
            admin = adminService.SelectAdmin(admin);
            if (admin != null) {
                modelAndView.addObject("admin", admin);
                return modelAndView;
            } else {
                return new ModelAndView("redirect:/jsp/error.html");
            }

        }
    }

}
