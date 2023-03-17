package cn.zding.dao;

import cn.zding.pojo.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserInfoDao {

    @Select("select * from users")
    List<UserInfo> findUserInfo();

    @Insert("insert into users values(#{id},#{email},#{username},#{password},#{phoneNum},#{status},#{position})")
    int addUserInfo(UserInfo userInfo);

    @Select("select * from users where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.zding.dao.RoleDao.findRoleByUserId"))
    })
    UserInfo findById(int id) throws Exception;

    @Update("update users set status = #{status} where id = #{id}")
    void upUserStatusById(@Param("status") String status,@Param("id") int id);

    @Delete("delete from users_role where userid = #{userid} and roleid=#{roleid}")
    void delRoleAndUsers(@Param("userid") int userid,@Param("roleid") int roleid);


    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.zding.dao.RoleDao.findRoleByUserId"))
    })
    UserInfo findByUsername(String username);

    @Select("SELECT * from users where username like concat('%',#{username},'%')")
    List<UserInfo> findUserByName(String username);

    @Update("update users set email=#{email},phoneNum=#{phoneNum},position=#{position} where id=#{id}")
    int updateById(UserInfo userInfo);
}
