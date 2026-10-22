package AS.Demo.po;

/**
 * @author
 * @comm
 */
public class Knowledge {

    private Integer id;

    private Integer subjectId;

    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Knowledge{" +
                "id=" + id +
                ", subjectId=" + subjectId +
                ", name='" + name + '\'' +
                '}';
    }
}
