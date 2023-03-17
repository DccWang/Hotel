package cn.zding.service;

import cn.zding.pojo.Member;
import com.github.pagehelper.PageInfo;

public interface MemberService {

    PageInfo<Member> findPreByPage(Integer page);

    Member findMemberByUserName(String username);

    void addMember(Member member);

    void delMemberByMid(int id);

    Member findMemberById(int mid);

    void upMember(Member member);


    //修改信息
    void updateMember(Member member);

    //修改密码
    void updatePassword(String newPwd,int mid);


    //根据身份证查用户
    Member getMemberByIdentificationNum(String identificationNum);

    int register2(Member member);

    PageInfo<Member> findMemberByName(String userName);

    void upStutById(String id,String stat);
}
