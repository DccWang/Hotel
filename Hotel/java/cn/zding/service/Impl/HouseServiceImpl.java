package cn.zding.service.Impl;

import cn.zding.dao.HouseDao;
import cn.zding.pojo.House;
import cn.zding.pojo.HouseCount;
import cn.zding.service.HouseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HouseServiceImpl implements HouseService {

    @Resource(name = "houseDao")
    private HouseDao houseDao;

    @Override
    public List<House> findAllVacant() {
        return houseDao.findAllVacant();
    }

    @Override
    public List<House> findByName(String houseName) {
        return houseDao.findByName(houseName);
    }

    @Override
    public House findById(int id) {
        return houseDao.findById(id);
    }

    //查询全部房间(分页查询)
    @Override
    public PageInfo<House> findAllByPage(int page, int size) {
        PageHelper.startPage(page,size);
        List<House> houseList = houseDao.findAllHouse();
        PageInfo<House> pageInfo = new PageInfo(houseList);
        return pageInfo;
    }

    //增加房间
    @Override
    public void addHouse(House house) {
        houseDao.addHouse(house);
    }

    //根据房间号查房间
    @Override
    public House findByNum(int houseNum) {
        return houseDao.findByNum(houseNum);
    }

    //根据房间id修改房间
    @Override
    public void updateHouse(House house) {
        houseDao.updateHouse(house);
    }


    //删除
//    @Override
//    public void delHouse(int id) {
//        houseDao.delHouse(id);
//    }


    //修改房间状态为禁用
    @Override
    public void updateToVacantByJy(Integer houseId) {
        houseDao.updateToVacantByJy(houseId);
    }

    //查询全部房间
    @Override
    public List<House> findAllHouse() {
        return  houseDao.findAllHouse();
    }
    //查询各种房间状态的数量
    @Override
    public HouseCount findCount() {
        HouseCount houseCount = new HouseCount();
        //查询全部房间数量
        houseCount.setAllHouseCount(houseDao.findAllCount());
        //查询空闲房间数量
        houseCount.setVacantCount(houseDao.findVacantCount());
        //查询预定房间数量
        houseCount.setPreserveCount(houseDao.findPreserveCount());
        //查询住人房间数量
        houseCount.setPeopleCount(houseDao.findPeopleCount());
        //查询脏房数量
        houseCount.setDirtyCount(houseDao.findDirtyCount());
        //查询房间被禁用的数量
        houseCount.setForbidden(houseDao.findForbiddenCount());
        return houseCount;
    }

    //根据房间类型houseName查询房间
    @Override
    public List<House> findByHouseName(String houseName) {
        return houseDao.findByHouseName(houseName);
    }

    /**
     * 多条件查询
     * @param houseNum 根据房号查询
     * @param houseState 根据房间状态查询
     * @return
     */
    @Override
    public List<House> findByMutiCondition(String houseNum, String houseState) {
        return houseDao.findByMutiCondition(houseNum,houseState);
    }

    /**
     * 查询住人房间
     * @return
     */
    @Override
    public List<House> findNotVacant() {
        return houseDao.findNotVacant();
    }
    //离店办理
    @Override
    public void updateToDirty(int hid) {
        //离店办理完成之后，修改房间状态为脏房
        houseDao.updateToDirty(hid);
    }

    /**
     * 客房打扫
     * @return
     */
    @Override
    public List<House> findDirty() {
        return houseDao.findDirty();
    }
    //将脏房状态修改为空房
    @Override
    public void updateToVacant(int hid) {
        houseDao.updateToVacant(hid);
    }

    @Override
    public void updateToVacantByQy(int id) {
        houseDao.updateToVacant(id);
    }


    //2.把房间状态改为入住
    @Override
    public void updateToPeople(int hid) {
        houseDao.updateToNotVacant(hid);
    }

}
