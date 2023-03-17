package cn.zding.dao;

import cn.zding.pojo.Member;

import cn.zding.pojo.UserInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginDao {

    //用户登入
    @Select("select * from member where userName=#{userName} and passWord=#{passWord}")
    Member memberLogin(@Param("userName") String userName,@Param("passWord") String passWord);

    //注册
    @Insert("insert into member(userName,passWord,nickName,realName,sex,identificationNum,telephone,email,stat) values(#{userName},#{passWord},#{nickName},#{realName},#{sex},#{identificationNum},#{telephone},#{email},1)")
    void memberRegister(Member member);

    //管理员
    @Select("select * from users where username=#{username} and password=#{password}")
    UserInfo UserInfoLogin(@Param("username") String username, @Param("password") String password);

}
