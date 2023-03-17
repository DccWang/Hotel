package cn.zding.service;

import cn.zding.pojo.Permission;
import com.github.pagehelper.PageInfo;

public interface PerService {
    PageInfo<Permission> findPreByPage(Integer page);

    void addPer(Permission permission);

    void delPerById(int id);
}
