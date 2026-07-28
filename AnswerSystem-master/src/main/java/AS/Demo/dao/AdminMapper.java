package AS.Demo.dao;

import AS.Demo.po.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @Title: AnswerSystem
 * @Description:
 * @Date: 2021
 * @Version: 1.0
 */
@Repository(value = "AdminMapper")
public interface AdminMapper {

    void AddAdmin(Admin admin);

    Admin SelectAdmin(Admin admin);

    Admin SelectByAdminId(@Param("admin_id") String admin_id);
}
