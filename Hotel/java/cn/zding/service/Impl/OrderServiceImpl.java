package cn.zding.service.Impl;

import cn.zding.dao.HouseDao;
import cn.zding.dao.OrderDao;
import cn.zding.pojo.Order;
import cn.zding.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private HouseDao houseDao;



    @Override
    public void addOrder(Order order)  {
        //增加一个订单
        orderDao.addOrder(order);

        //改变房间的状态
        houseDao.updateToReserveById(order.getHouseId());
    }

    //根据会员id查询消费历史
    public List<Order> findByMid(int mid, int page, int size) {

        PageHelper.startPage(page,size);
        return orderDao.findByMid(mid);
    }
    //查询待处理or已预定的订单
    public List<Order> findByMid2(int mid) {
//        PageHelper.startPage(page,size);
        return orderDao.findByMid2(mid);
    }

    @Override
    public void updateToCancelById(int id) {
        //取消订单
        //修改订单状态
        orderDao.updateToCancelById(id);

        //根据订单id查询出一条订单。拿房间id
        Order order = orderDao.findByOid(id);

        //修改相应得房间状态为空房
        houseDao.updateToVacant(order.getHouseId());
    }

    @Override
    public PageInfo<Order> findAllOrders(int page, int size) {
        PageHelper.startPage(page,size);

        List<Order> orders = orderDao.findAllOrders();

        return new PageInfo<Order>(orders);
    }

    //分页查询待处理、已预定的订单
    @Override
    public PageInfo<Order> findOrderBypage(int page,int size) {
        PageHelper.startPage(page,size);

        List<Order> orders = orderDao.findOrderBypage();

        return new PageInfo<Order>(orders);
    }
    //分页查询已预定的订单
    @Override
    public PageInfo<Order> findReserveByPage(Integer page, Integer size) {
        try {
            PageHelper.startPage(page,size);

            List<Order> orders = orderDao.findReserveByPage();

            return new PageInfo<Order>(orders);
        }catch (Exception e){
            return null;
        }
    }
    //根据真实姓名、身份证条件查询
    @Override
    public PageInfo<Order> findMemberByRealNameAndIdCard(String realName, String identificationNum,
                                                         Integer page, Integer size,Integer chose) {
        PageHelper.startPage(page,size);
        List<Order> orders = null;
        if (chose==1){//根据姓名、身份证分页搜索已预定、待处理的订单
            try{
                orders = orderDao.findMemberByRealNameAndIdCard1(realName,identificationNum);
                return new PageInfo<Order>(orders);
            }catch (Exception e){
                return null;
            }
        }else if (chose==2){//根据姓名、身份证分页搜索已预定的订单
            try{
                orders = orderDao.findMemberByRealNameAndIdCard2(realName,identificationNum);
                return new PageInfo<Order>(orders);
            }catch (Exception e){
                return null;
            }
        }else {//根据姓名、身份证分页搜索所有的订单
            try{
                orders = orderDao.findMemberByRealNameAndIdCard3(realName,identificationNum);
                return new PageInfo<Order>(orders);
            }catch (Exception e){
                return null;
            }
        }
    }

    /**
     * 将订单状态修改为已预定
     * 将房间状态修改为已预定
     * @param oid
     */
    @Override
    public void updateToReserveById(int oid) {
        //修改订单状态
        orderDao.updateToReserveById(oid);
        //根据订单id查询出一条订单。拿房间id
        Order order = orderDao.findOrderByOid(oid);
        //修改相应得房间id状态为已预定
        houseDao.updateToReserveVacant(order.getHouseId());
    }

    /**
     *  将订单状态修改为已取消
     * 将房间状态修改为空房
     * @param oid
     */


    /**
     * 办理入住
     * 将订单状态修改为已完成
     * 将房间状态修改为住人
     * @param oid
     */
    @Override
    public void updateOrderByOid(Integer oid) {
        //办理入住
        //修改订单状态
        orderDao.updateToCompleteById(oid);
        //根据订单id查询出一条订单。拿房间id
        Order order = orderDao.findOrderByOid(oid);
        //修改相应得房间id状态为入住
        houseDao.updateToNotVacant(order.getHouseId());
    }
    /**
     * 后台办理入住添加订单
     * @param order
     */
    @Override
    public void addOrder2(Order order) {
        orderDao.addOrder(order);
    }
}
