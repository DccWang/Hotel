package cn.zding.service.Impl;

import cn.zding.dao.PermissionDao;
import cn.zding.pojo.Permission;
import cn.zding.pojo.Role;
import cn.zding.service.PerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PerServiceImpl implements PerService {

    @Autowired
    private PermissionDao permissionDao;

    @Override
    public PageInfo<Permission> findPreByPage(Integer page) {
        PageHelper.startPage(page,5);
        List<Permission> userInfo = permissionDao.findRole();
        PageInfo<Permission> pre = new PageInfo<>(userInfo);
        return pre;
    }

    @Override
    public void addPer(Permission permission) {
        permissionDao.addPer(permission);
    }

    @Override
    public void delPerById(int id) {
        permissionDao.delPerById(id);
    }
}
