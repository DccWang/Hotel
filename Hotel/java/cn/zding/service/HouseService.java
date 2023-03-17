package cn.zding.service;

import cn.zding.pojo.House;
import cn.zding.pojo.HouseCount;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface HouseService {
    //查询空房
    List<House> findAllVacant();

    List<House> findByName(String houseName);

    //根据id查找房间
    House findById(int id);

    //查询全部房间(分页查询)
    PageInfo<House> findAllByPage(int page, int size);

    //添加房间
    void addHouse(House house);

    //根据房间号查房间
    House findByNum(int houseNum);

    //根据房间id修改房间
    void updateHouse(House house);

    //删除
//    void delHouse(int id);


    //修改房间状态为禁用
    void updateToVacantByJy(Integer houseId);

    List<House> findAllHouse();

    HouseCount findCount();

    List<House> findByHouseName(String houseName);

    void updateToPeople(int hid);

    List<House> findByMutiCondition(String houseNum, String houseState);

    List<House> findNotVacant();

    void updateToDirty(int hid);

    List<House> findDirty();

    void updateToVacant(int hid);

    void updateToVacantByQy(int id);
}
