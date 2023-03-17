package cn.zding.controller;

import cn.zding.pojo.Member;
import cn.zding.pojo.UserInfo;
import cn.zding.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;


    //登录
    @RequestMapping("/member")
    public String login(@ModelAttribute Member member, HttpSession session){
        Member member1 = loginService.loginMember(member.getUserName(), member.getPassWord());
        if(member1==null){
            return "fail";
        }else{
            session.setAttribute("member1",member1);
            String stat = member1.getStat();
            if (stat.equals("1")){
                return "main";
            }else {
                return "failer";
            }
        }




    }

    //注册
    @RequestMapping("/register")
    public String register(Member member){
        loginService.memberRegister(member);
        return "login";
    }


    @RequestMapping("/user")
    public String userlogin(@ModelAttribute UserInfo userInfo, HttpSession session){
        Member userInfo1 = loginService.loginMember(userInfo.getUsername(), userInfo.getPassword());
        if(userInfo1!=null){
            session.setAttribute("userInfo1",userInfo1.getUserName());
            return "back/admin_main";
        }else{
            return "back/admin_login";

        }

    }

}
