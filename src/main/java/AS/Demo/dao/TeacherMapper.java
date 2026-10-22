package AS.Demo.dao;

import AS.Demo.po.Teacher;
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
@Repository(value = "TeacherMapper")
public interface TeacherMapper {
    void AddTeacher(Teacher teacher);

    Teacher SelectTeacher(Teacher teacher);

    Teacher SelectByTeacherId(@Param("teacher_id") String teacher_id);

    @Select(value = "<script>"
            + "SELECT * FROM teacher WHERE teacher_id IN "
            + "<foreach item='item' index='index' collection='teaIdList' open='(' separator=',' close=')'>"
            + "#{item}"
            + "</foreach>"
            + "</script>")
    List<Teacher> selectTeacherById(@Param("teaIdList") List<String> teaIdList);

    @Update(value = "UPDATE teacher SET teacher_phone = #{phone},teacher_name=#{name} WHERE teacher_id = #{tId}")
    void updateTeacher(@Param("tId") String tId,@Param("phone") String phone,@Param("name") String name);

    @Select(value = "select * from teacher")
    List<Teacher> selectAll();

    @Delete(value = "delete from teacher where teacher_id = #{id}")
    Integer deleteTeacher(@Param("id") String tId);
}
