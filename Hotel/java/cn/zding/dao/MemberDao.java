package cn.zding.dao;

import cn.zding.pojo.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface MemberDao {

    @Select("select * from member")
    List<Member> findMember();

    //根据用户名查用户
    @Select("select * from member where userName=#{userName}")
    Member findMemberByUserName(@Param("userName") String userName);

    @Insert("insert into member values(#{mid},#{userName},#{passWord},#{nickName},#{realName},#{sex},#{identificationNum},#{telephone},#{email},1)")
    void addMember(Member member);

    @Delete("delete from member where mid = #{mid}")
    void delMemberBymid(int mid);

    @Select("select * from member where mid = #{mid}")
    Member findMemberById(int mid);


    @Update("update member set userName = #{userName},passWord = #{passWord},nickName = #{nickName},realName = #{realName},sex = #{sex},identificationNum = #{identificationNum},telephone = #{telephone},email = #{email} where mid = #{mid}")
    void upMember(Member member);



    //修改信息
    @Update("update member set  nickName=#{nickName},sex=#{sex},telephone=#{telephone},email=#{email} where mid = #{mid}")
    void updateMember(Member member);

    //修改密码
    @Update("update member set passWord=#{newPwd} where mid=#{mid}")
    void updatePassword(@Param("newPwd") String newPwd,@Param("mid") int mid);


    //根据身份证查用户
    @Select("select * from member where identificationNum=#{identificationNum}")
    Member findMemberByIdentificationNum(@Param("identificationNum") String identificationNum);

    @Select("select * from member where mid=#{memberId}")
    Member findMemberBymId(Integer memberId);

    //插入一条记录，并且显示刚插入的id
    @Insert("insert into member(userName,passWord,nickName,realName,sex,identificationNum,telephone,email,stat) " +
            "values(#{userName},#{passWord},#{nickName},#{realName},#{sex},#{identificationNum},#{telephone},#{email},0)")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    void register2(Member member);

    @Select("select * from member where userName=#{userName}")
    Member findByUserNcame(String userName);

    @Select("SELECT * from member where username like concat('%',#{username},'%')")
    List<Member> findUserByName(String userName);

    @Update("update member set stat=#{stat} where mid=#{id}")
    void upStutById(@Param("id") String id,@Param("stat") String stat);
}
