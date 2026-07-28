package AS.Demo.dao;

import AS.Demo.po.Knowledge;
import AS.Demo.po.Subject;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "KnowledgeMapper")
public interface KnowledgeMapper {

    @Select(value = "SELECT * FROM knowledge WHERE subjectId = #{subId}")
    List<Knowledge> selectBySubId(@Param("subId") Integer id);


    @Select(value = "SELECT `name` FROM knowledge WHERE id = #{knowId}")
    String selectNameById(@Param("knowId") String knowId);

    @Select(value = "<script>"
            + "SELECT * FROM knowledge WHERE subjectId IN "
            + "<foreach item='item' index='index' collection='collect' open='(' separator=',' close=')'>"
            + "#{item}"
            + "</foreach>"
            + "</script>")
    List<Knowledge> selectAllInList(@Param("collect") List<Integer> collect);

    @Insert(value = "insert into knowledge values (default,#{subId},#{name})")
    void insert(@Param("name") String name, @Param("subId") String subId);

    @Delete(value = "delete from knowledge where id = #{id}")
    void deleteById(@Param("id") String id);

    @Select(value = "select * from knowledge where id = #{id}")
    Knowledge selectOneById(@Param("id") String id);

    @Update(value = "update knowledge set `name` = #{name} where id = #{id}")
    int update(@Param("name") String name,@Param("id") String id);
}
