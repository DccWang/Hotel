package cn.zding.controller;

import cn.zding.pojo.Member;
import cn.zding.pojo.Order;
import cn.zding.service.OrderService;
import com.github.pagehelper.PageInfo;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    //生成一个订单(改变房间状态)
    @RequestMapping("/addOrder")
    public String addOrder(Order order,HttpSession session){
        order.setOrderTime(new Date());
        Member member1 = (Member)session.getAttribute("member1");
        String identificationNum = member1.getIdentificationNum();
        String realName = member1.getRealName();
        order.setIdentificationNum(identificationNum);
        order.setRealName(realName);
        orderService.addOrder(order);
        return "message";
    }

    //根据用户信息查询历史订单(已取消or已完成or已预定)
    @RequestMapping("/findByMid")
    public ModelAndView findByMid(@RequestParam(name = "page",required = true,defaultValue = "1" ) int page,
                                  @RequestParam(name = "size",required = true,defaultValue = "5" ) int size,
                                  HttpSession session){
        ModelAndView mv = new ModelAndView();
        Member member1 =(Member) session.getAttribute("member1");
        List<Order> orderList =  orderService.findByMid(member1.getMid(),page,size);
        PageInfo pageInfo = new PageInfo(orderList);
        Member member = new Member();
        member.setMid(member1.getMid());
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("member",member);
        mv.setViewName("dingdan");
        return mv;
    }

    @RequestMapping("/findByMid2")
    public ModelAndView findByMid2(HttpSession session){
        ModelAndView mv = new ModelAndView();
        Member member1 =(Member) session.getAttribute("member1");
//        System.out.println(member1.getMid());
        List<Order> orderList =  orderService.findByMid2(member1.getMid());
        PageInfo pageInfo = new PageInfo(orderList);
        //传递参数 mid
        Member member = new Member();
        member.setMid(member1.getMid());
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("member",member);
        mv.setViewName("dingdan");
        return mv;
    }

    //取消预定（订单状态变为已取消，房间状态变为空房）
    @RequestMapping("/updateToCancelById")
    public ModelAndView updateToCancelById(int oid,HttpSession session,ModelAndView mv){
        orderService.updateToCancelById(oid);
        PageInfo<Order> pageInfo = (PageInfo<Order>) session.getAttribute("pageInfo1");
        PageInfo<Order> pageInfo2 = orderService.findOrderBypage(pageInfo.getPageNum(),pageInfo.getPageSize());
        mv.addObject("pageInfo",pageInfo2);
        mv.setViewName("back/cashier_affirm_reserve");
        return mv;
    }
    
    //取消预定（订单状态变为已取消，房间状态变为空房）
    @RequestMapping("/updateToCancelById1")
    public String updateToCancelById1(int id){
        orderService.updateToCancelById(id);
        return "redirect:findByMid2";
    }

    /**
     * 分页查询全部订单
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/findAllByPage")
    public ModelAndView findAllByPage( @RequestParam(name = "page",required = true,defaultValue = "1" ) int page,
                                       @RequestParam(name = "size",required = true,defaultValue = "5" ) int size){
        ModelAndView mv = new ModelAndView();
        PageInfo<Order> pageInfo =  orderService.findAllOrders(page,size);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("back/admin_find_orders");
        return mv;
    }

    /**
     * 分页查询待处理、已预定的订单
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/findAllByPage2")
    public ModelAndView  findAllByPage2(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                        @RequestParam(value = "size",required = true,defaultValue = "5") Integer size,
                                        HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<Order> pageInfo = orderService.findOrderBypage(page,size);
        session.setAttribute("pageInfo1",pageInfo);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("back/cashier_affirm_reserve");
        return modelAndView;
    }

    /**
     * 分页查询已预定的订单
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/findReserveByPage")
    public ModelAndView  findReserveByPage(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                           @RequestParam(value = "size",required = true,defaultValue = "5") Integer size,
                                           HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<Order> pageInfo = orderService.findReserveByPage(page,size);
        if (pageInfo==null){
            pageInfo.setPageNum(1);
            pageInfo.setPageSize(0);
            pageInfo.setTotal(0);
        }
        session.setAttribute("pageInfo2",pageInfo);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("back/cashier_CheckIn_reserve");
        return modelAndView;
    }

    @RequestMapping("/findMemberByRealNameAndIdCard")
    public ModelAndView findMemberByRealNameAndIdCard(String  realName, String identificationNum,
                                                      @RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                                      @RequestParam(value = "size",required = true,defaultValue = "30") Integer size,
                                                      Integer chose,ModelAndView mv, HttpSession session){
        PageInfo<Order> pageInfo=null;
        if (chose==1){//根据姓名、身份证分页搜索已预定、待处理的订单
            pageInfo= orderService.findMemberByRealNameAndIdCard( realName, identificationNum,page,size,chose);
            if (pageInfo==null){
                pageInfo.setPageNum(1);
                pageInfo.setPageSize(0);
                pageInfo.setTotal(0);
            }
            mv.addObject("pageInfo",pageInfo);
            mv.setViewName("back/cashier_affirm_reserve");
        }else if (chose==2){//根据姓名、身份证分页搜索已预定的订单
            pageInfo= orderService.findMemberByRealNameAndIdCard( realName, identificationNum,page,size,chose);
            if (pageInfo==null){
                pageInfo.setPageNum(1);
                pageInfo.setPageSize(0);
                pageInfo.setTotal(0);
            }
            mv.addObject("pageInfo",pageInfo);
            mv.setViewName("back/cashier_CheckIn_reserve");
        }else {//根据姓名、身份证分页搜索所有的订单
            pageInfo= orderService.findMemberByRealNameAndIdCard( realName, identificationNum,page,size,chose);
            if (pageInfo==null){
                pageInfo.setPageNum(1);
                pageInfo.setPageSize(0);
                pageInfo.setTotal(0);
            }
            mv.addObject("pageInfo",pageInfo);
            mv.setViewName("back/admin_find_orders");
        }
        return mv;
    }

    //办理入住（订单状态变为已完成，房间状态变为住人）
    @RequestMapping("/updateToCompleteById")
    public ModelAndView  updateToCompleteById(Integer oid,HttpSession session,ModelAndView mv){
        orderService.updateOrderByOid(oid);
        PageInfo<Order> pageInfo = (PageInfo<Order>) session.getAttribute("pageInfo2");
        PageInfo<Order> pageInfo2 = orderService.findReserveByPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        if (pageInfo2==null){
            pageInfo2.setPageNum(1);
            pageInfo2.setPageSize(0);
            pageInfo2.setTotal(0);
        }
        mv.addObject("pageInfo",pageInfo2);
        mv.setViewName("back/cashier_CheckIn_reserve");
        return mv;
    }

    //确认预定(根据id修改订单状态为已预定)
    @RequestMapping("/updateToReserveById")
    public String updateToReserveById(int oid){
        orderService.updateToReserveById(oid);
        return "redirect:findAllByPage2";
    }



}
