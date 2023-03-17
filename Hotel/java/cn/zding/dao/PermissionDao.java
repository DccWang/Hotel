package cn.zding.dao;

import cn.zding.pojo.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionDao {

    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id} )")
    List<Permission> findPermissionByRoleId(int id);

    @Select("select * from permission")
    List<Permission> findRole();

    @Insert("insert into permission values(#{id},#{permissionName},#{url})")
    void addPer(Permission permission);

    @Delete("delete from permission where id=#{id}")
    void delPerById(int id);

}
