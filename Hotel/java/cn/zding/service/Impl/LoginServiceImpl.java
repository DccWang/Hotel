package cn.zding.service.Impl;

import cn.zding.dao.LoginDao;
import cn.zding.pojo.Member;
import cn.zding.pojo.UserInfo;
import cn.zding.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    @Override
    public Member loginMember(String userName,String passWord) {
        try{
            return loginDao.memberLogin(userName, passWord);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public void memberRegister(Member member) {
        loginDao.memberRegister(member);
    }

    @Override
    public UserInfo UserInfoLogin(String username, String password) {
        return loginDao.UserInfoLogin(username, password);
    }
}
