package cn.zding.controller;

import cn.zding.pojo.Permission;
import cn.zding.pojo.Role;
import cn.zding.service.PerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/per")
public class PermissionController {

    @Autowired
    private PerService perServiceImpl;

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
        PageInfo<Permission> role = perServiceImpl.findPreByPage(page);
        session.setAttribute("pre",role);
        return "back/permission-list";
    }

    /**
     * 添加
     * @param permission
     * @param session
     * @return
     */
    @RequestMapping("/addPer")
    public String addPer(Permission permission,HttpSession session){
        perServiceImpl.addPer(permission);
        PageInfo<Permission> per = (PageInfo<Permission>) session.getAttribute("pre");
        return findPageRole(per.getPages()+1,session);
    }

    @RequestMapping("/delPerById")
    public String delPerById(Integer id,HttpSession session){
        perServiceImpl.delPerById(id);
        PageInfo<Permission> pre = (PageInfo<Permission>) session.getAttribute("pre");
        return findPageRole(pre.getPageNum()+1,session);
    }

}
