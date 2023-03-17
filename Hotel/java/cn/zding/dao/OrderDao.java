package cn.zding.dao;

import cn.zding.pojo.Order;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrderDao {

    @Select("select * from orders where memberid=#{mid}")
    List<Order> findOrderByMid(int mid);

    @Delete("delete from orders where memberid=#{mid}")
    void delOrderByMid(int mid);




    //根据会员id查询订单
    @Select("select * from orders where memberId = #{mid} and (orderStatus='待处理' or orderStatus='已预订') order by orderTime desc")
    @Results({
            @Result(id = true,property = "oid",column = "oid"),
            @Result(property = "orderTime" ,column = "orderTime"),
            @Result(property = "orderPrice" ,column = "orderPrice"),
            @Result(property = "orderStatus" ,column = "orderStatus"),
            @Result(property = "comeTime" ,column = "comeTime"),
            @Result(property = "departureTime" ,column = "departureTime"),
            @Result(column = "houseId",property = "house",one =@One(select = "cn.zding.dao.HouseDao.findById")),
    })
    List<Order> findByMid2(int mid);

    @Select("select * from orders where memberId = #{mid} and (orderStatus='已完成' or orderStatus='已取消') order by orderTime desc")
    @Results({
            @Result(id = true,property = "oid",column = "oid"),
            @Result(property = "orderTime" ,column = "orderTime"),
            @Result(property = "orderPrice" ,column = "orderPrice"),
            @Result(property = "orderStatus" ,column = "orderStatus"),
            @Result(property = "comeTime" ,column = "comeTime"),
            @Result(property = "departureTime" ,column = "departureTime"),
            @Result(column = "houseId",property = "house",one =@One(select = "cn.zding.dao.HouseDao.findById")),
    })
    List<Order> findByMid(int mid);

    //取消预订
    @Update("update orders set orderStatus = '已取消' where oid = #{id}")
    void updateToCancelById(int id);

    //根据订单id查询房间id
    @Select("select * from orders where oid = #{oid}")
    Order findByOid(int oid);
    @Select("select * from orders order by orderTime desc")
    @Results({
            @Result(id = true,property = "oid",column = "oid"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderPrice",column = "orderPrice"),
            @Result(property = "realName", column = "realName"),
            @Result(property = "identificationNum", column = "identificationNum"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "comeTime",column = "comeTime"),
            @Result(property = "departureTime",column = "departureTime"),
            @Result(property = "house",column = "houseId",one = @One(select = "cn.zding.dao.HouseDao.findHouseByhId")),
            @Result(property = "member",column = "memberId",one = @One(select = "cn.zding.dao.MemberDao.findMemberBymId"))
    })
    List<Order> findAllOrders();
    @Select("select * from orders where orderStatus ='待处理' or orderStatus ='已预订'  order by orderTime desc")
    @Results({
            @Result(id = true,property = "oid",column = "oid"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderPrice",column = "orderPrice"),
            @Result(property = "realName", column = "realName"),
            @Result(property = "identificationNum", column = "identificationNum"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "comeTime",column = "comeTime"),
            @Result(property = "departureTime",column = "departureTime"),
            @Result(property = "house",column = "houseId",one = @One(select = "cn.zding.dao.HouseDao.findHouseByhId")),
            @Result(property = "member",column = "memberId",one = @One(select = "cn.zding.dao.MemberDao.findMemberBymId"))
    })
    List<Order> findOrderBypage();
    @Select("select * from orders where orderStatus='已预订' order by orderTime desc")
    @Results({
            @Result(id = true,property = "oid",column = "oid"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderPrice",column = "orderPrice"),
            @Result(property = "realName", column = "realName"),
            @Result(property = "identificationNum", column = "identificationNum"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "comeTime",column = "comeTime"),
            @Result(property = "departureTime",column = "departureTime"),
            @Result(property = "house",column = "houseId",one = @One(select = "cn.zding.dao.HouseDao.findHouseByhId")),
            @Result(property = "member",column = "memberId",one = @One(select = "cn.zding.dao.MemberDao.findMemberBymId"))
    })
    List<Order> findReserveByPage();
    //根据姓名、身份证分页搜索已预定、待处理的订单
    @Select("<script>" +
            "select * from orders  where  (orderStatus ='待处理' or orderStatus ='已预订') " +
            "<if test='realName!=null and realName!=\"\"'> and realName like concat('%',#{realName},'%') </if>" +
            "<if test='identificationNum!=null and identificationNum!=\"\"'> and identificationNum like #{identificationNum} </if>" +
            "order by orderTime desc" +
            "</script>")
    @Results({
            @Result(id = true, property = "oid", column = "oid"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderPrice", column = "orderPrice"),
            @Result(property = "realName", column = "realName"),
            @Result(property = "identificationNum", column = "identificationNum"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "comeTime", column = "comeTime"),
            @Result(property = "departureTime", column = "departureTime"),
            @Result(property = "house", column = "houseId", one = @One(select = "cn.zding.dao.HouseDao.findHouseByhId")),
            @Result(property = "member", column = "memberId", one = @One(select = "cn.zding.dao.MemberDao.findMemberBymId"))
    })
    List<Order> findMemberByRealNameAndIdCard1(@Param("realName") String realName,@Param("identificationNum") String identificationNum);

    //根据姓名、身份证分页搜索已预定的订单
    @Select("<script>" +
            "select * from orders  where  orderStatus ='已预订' " +
            "<if test='realName!=null and realName!=\"\"'> and realName like concat('%',#{realName},'%') </if>" +
            "<if test='identificationNum!=null and identificationNum!=\"\"'> and identificationNum like #{identificationNum} </if>" +
            "order by orderTime desc" +
            "</script>")
    @Results({
            @Result(id = true, property = "oid", column = "oid"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderPrice", column = "orderPrice"),
            @Result(property = "realName", column = "realName"),
            @Result(property = "identificationNum", column = "identificationNum"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "comeTime", column = "comeTime"),
            @Result(property = "departureTime", column = "departureTime"),
            @Result(property = "house", column = "houseId", one = @One(select = "cn.zding.dao.HouseDao.findHouseByhId")),
            @Result(property = "member", column = "memberId", one = @One(select = "cn.zding.dao.MemberDao.findMemberBymId"))
    })
    List<Order> findMemberByRealNameAndIdCard2(@Param("realName") String realName,@Param("identificationNum") String identificationNum);

    //根据姓名、身份证分页搜索所有的订单
    @Select("<script>" +
            "select * from orders  where 1=1" +
            "<if test='realName!=null and realName!=\"\"'> and realName like concat('%',#{realName},'%') </if>" +
            "<if test='identificationNum!=null and identificationNum!=\"\"'> and identificationNum like #{identificationNum} </if>" +
            "order by orderTime desc" +
            "</script>")
    @Results({
            @Result(id = true, property = "oid", column = "oid"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderPrice", column = "orderPrice"),
            @Result(property = "realName", column = "realName"),
            @Result(property = "identificationNum", column = "identificationNum"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "comeTime", column = "comeTime"),
            @Result(property = "departureTime", column = "departureTime"),
            @Result(property = "house", column = "houseId", one = @One(select = "cn.zding.dao.HouseDao.findHouseByhId")),
            @Result(property = "member", column = "memberId", one = @One(select = "cn.zding.dao.MemberDao.findMemberBymId"))
    })
    List<Order> findMemberByRealNameAndIdCard3(@Param("realName") String realName,@Param("identificationNum") String identificationNum);

    //办理入住，订单为已完成
    @Update("update orders set orderStatus ='已完成' where oid = #{id}")
    void updateToCompleteById(Integer oid);



    //修改订单为已预订
    @Update("update orders set orderStatus ='已预订' where oid = #{id}")
    void updateToReserveById(int oid);

    @Select("select * from orders where oid=#{oid}")
    Order findOrderByOid(Integer oid);

    //增加一个订单
    @Insert("insert into orders(orderStatus,orderPrice,orderTime,comeTime,departureTime,houseId,memberId,identificationNum,realName) values(#{orderStatus}," + "#{orderPrice},#{orderTime},#{comeTime},#{departureTime},#{houseId},#{memberId},#{identificationNum},#{realName})")
    void addOrder(Order order);
}
