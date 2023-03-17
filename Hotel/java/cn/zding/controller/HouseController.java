package cn.zding.controller;

import cn.zding.dao.MemberDao;
import cn.zding.pojo.House;
import cn.zding.pojo.HouseCount;
import cn.zding.pojo.Member;
import cn.zding.pojo.SelectDate;
import cn.zding.service.HouseService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/house")
public class HouseController {

    @Autowired
    private HouseService houseService;

    //查询全部空房
    @RequestMapping("/findAllVacant")
    public ModelAndView findAllVacant(SelectDate selectDate, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        request.getSession().setAttribute("selectDate", selectDate);
        List<House> houseList = houseService.findAllVacant();
        mv.addObject("houseList", houseList);
        mv.setViewName("house_list");
        return mv;
    }

    //根据房型查询全部空闲房间
    @RequestMapping("/findByName")
    public ModelAndView findByName(String houseName){
        ModelAndView mv = new ModelAndView();
        List<House> houseList = houseService.findByName(houseName);
        mv.addObject("houses",houseList);
        mv.setViewName("reserve_house");
        return mv;
    }

    //根据id查找房间
    @RequestMapping("/findById")
    public ModelAndView findById(int hid, HttpSession session){
        ModelAndView mv = new ModelAndView();
        House house = houseService.findById(hid);
        mv.addObject("house",house);
        mv.setViewName("reserve_house_detail");
        return mv;
    }

    //查询全部房间(分页查询)
    @RequestMapping("/findAllByPage")
    public ModelAndView findAllByPage(@RequestParam(name = "page" , required = true,defaultValue = "1") int page,
                                      @RequestParam(name = "size",required = true,defaultValue = "5") int size,
                                      HttpSession session){

        ModelAndView mv = new ModelAndView();
        PageInfo<House> houseList =  houseService.findAllByPage(page,size);
        System.out.println("hous:"+houseList);
        session.setAttribute("pageInfo",houseList);
        mv.addObject("pageInfo",houseList);
        mv.setViewName("back/houser_find_house");
        return mv;
    }


    //添加房间
    @RequestMapping("/addHouse")
    public String addHouse(House house){
        houseService.addHouse(house);
//        return "redirect:findAllByPage";
        return "redirect:findAllByPage";
    }

    //根据id查找房间详情
    @RequestMapping("/findHouseById")
    public ModelAndView findHouseById(@RequestParam(name = "id" , required = true) int id){
        ModelAndView mv = new ModelAndView();
        House house = houseService.findById(id);
//        System.out.println(house);
        mv.addObject("house",house);
        mv.setViewName("back/houser_edit_house");
        return mv;
    }

    //根据房间id修改房间
    @RequestMapping("/updateHouse")
    public ModelAndView updateHouse(House house,HttpSession session){
        houseService.updateHouse(house);
        PageInfo<House> list = (PageInfo<House>) session.getAttribute("pageInfo");
        ModelAndView mv = new ModelAndView();
        PageInfo<House> houseList =  houseService.findAllByPage(list.getPageNum(),list.getSize());
        mv.addObject("pageInfo",houseList);
        mv.setViewName("back/houser_find_house");
        return mv;
    }

//    //删除
//    @RequestMapping("/delHouse")
//    public String delHouse(int id){
//        houseService.delHouse(id);
//        return "redirect:findAllByPage";
//    }

    //修改房间状态为禁用
    @RequestMapping("/updateToVacantByJy")
    public ModelAndView updateToVacantByJy(int id,HttpSession session){
        houseService.updateToVacantByJy(id);
        PageInfo<House> list = (PageInfo<House>) session.getAttribute("pageInfo");

        ModelAndView mv = new ModelAndView();
        int pageNum = list.getPageNum();
        int pageSize = list.getPageSize();
        PageInfo<House> houseList =  houseService.findAllByPage(pageNum,pageSize);
        mv.addObject("pageInfo",houseList);
        mv.setViewName("back/houser_find_house");
        return mv;
    }
    //修改房间状态为启用(空房)
    @RequestMapping("/updateToVacantByQy")
    public ModelAndView updateToVacantByQy(int id,HttpSession session,ModelAndView mv){
        houseService.updateToVacantByQy(id);
        PageInfo<House> list = (PageInfo<House>) session.getAttribute("pageInfo");
        int pageNum = list.getPageNum();
        int pageSize = list.getPageSize();
        PageInfo<House> houseList =  houseService.findAllByPage(pageNum,pageSize);
        mv.addObject("pageInfo",houseList);
        mv.setViewName("back/houser_find_house");
        return mv;
    }

