package cn.zding.service;

import cn.zding.pojo.UserInfo;
import com.github.pagehelper.PageInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import javax.servlet.http.HttpSession;

public interface UserService extends UserDetailsService {

    PageInfo<UserInfo> findUserInfoByPage(Integer page);

    int addUserInfo(UserInfo userInfo);

    UserInfo findUserById(int id) throws Exception;

    void upUserStatus(String status,int id);

    void delRoleAndUsers(int userid,int roleid);

    PageInfo<UserInfo> findUserByName(String username);

    int updateById(UserInfo userInfo);
}
