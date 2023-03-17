package cn.zding.service.Impl;

import cn.zding.dao.PermissionDao;
import cn.zding.dao.RoleDao;
import cn.zding.dao.UserInfoDao;
import cn.zding.pojo.Permission;
import cn.zding.pojo.Role;
import cn.zding.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> findRoleByUserId(int id) {
        List<Role> roleByUserId = roleDao.findRoleAllByUserId(id);


        return roleByUserId;
    }

    @Override
    public void addRoleAddUser(int userId, int[] roleIds) {
        for (int roleId : roleIds) {
            roleDao.addRoleAddUser(userId,roleId);
        }
    }

    @Override
    public PageInfo<Role> findRoleByPage(Integer page) {
        PageHelper.startPage(page,5);
        List<Role> userInfo = roleDao.findRole();
        PageInfo<Role> role = new PageInfo<>(userInfo);
        return role;
    }

    @Override
    public void addRole(Role role) {
        roleDao.addRole(role);
    }

    @Override
    public Role findRoleById(int id) {
        return roleDao.findRoleById(id);
    }

    @Override
    public void delRoleById(int id) {
        
        int userRole = roleDao.findUserAndRoleByRoleId(id);

        int perRole = roleDao.findPerAndRole(id);

        if (userRole != 0){
            roleDao.delUserAndRoleByRoleId(id);
        }else if (perRole != 0){
            roleDao.delPerAndRoleByRoleId(id);
        }
        roleDao.delRoleById(id);
    }

    @Override
    public List<Permission> findPerByRoleId(int id) {
        return roleDao.findPerByRoleId(id);
    }

    @Override
    public void addPrePole(int roleId, int[] ids) {
        for (int preId : ids) {
            roleDao.addRoleAndPre(roleId,preId);
        }
    }

    @Override
    public void delPerAndRole(int roleid, int permissionid) {
        roleDao.delPerAndRole(roleid,permissionid);
    }

    @Override
    public void delUserAndRoleByUId(int id) {
        roleDao.delUserAndRoleByUId(id);
    }
}
