package cn.zding.dao;

import cn.zding.pojo.House;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface HouseDao {
    //查空房
    @Select("select *,count(*) count from house where houseState = '空房' group by houseName")
    List<House> findAllVacant();

    //根据房名查询
    @Select("select * from house where houseName = #{houseName} and houseState = '空房' ")
    List<House> findByName(String houseName);

    //根据id查找房间
    @Select("select * from house where hid = #{hid}")
    House findById(int id);

    //根据id修改房间状态为预订
    @Update("update house set houseState = '预订' where hid = #{hid}")
    void updateToReserveById(int hid);

    //增加房间
    @Insert("insert into house(houseName,houseState,housePrice,houseNum) values(#{houseName},#{houseState},#{housePrice},#{houseNum})")
    void addHouse(House house);

    //根据房间号查房间
    @Select("select * from house where houseNum = #{houseNum}")
    House findByNum(int houseNum);

    //根据房间id修改房间
    @Update("update house set houseName = #{houseName},houseState = #{houseState},housePrice = #{housePrice},houseNum = #{houseNum} where hid = #{hid}")
    void updateHouse(House house);


    //根据id修改房间状态为禁用
    @Update("update house set houseState = '禁用' where hid = #{hid}")
    void updateToVacantByJy(Integer houseId);



    @Select("select * from house where hid=#{houseId}")
    House findHouseByhId(Integer houseId);

    //根据id修改房间状态为住人
    @Update("update house set houseState = '住人' where hid = #{hid}")
    void updateToNotVacant(Integer houseId);

    //查询全部房间
    @Select("select * from house")
    List<House> findAllHouse();

    @Select("select count(*) house")
    int findHouseCount();

    //根据id修改房间状态为空房
    @Update("update house set houseState = '空房' where hid = #{hid}")
    void updateToVacant(Integer houseId);

    //根据id修改房间状态为预定
    @Update("update house set houseState = '预定' where hid = #{hid}")
    void updateToReserveVacant(Integer houseId);

    //查询全部房间数量
    @Select("select count(*) from house")
    Integer findAllCount();

    //查询空闲房间数量
    @Select("select count(*) from house where houseState = '空房'")
    Integer findVacantCount();

    //查询预定房间数量
    @Select("select count(*) from house where houseState='预订'")
    Integer findPreserveCount();

    //查询住人房间数量
    @Select("select count(*) from house where houseState= '住人'")
    Integer findPeopleCount();

    //查询脏房数量
    @Select("select count(*) from house where houseState='脏房'")
    Integer findDirtyCount();

    //查询房间被禁用的数量
    @Select("select count(*) from house where houseState='禁用'")
    Integer findForbiddenCount();

    //根据房间类型houseName查询房间
    @Select("select * from house where houseName = #{houseName}")
    List<House> findByHouseName(String houseName);



    /**
     * 多条件查询
     * @param houseNum 根据房号查询
     * @param houseState 根据房间状态查询
     * @return
     */
    @Select(" <script> select * from house where 1=1  " +
            " <if test='houseNum!=null and houseNum!=\"\"'>  and houseNum like concat('%',#{houseNum},'%') </if> "+
            " <if test='houseState!=null and houseState!=\"\"'>and houseState = #{houseState} </if> "+
            " </script>")
    List<House> findByMutiCondition(@Param("houseNum") String houseNum, @Param("houseState") String houseState);

    //查询住人房间
    @Select("select * from house where houseState='住人'")
    List<House> findNotVacant();

    //修改房间状态为脏房
    @Update("update house set houseState='脏房' where hid = #{hid}")
    void updateToDirty(int hid);

    @Select("select * from house where houseState='脏房'")
    List<House> findDirty();
}
