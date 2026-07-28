package AS.Demo.service;

import AS.Demo.dao.KnowledgeMapper;
import AS.Demo.dao.Sub_TeaMapper;
import AS.Demo.dao.SubjectMapper;
import AS.Demo.po.Knowledge;
import AS.Demo.po.Sub_Tea;
import AS.Demo.po.Subject;
import AS.Demo.po.SubjectKnowledge;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author
 * @comm
 */
@Service
public class SubjectService {
    @Autowired
    private SubjectMapper subjectMapper;
    @Autowired
    private KnowledgeMapper knowledgeMapper;
    @Autowired
    private Sub_TeaMapper sub_teaMapper;

    public List<SubjectKnowledge> selectAll() {
        List<SubjectKnowledge> subjectKnowledge = new ArrayList<>();
        List<Subject> subjectList = subjectMapper.selectAll();
        subjectList.forEach(item->{
            SubjectKnowledge subjectKnowledgeObject = new SubjectKnowledge();
            subjectKnowledgeObject.setSubject(item);
            List<Knowledge> know = knowledgeMapper.selectBySubId(item.getId());
            subjectKnowledgeObject.setKnowledgeList(know);
            subjectKnowledge.add(subjectKnowledgeObject);
        });
        return subjectKnowledge;
    }

    public List<Subject> selectByTeaId(String teacher_id) {
        List<Sub_Tea> subNameList = sub_teaMapper.selectByTeacId(teacher_id);
        List<Subject> subjectList = new ArrayList<>();
        for (Sub_Tea sub_tea : subNameList) {
            Subject subject = subjectMapper.selectByName(sub_tea.getSubName());
            subjectList.add(subject);
        }
        return subjectList;
    }

    public boolean addSubject(String name) {
        return subjectMapper.addSubject(name) == 1;
    }

    public List<Subject> selectAllSubject() {
        return subjectMapper.selectAll();
    }

    public boolean updateSubTea(String newSubName, String newTid, String subName, String teaId) {
        return sub_teaMapper.update(newSubName,newTid,subName,teaId) == 1;
    }
}
