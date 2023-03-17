package cn.zding.controller;

import cn.zding.pojo.House;
import cn.zding.pojo.Member;
import cn.zding.service.HouseService;
import cn.zding.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@RestController
public class RegUserNameController{
    @Autowired
    private MemberService memberService;

    @Autowired
    private HouseService houseService;

    @RequestMapping("/regUserName")
    public void doPost(String userName,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        System.out.println(userName);
        String smg = request.getParameter("smg");
//        System.out.println("smg:"+smg);
        String json="null";
        if (smg.equals("register")){
            Member member = memberService.findMemberByUserName(userName);
//            System.out.println("member:"+member);
            if (member==null){
                json="{\"msg\":\"\"}";
            }else {
                json="{\"msg\":\"该用户名已存在\"}";
            }
        }
        response.getWriter().write(json);

    }

    @RequestMapping("/regIdentificationNum")
    public void regIdentificationNum(String identificationNum,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
//        System.out.println(userName);
        String smg = request.getParameter("smg");
//        System.out.println("smg:"+smg);
        String json="null";
        if (smg.equals("register")){
            Member member = memberService.getMemberByIdentificationNum(identificationNum);
//            System.out.println("member:"+member);
            if (member==null){
                json="{\"msg\":\"\"}";
            }else {
                json="{\"msg\":\"该身份证已被注册\"}";
            }
        }
        response.getWriter().write(json);

    }


    @RequestMapping("/regHouseNum")
    public void regHouseNum(int houseNum,HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
//        System.out.println(userName);
        String smg = request.getParameter("smg");
//        System.out.println("smg:"+smg);
        String json="null";
        if (smg.equals("register")){
            House house = houseService.findByNum(houseNum);
//            System.out.println("member:"+member);
            if (house==null){
                json="{\"msg\":\"\"}";
            }else {
                json="{\"msg\":\"该房间已存在\"}";
            }
        }
        response.getWriter().write(json);

    }

}
