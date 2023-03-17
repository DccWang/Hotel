package cn.zding.service;

import cn.zding.pojo.Member;
import cn.zding.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;

public interface LoginService {

    //登录
    Member loginMember(String userName,String passWord);

    //注册
    void memberRegister(Member member);

    UserInfo UserInfoLogin(String username, String password);
}
