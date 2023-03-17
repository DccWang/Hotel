package cn.zding.dao;

import cn.zding.pojo.Permission;
import cn.zding.pojo.Role;
import cn.zding.pojo.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RoleDao {
    
    @Select("select * from role where id in (select roleId from users_role where userId=#{userId})")
//    @Results({
//            @Result(id = true, property = "id", column = "id"),
//            @Result(property = "roleName", column = "roleName"),
//            @Result(property = "roleDesc", column = "roleDesc"),
//            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.zding.dao.PermissionDao.findPermissionByRoleId"))
//    })
    List<Role> findRoleByUserId(Integer userId);
    /**
     * 根据userid查不在此用户下的角色
     * @param userid
     * @return
     */
    @Select("select * from role where id not in (select roleId from users_role where userId= #{id})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
//            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.zding.dao.PermissionDao.findPermissionByRoleId"))

    })
    List<Role> findRoleAllByUserId(int userid);

    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleAddUser(@Param("userId") int userId, @Param("roleId") int roleId);

    @Select("select * from role")
    List<Role> findRole();

    @Insert("insert into role values(#{id},#{roleName},#{roleDesc})")
    void addRole(Role role);

    @Select("select * from role where id = #{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.zding.dao.PermissionDao.findPermissionByRoleId"))

    })
    Role findRoleById(int id);

    @Select("select count(*) from users_role where roleid = #{id}")
    int findUserAndRoleByRoleId(@Param("id") int id);

    @Select("select count(*) from role_permission where roleid = #{id}")
    int findPerAndRole(@Param("id") int id);

    @Delete("delete from users_role where roleid = #{id}")
    void delUserAndRoleByRoleId(@Param("id") int id);

    @Delete("delete from users_role where userid = #{id}")
    void delUserAndRoleByUId(@Param("id") int id);

    @Delete("delete from role_permission where roleid = #{id}")
    void delPerAndRoleByRoleId(@Param("id") int id);

    @Delete("delete from role where id = #{id}")
    void delRoleById(@Param("id") int id);


    /**
     * 根据roelId查不在此用户下的权限
     * @param roleid
     * @return
     */
    @Select("select * from permission where id not in (select permissionid from role_permission where roleid= #{id})")
    List<Permission> findPerByRoleId(int roleid);

    @Insert("insert into role_permission values(#{preId},#{roleId})")
    void addRoleAndPre(@Param("roleId") int roleId,@Param("preId") int preId);

    @Delete("delete from role_permission where roleid = #{roleid} and permissionid=#{permissionid}")
    void delPerAndRole(@Param("roleid") int roleid,@Param("permissionid") int permissionid);


}
