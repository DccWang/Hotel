package cn.zding.controller;

import cn.zding.pojo.Role;
import cn.zding.pojo.UserInfo;
import cn.zding.service.RoleService;
import cn.zding.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {

    @Resource(name = "userService2")
    private UserService userServiceImpl;

    @Autowired
    private RoleService roleServiceImpl;


    @RequestMapping("/findAll.do")
    public String findUserInfoByPage(Integer page,HttpSession session){
        if (page == null || page == 0){
            page = 1;
        }

        ModelAndView mv = new ModelAndView();
        PageInfo<UserInfo> info = userServiceImpl.findUserInfoByPage(page);
        session.setAttribute("info",info);
        return "back/user-list";
    }

    @RequestMapping("/addUserInfo")
    public String addUserInfo(UserInfo userInfo,HttpSession session){
        userServiceImpl.addUserInfo(userInfo);
        return findUserInfoByPage(1000,session);
    }


    @RequestMapping("/findUserById")
    public String findUserById(Integer id, HttpSession session) throws Exception {
        UserInfo user = userServiceImpl.findUserById(id);
        session.setAttribute("userInfo",user);
        return "back/user-show1";
    }

    /**
     * 查询不包含userId = id的角色
     * @param id
     * @return
     */
    @RequestMapping("/findRoleByUserId")
    public ModelAndView findRoleByUserId(Integer id){
        ModelAndView mv = new ModelAndView();
        List<Role> role = roleServiceImpl.findRoleByUserId(id);
        mv.addObject("role",role);
        mv.addObject("userId",id);
        mv.setViewName("/back/user-role-add");
        return mv;
    }

    /**
     * 添加角色
     * @param userId
     * @param roleIds
     * @return
     */
    @RequestMapping("/addRoleById")
    public String addRoleById(@RequestParam(name = "userId", required = true) Integer userId,
                              @RequestParam(name = "ids", required = true) int[] roleIds,
                              HttpSession session){
        roleServiceImpl.addRoleAddUser(userId,roleIds);
        PageInfo<UserInfo> info = (PageInfo<UserInfo>) session.getAttribute("info");
        return findUserInfoByPage(info.getPageNum(),session);
    }

    @RequestMapping("/upUserStatus")
    public String upUserStatus(String status,HttpSession session,Integer id){
        userServiceImpl.upUserStatus(status,id);
        PageInfo<UserInfo> info = (PageInfo<UserInfo>) session.getAttribute("info");
        return findUserInfoByPage(info.getPageNum(),session);
    }

    @RequestMapping("/delRoleAndUsers")
    public String delRoleAndUsers(Integer userid,Integer roleid,HttpSession session) throws Exception{
        userServiceImpl.delRoleAndUsers(userid,roleid);
        return findUserById(userid,session);
    }

    @RequestMapping("/findUserByName")
    public ModelAndView findUserByName(String username){
        PageInfo<UserInfo> info =  userServiceImpl.findUserByName(username);
        ModelAndView mv = new ModelAndView();
        mv.addObject("info",info);
        mv.setViewName("back/user-list");
        return mv;
    }

    @RequestMapping("/findUserByIdToUpdate")
    public ModelAndView findUserByIdToUpdate(Integer id) throws Exception{
        UserInfo user = userServiceImpl.findUserById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("user",user);
        mv.setViewName("back/user_update");
        return mv;
    }
    @RequestMapping("/updateById")
    public String  updateById(UserInfo userInfo){
        System.out.println(userInfo);
        int i = userServiceImpl.updateById(userInfo);
        return "redirect:findAll.do";
    }
}

