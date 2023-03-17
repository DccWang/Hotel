package cn.zding.service.Impl;

import cn.zding.dao.RoleDao;
import cn.zding.dao.UserInfoDao;
import cn.zding.pojo.Role;
import cn.zding.pojo.UserInfo;
import cn.zding.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
@Service("userService2")
public class UserServiceImpl extends HttpServlet implements UserService{

    @Autowired
    private UserInfoDao userInfoDao;

    @Autowired
    private RoleDao roleDao;

    @Override
    public PageInfo<UserInfo> findUserInfoByPage(Integer page) {
        PageHelper.startPage(page,5);
        List<UserInfo> userInfo = userInfoDao.findUserInfo();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfo);
        return pageInfo;
    }

    @Override
    public int addUserInfo(UserInfo userInfo) {
        return userInfoDao.addUserInfo(userInfo);
    }

    @Override
    public UserInfo findUserById(int id) throws Exception {
        return userInfoDao.findById(id);
    }

    @Override
    public void upUserStatus(String status,int id) {
        roleDao.delUserAndRoleByUId(id);
        userInfoDao.upUserStatusById(status,id);
    }

    @Override
    public void delRoleAndUsers(int userid,int roleid) {
        userInfoDao.delRoleAndUsers(userid,roleid);
    }

    @Override
    public PageInfo<UserInfo> findUserByName(String username) {
        PageHelper.startPage(1,100);
        List<UserInfo> userInfo = userInfoDao.findUserByName(username);
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfo);
        return pageInfo;
    }

    @Override
    public int updateById(UserInfo userInfo) {
        return userInfoDao.updateById(userInfo);
    }


    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }

    @Override
    public UserDetails loadUserByUsername(String username)  {
        UserInfo userInfo = null;
        try {
            userInfo = userInfoDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象封装成UserDetails
        assert userInfo != null;
//        User user=new User(userInfo.getUsername(),"{noop}"+userInfo.getPassword(),getAuthority(userInfo.getRoles()));
        User user = new User(userInfo.getUsername(), "{noop}"+userInfo.getPassword(), userInfo.getStatus() == 0 ? false : true, true, true, true, getAuthority(userInfo.getRoles()));
        System.out.println(user);
        return user;
    }
}
