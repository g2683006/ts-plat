package AS.Demo.dao;

import AS.Demo.po.Question;
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
@Repository(value="QuestionMapper")
public interface QuestionMapper {
//    增加问题
    void AddQuestion(Question question);
    //    删除问题
    void DeleteQuestion(String question_id);

    //    按照标题关键字查找问题(模糊查找)
    List<Question> SelectByQuestionTitle(@Param("question_title") String question_title);

//    查找所有问题
    List<Question> SelectAllQuestion();

    //    按照ID查找对应问题
    Question SelectByQuestionId(String question_id);

//    根据本人查寻本人发布的问题
   List<Question> SelectByPoId(String question_poid);

    void UpdateByQuestionId(@Param("question_id") String question_id,@Param("teacher_id") String teacher_id,@Param("answer_des")String answer_des,@Param("question_time")String question_time);

    @Select(value = "SELECT COUNT(0) FROM `question` WHERE knowId = #{id}")
    Integer getCount(@Param("id") Integer id);

    @Select(value = "select question_poid from question where question_id = #{id}")
    String selectStudent(@Param("id") String question_id);

    @Update(value = "UPDATE question SET answer_des=#{answer_des},answer_poid=#{teacher_id},answer_time=#{question_time},question_score=#{score} WHERE question_id=#{question_id}")
    void UpdateByQuestionIds(@Param("question_id") String question_id,@Param("teacher_id") String teacher_id,@Param("answer_des") String answer_des,@Param("question_time") String question_time,@Param("score") Integer score);
}
