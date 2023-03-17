package cn.zding.service;

import cn.zding.pojo.Permission;
import cn.zding.pojo.Role;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleService {
    List<Role> findRoleByUserId(int id);

    void addRoleAddUser(int userId, int[] roleIds);

    PageInfo<Role> findRoleByPage(Integer page);

    void addRole(Role role);

    Role findRoleById(int id);

    void delRoleById(int id);

    List<Permission> findPerByRoleId(int id);

    void addPrePole(int roleId, int[] ids);

    void delPerAndRole(int roleid, int permissionid);

    void delUserAndRoleByUId(int id);
}
