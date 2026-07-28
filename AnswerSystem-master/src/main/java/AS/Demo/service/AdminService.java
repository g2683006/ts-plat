package AS.Demo.service;

import AS.Demo.dao.AdminMapper;
import AS.Demo.po.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Title: AnswerSystem
 * @Description:本controllr使用于登陆注册
 * @Date: 2021
 * @Version: 1.0
 */
@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public void AddAdmin(Admin admin) {
        adminMapper.AddAdmin(admin);
    }

    public Admin SelectAdmin(Admin admin) {
        return adminMapper.SelectAdmin(admin);
    }

    public Admin SelectByAdminId(String admin_id) {
        return adminMapper.SelectByAdminId(admin_id);
    }
}
