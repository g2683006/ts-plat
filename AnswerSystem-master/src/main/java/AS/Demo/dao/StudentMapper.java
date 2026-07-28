package AS.Demo.dao;

import AS.Demo.po.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Title: AnswerSystem
 * @Description:
 * @Date: 2021
 * @Version: 1.0
 */
@Repository(value = "StudentMapper")
public interface StudentMapper {
    void AddStudent(Student student);

    Student SelectStudent(Student student);

    Student SelectByStudentId(@Param("student_id") String student_id);

    @Update(value = "UPDATE student SET student_phone = #{phone},student_name=#{name} WHERE student_id = #{sId}")
    int updateStudentInfo(@Param("sId") String sId, @Param(value = "phone") String phone,@Param("name") String name);

    @Select(value = "select * from student")
    List<Student> selectAll();

    @Delete(value = "delete from student where student_id = #{sId}")
    Integer deleteStudent(@Param("sId") String sId);

    @Select(value = "select * from student where student_id = #{id}")
    Student selectStudent(@Param("id") String sId);
    @Update(value = "UPDATE student SET student_score = #{score} WHERE student_id = #{sId}")
    void updateScore(@Param("sId") String student_id, @Param("score") Integer student_score);
}
