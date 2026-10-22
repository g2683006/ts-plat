package AS.Demo.dao;

import AS.Demo.po.Subject;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "SubjectMapper")
public interface SubjectMapper {
    @Select(value = "SELECT * FROM subject")
    List<Subject> selectAll();

    @Select(value = "SELECT `name` FROM subject WHERE id = #{subId}")
    String selectNameById(@Param("subId") String subId);

    @Select(value = "select * from subject where name = #{name}")
    Subject selectByName(@Param("name") String subName);

    @Select(value = "select name from subject where id = #{id}")
    String selectName(@Param("id") Integer subjectId);

    @Insert(value = "INSERT INTO `subject` VALUES(DEFAULT,#{name})")
    Integer addSubject(@Param("name") String name);
}
