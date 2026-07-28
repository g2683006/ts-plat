package AS.Demo.po;

import java.util.List;

/**
 * @author
 * @comm
 */
public class SubjectKnowledge {

    private Subject subject;

    private List<Knowledge> knowledgeList;

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public List<Knowledge> getKnowledgeList() {
        return knowledgeList;
    }

    public void setKnowledgeList(List<Knowledge> knowledgeList) {
        this.knowledgeList = knowledgeList;
    }

    @Override
    public String toString() {
        return "SubjectKnowledge{" +
                "subject=" + subject +
                ", knowledgeList=" + knowledgeList +
                '}';
    }
}
