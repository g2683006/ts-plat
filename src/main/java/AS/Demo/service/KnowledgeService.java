package AS.Demo.service;

import AS.Demo.dao.KnowledgeMapper;
import AS.Demo.dao.QuestionMapper;
import AS.Demo.dao.SubjectMapper;
import AS.Demo.po.KnowVO;
import AS.Demo.po.Knowledge;
import AS.Demo.po.Statistics;
import AS.Demo.po.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author
 * @comm
 */
@Service
public class KnowledgeService {
    @Autowired
    private KnowledgeMapper knowledgeMapper;
    @Autowired
    private SubjectMapper subjectMapper;
    @Autowired
    private QuestionMapper questionMapper;

    public List<KnowVO> selectKnowledge(List<Subject> subjectList) {
        List<Integer> collect = subjectList.stream().map(item -> {
            return item.getId();
        }).collect(Collectors.toList());
        List<KnowVO> collect1 = knowledgeMapper.selectAllInList(collect).stream().map(item -> {
            KnowVO knowVO = new KnowVO();
            knowVO.setName(item.getName());
            knowVO.setId(item.getId());
            knowVO.setSubId(item.getSubjectId());
            knowVO.setSubName(subjectMapper.selectName(item.getSubjectId()));
            return knowVO;
        }).collect(Collectors.toList());
        return collect1;
    }

    public void add(String name, String subId) {
        knowledgeMapper.insert(name,subId);
    }

    public void deleteKnowledge(String id) {
        knowledgeMapper.deleteById(id);
    }

    public Knowledge selectKnowledgeOne(String id) {
        return knowledgeMapper.selectOneById(id);
    }

    public boolean update(String name, String id) {
        return knowledgeMapper.update(name,id) == 1;
    }

    public List<Statistics> counts(List<Subject> subjectList){
        List<Integer> collect = subjectList.stream().map(item -> {
            return item.getId();
        }).collect(Collectors.toList());

        List<Knowledge> kid = knowledgeMapper.selectAllInList(collect);
        List<Statistics> statistics = new ArrayList<>();
        for (Knowledge knowledge : kid) {
            Statistics statistics1 = new Statistics();
            statistics1.setCount(questionMapper.getCount(knowledge.getId()));
            statistics1.setName(knowledge.getName());
            statistics.add(statistics1);
        }
        statistics = statistics.stream().sorted((e1,e2)-> -(e1.getCount().compareTo(e2.getCount()))).collect(Collectors.toList());
        return statistics;
    }
}
