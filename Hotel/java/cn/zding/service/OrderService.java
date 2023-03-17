package cn.zding.service;

import cn.zding.pojo.Order;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface OrderService {

    //增加一个订单
    void addOrder(Order order);

    //根据会员id查找订单
    List<Order> findByMid(int id, int page, int size);
    List<Order> findByMid2(int id);

    //取消预定
    void updateToCancelById(int id);

    PageInfo<Order> findOrderBypage(int page, int size);

    void updateOrderByOid(Integer oid);

    PageInfo<Order> findReserveByPage(Integer page, Integer size);

    void updateToReserveById(int id);


    void addOrder2(Order order);

    PageInfo<Order> findAllOrders(int page, int size);

    PageInfo<Order> findMemberByRealNameAndIdCard(String realName, String identificationNum, Integer page, Integer size, Integer chose);
}
