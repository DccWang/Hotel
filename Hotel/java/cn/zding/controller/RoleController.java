package cn.zding.controller;

import cn.zding.pojo.Permission;
import cn.zding.pojo.Role;
import cn.zding.pojo.UserInfo;
import cn.zding.service.RoleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleServiceImpl;

    /**
     * 分页
     * @param page
     * @return
     */
    @RequestMapping("/findAll.do")
    public String findPageRole(Integer page, HttpSession session){
        if (page == null || page == 0){
            page = 1;
        }
        PageInfo<Role> role = roleServiceImpl.findRoleByPage(page);
        session.setAttribute("role",role);
        return "back/role-list";
    }

    /**
     * 添加角色
     * @param role
     * @return
     */
    @RequestMapping("/addRole")
    public ModelAndView addPole(Role role,HttpSession session){
        roleServiceImpl.addRole(role);
        PageInfo<Role> role1 = roleServiceImpl.findRoleByPage(1000);
        ModelAndView mv = new ModelAndView();
        session.setAttribute("role",role1);
        mv.addObject("role",role1);
        mv.setViewName("back/role-list");
        return mv;
    }

    /**
     * 查看角色下的权限
     * @param id
     * @return
     */
    @RequestMapping("/findById")
    public ModelAndView findById(Integer id){
        Role role = roleServiceImpl.findRoleById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("role",role);
        mv.setViewName("back/role-show");
        return mv;
    }

    @RequestMapping("/delRoleById")
    public String delRoleById(Integer id,HttpSession session){
        roleServiceImpl.delRoleById(id);
        PageInfo<Role> role = (PageInfo<Role>) session.getAttribute("role");
        return findPageRole(role.getPageNum(),session);
    }

    /**
     * 根据roleId查permission
     * @param id
     * @return
     */
    @RequestMapping("/findPerByRoleId")
    public ModelAndView findPerByRoleId(Integer id){
        List<Permission> permissions = roleServiceImpl.findPerByRoleId(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("permissions",permissions);
        mv.addObject("roleId",id);
        mv.setViewName("back/role-permission-add");
        return mv;
    }

    /**
     * 给角色添加权限
     * @param roleId
     * @param ids
     * @param session
     * @return
     */
    @RequestMapping("/addPerRole")
    public String addPerRole(Integer roleId,int[] ids,HttpSession session){
        roleServiceImpl.addPrePole(roleId,ids);
        PageInfo<Role> role = (PageInfo<Role>) session.getAttribute("role");
        return findPageRole(role.getPageNum(),session);
    }

    @RequestMapping("/delPerAndRole")
    public ModelAndView delPerAndRole(Integer roleid,Integer permissionid){
        roleServiceImpl.delPerAndRole(roleid,permissionid);
        return findById(roleid);
    }
}
