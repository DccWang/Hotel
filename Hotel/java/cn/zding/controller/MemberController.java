package cn.zding.controller;

import cn.zding.pojo.Member;
import cn.zding.pojo.Order;
import cn.zding.pojo.Permission;
import cn.zding.pojo.UserInfo;
import cn.zding.service.HouseService;
import cn.zding.service.MemberService;
import cn.zding.service.OrderService;
import cn.zding.utils.HanZiToPinYinUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberServiceImpl;
    @Autowired
    private OrderService orderService;
    @Autowired
    private HouseService houseService;


    /**
     * 分页
     * @param page
     * @return
     */
    @RequestMapping("/findAllByPage.do")
    public String findPage(Integer page, HttpSession session){
        if (page == null || page == 0){
            page = 1;
        }
        PageInfo<Member> role = memberServiceImpl.findPreByPage(page);
        session.setAttribute("member",role);
        return "back/admin_find_member";
    }

    @RequestMapping("/addMember")
    public ModelAndView addMember(Member member, HttpSession session){
        ModelAndView mv = new ModelAndView();
        memberServiceImpl.addMember(member);
        PageInfo<Member> member1 = (PageInfo<Member>) session.getAttribute("member");
        PageInfo<Member> preByPage = memberServiceImpl.findPreByPage(member1.getPages() + 1);
        mv.addObject("member",preByPage);
        mv.setViewName("back/admin_find_member");
        return mv;
    }

    /**
     * 删除会员
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/delete")
    public String delMemberByMId(Integer id,HttpSession session){
        memberServiceImpl.delMemberByMid(id);
        PageInfo<Member> member = (PageInfo<Member>) session.getAttribute("member");
        return findPage(member.getPageNum(),session);
    }

    /**
     * 根据id查会员
     * @param id
     * @return
     */
    @RequestMapping("/findMemberById")
    public ModelAndView findMemberById(Integer id){
        ModelAndView mv = new ModelAndView();
        Member member = memberServiceImpl.findMemberById(id);
        mv.addObject("members",member);
        mv.setViewName("back/admin_edit_member");
        return mv;
    }

    @RequestMapping("/upMember")
    public ModelAndView upMember(Member member,HttpSession session){
        ModelAndView mv = new ModelAndView();
        System.out.println(member);
        memberServiceImpl.upMember(member);
        PageInfo<Member> member1 = (PageInfo<Member>) session.getAttribute("member");
        PageInfo<Member> preByPage = memberServiceImpl.findPreByPage(member1.getPageNum());
        mv.addObject("member",preByPage);
        mv.setViewName("back/admin_find_member");
        return mv;
    }


    /**
     * 表单验证
     */

    @RequestMapping("/findMemberByUserName")
    public void findMemberByUserName(String username, HttpServletResponse response, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Member member = memberServiceImpl.findMemberByUserName(username);
        String json="null";
        if (member != null){
            json = "{\"msg\":\"会员号已存在\"}";
        }else {
            json =  "{\"msg\":\"✔\"}";
        }
        response.getWriter().write(json);
    }




    //退出
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }

    //根据mid查找用户
    @RequestMapping("/findById")
    public ModelAndView findById(@RequestParam(name = "id",required = true) Integer id){
        ModelAndView mv = new ModelAndView();
        Member member= memberServiceImpl.findMemberById(id);
        mv.addObject("member",member);
        mv.setViewName("back/admin_edit_member");
        return mv;
    }


    //修改信息
    @RequestMapping("/update")
    public String update(Member member,HttpServletRequest request){
        memberServiceImpl.updateMember(member);
        request.getSession().invalidate();
        Member member1 = memberServiceImpl.findMemberById(member.getMid());
        request.getSession().setAttribute("member1",member1);
        return "member_management";
    }


    //修改密码
    @RequestMapping("/updatePassword")
    public String updatePassword(String oldPwd, @RequestParam(value = "newPwd",required = true,defaultValue = "123456") String newPwd, HttpServletRequest request){
        System.out.println("old："+oldPwd);
        System.out.println("new："+newPwd);
        Member member1 =(Member) request.getSession().getAttribute("member1");
        if (member1.getPassWord().equals(oldPwd)){
            memberServiceImpl.updatePassword(newPwd,member1.getMid());
            request.getSession().invalidate();
            return "login";
        }else {
            return "member_update_password";
        }
    }

    @RequestMapping("/checkIn")
    public String checkIn(Member member, int hid, Order order){
        UUID uuid = UUID.randomUUID();
        String str = uuid.toString();
        String temp = str.replace("_", "");
        //1.增加一个临时会员。
        member.setUserName(temp+ HanZiToPinYinUtils.ToPinyin(member.getRealName()));
        member.setPassWord(HanZiToPinYinUtils.ToPinyin(member.getRealName()));
        //插入显示刚插入的id
        int mid = memberServiceImpl.register2(member);
        //2.把房间状态改为入住
        houseService.updateToPeople(hid);
        //3.添加一条订单-状态为已完成
        order.setOrderTime(new Date());//订单生成时间
        order.setHouseId(hid);
        order.setMemberId(mid);
        order.setRealName(member.getRealName());
        order.setIdentificationNum(member.getIdentificationNum());
        orderService.addOrder2(order);
        return "back/cashier_CheckIn";
    }

    @RequestMapping("/findUserByName")
    public ModelAndView findUserByName(String userName){
        PageInfo<Member> info =  memberServiceImpl.findMemberByName(userName);
        ModelAndView mv = new ModelAndView();
        mv.addObject("member",info);
        mv.setViewName("back/admin_find_member");
        return mv;
    }

    @RequestMapping("/upStutById")
    public String upStutById(String id,String stat,HttpSession session){
        System.out.println(stat);
        memberServiceImpl.upStutById(id,stat);
        PageInfo<Member> member = (PageInfo<Member>) session.getAttribute("member");
        return findPage(member.getPageNum(),session);
    }
}
