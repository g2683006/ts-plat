package AS.Demo.dao;

import AS.Demo.po.Sub_Tea;
import AS.Demo.po.TeacherSubjectVO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "Sub_TeaMapper")
public interface Sub_TeaMapper {

    @Select(value = "select * from sub_tea where teaId = #{tId}")
    List<Sub_Tea> selectByTeacId(@Param("tId") String teacher_id);

    @Insert(value = "INSERT INTO `sub_tea` VALUES(#{name},#{tid})")
    int insert(@Param("name") String subName, @Param("tid") String tId);

    @Delete(value = "delete from sub_tea where subName = #{name} and teaId = #{tId}")
    int delete(@Param("name") String name, @Param("tId") String tId);

    @Update(value = "update sub_tea set subName = #{newSubName},teaId = #{newTid} where subName = #{subName} and teaId = #{teaId}")
    int update(@Param("newSubName") String newSubName,@Param("newTid") String newTid,@Param("subName") String subName,@Param("teaId") String teaId);
}
