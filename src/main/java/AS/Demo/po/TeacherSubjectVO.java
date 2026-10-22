package AS.Demo.po;

/**
 * @author
 * @comm
 */
public class TeacherSubjectVO {

    private Teacher teacher;

    private String SubjectName;

    @Override
    public String toString() {
        return "TeacherSubjectVO{" +
                "teacher=" + teacher +
                ", SubjectName='" + SubjectName + '\'' +
                '}';
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String subjectName) {
        SubjectName = subjectName;
    }
}