    //查询房型首页信息
    @RequestMapping("/findAllHouse")
    public ModelAndView findAllHouse(){
        ModelAndView mv = new ModelAndView();
        //查询全部房间信息
        List<House> houseList = houseService.findAllHouse();
        mv.addObject("houseList",houseList);
        //查询各种房间状态的数量
        HouseCount houseCount = houseService.findCount();
        mv.addObject("houseCount",houseCount);
        mv.setViewName("back/cashier_find_house");
        return mv;
    }
    //根据房间类型houseName查询房间
    @RequestMapping("/findByHouseName")
    public ModelAndView findAllHouse(String houseName){
        ModelAndView mv = new ModelAndView();
        //根据房间类型houseName查询房间信息
        List<House> houseList = houseService.findByHouseName(houseName);
        mv.addObject("houseList",houseList);
        //查询各种房间状态的数量
        HouseCount houseCount = houseService.findCount();
        mv.addObject("houseCount",houseCount);
        mv.setViewName("back/cashier_find_house");
        return mv;
    }

    //入住办理
    /**
     * 多条件查询
     * @param houseNum 根据房号查询
     * @param houseState 根据房间状态查询
     * @return
     */
    @RequestMapping("/findByMutiCondition")
    public ModelAndView findByMutiCondition(String houseNum,String houseState){
        ModelAndView mv = new ModelAndView();
        List<House> houseList= houseService.findByMutiCondition( houseNum, houseState);
        mv.addObject("houseList",houseList);
        HouseCount houseCount = houseService.findCount();
        mv.addObject("houseCount",houseCount);
        mv.setViewName("back/cashier_find_house");
        return mv;
    }
    /**
     * 办理入住
     * 拿一下参数再传给下一个页面
     * @param hid
     * @return
     */
    @RequestMapping("/getHid")
    public ModelAndView getHid(int hid){
        ModelAndView mv = new ModelAndView();
        mv.addObject("hid",hid);
        mv.setViewName("back/cashier_CheckIn_SelectDate");
        return mv;
    }
    //根据id查找房间
    @RequestMapping("/findById2")
    public ModelAndView findById2(int hid, SelectDate selectDate){
        ModelAndView mv = new ModelAndView();
        House house = houseService.findById(hid);
        house.setHousePrice(selectDate.getCount()*house.getHousePrice());
        mv.addObject("house",house);
        mv.addObject("selectDate",selectDate);
        mv.setViewName("back/cashier_CheckIn_detail");
        return mv;
    }


    /**
     * //查询全部房间信息
     * @return
     */
    @RequestMapping("/findNotVacant")
    public ModelAndView findNotVacant(){
        ModelAndView mv = new ModelAndView();
        //查询住人全部房间信息
        List<House> houseList = houseService.findNotVacant();
        mv.addObject("houseList",houseList);
        mv.setViewName("back/cashier_CheckOut");
        return mv;
    }
    //离店办理
    @RequestMapping("/updateToDirty")
    public String updateToDirty(int hid){
        houseService.updateToDirty(hid);
        return "redirect:findNotVacant";
    }

    //打扫房间
    @RequestMapping("/findDirty")
    public ModelAndView findDirty(){
        ModelAndView mv = new ModelAndView();
        //查询全部房间信息
        List<House> houseList = houseService.findDirty();
        mv.addObject("houseList",houseList);
        mv.setViewName("back/houser_sweep");
        return mv;
    }
    //将脏房状态修改为空房
    @RequestMapping("/updateToVacant")
    public String updateToVacant(int hid){
        houseService.updateToVacant(hid);
        return "redirect:findDirty";
    }
}
