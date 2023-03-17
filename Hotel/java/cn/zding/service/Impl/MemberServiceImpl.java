package cn.zding.service.Impl;

import cn.zding.dao.MemberDao;
import cn.zding.dao.OrderDao;
import cn.zding.pojo.Member;
import cn.zding.pojo.Order;
import cn.zding.pojo.Permission;
import cn.zding.pojo.UserInfo;
import cn.zding.service.MemberService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private OrderDao orderDao;

    //分页
    @Override
    public PageInfo<Member> findPreByPage(Integer page) {
        PageHelper.startPage(page, 5);
        List<Member> userInfo = memberDao.findMember();
        PageInfo<Member> pre = new PageInfo<>(userInfo);
        return pre;
    }

//    根据name查member
    @Override
    public Member findMemberByUserName(String username) {
        return memberDao.findMemberByUserName(username);
    }

//    添加
    @Override
    public void addMember(Member member) {
        memberDao.addMember(member);
    }

//    删除
    @Override
    public void delMemberByMid(int id) {
        List<Order> or = orderDao.findOrderByMid(id);
        if (or != null) {
            orderDao.delOrderByMid(id);
        }
        memberDao.delMemberBymid(id);
    }

//    根据id查
    @Override
    public Member findMemberById(int mid) {
        return memberDao.findMemberById(mid);
    }

//    修改
    @Override
    public void upMember(Member member) {
        memberDao.upMember(member);
    }

    //修改信息
    @Override
    public void updateMember(Member member) {
        memberDao.updateMember(member);
    }

    @Override
    public void updatePassword(String newPwd, int mid) {
        memberDao.updatePassword(newPwd, mid);
    }

    @Override
    public Member getMemberByIdentificationNum(String identificationNum) {
        return memberDao.findMemberByIdentificationNum(identificationNum);
    }

    @Override
    public int register2(Member member) {
        memberDao.register2(member);
        Member m = memberDao.findByUserNcame(member.getUserName());
        return m.getMid();
    }

    @Override
    public PageInfo<Member> findMemberByName(String userName) {
        PageHelper.startPage(1,100);
        List<Member> userInfo = memberDao.findUserByName(userName);
        PageInfo<Member> pageInfo = new PageInfo<>(userInfo);
        return pageInfo;
    }

    @Override
    public void upStutById(String id,String stat) {
        memberDao.upStutById(id,stat);
    }
}

