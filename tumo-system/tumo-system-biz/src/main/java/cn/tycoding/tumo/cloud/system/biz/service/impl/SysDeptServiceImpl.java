package cn.tycoding.tumo.cloud.system.biz.service.impl;

import cn.tycoding.tumo.cloud.system.api.dto.Tree;
import cn.tycoding.tumo.cloud.system.api.entity.SysDept;
import cn.tycoding.tumo.cloud.system.api.utils.TreeUtils;
import cn.tycoding.tumo.cloud.system.biz.mapper.SysDeptMapper;
import cn.tycoding.tumo.cloud.system.biz.service.SysDeptService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tycoding
 * @date 2020/7/13
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

    @Override
    public List<Tree<SysDept>> tree() {
        List<SysDept> deptList = baseMapper.selectList(new LambdaQueryWrapper<>());
        List<Tree<SysDept>> treeList = new ArrayList<>();
        deptList.forEach(dept -> {
            Tree<SysDept> tree = new Tree<>();
            tree.setId(dept.getId());
            tree.setParentId(dept.getParentId());
            tree.setName(dept.getName());
            treeList.add(tree);
        });
        return TreeUtils.build(treeList);
    }

    @Override
    public List<SysDept> list(SysDept sysDept) {
        LambdaQueryWrapper<SysDept> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(sysDept.getName()), SysDept::getName, sysDept.getName());
        return baseMapper.selectList(queryWrapper);
    }

    @Override
    public SysDept findById(Long id) {
        return baseMapper.selectById(id);
    }

    @Override
    public boolean checkName(SysDept sysDept) {
        if (StringUtils.isBlank(sysDept.getName())) {
            return false;
        }
        LambdaQueryWrapper<SysDept> queryWrapper = new LambdaQueryWrapper<>();
        if (sysDept.getId() != null && sysDept.getId() != 0) {
            queryWrapper.eq(SysDept::getName, sysDept.getName());
            queryWrapper.ne(SysDept::getId, sysDept.getId());
        } else {
            queryWrapper.eq(SysDept::getName, sysDept.getName());
        }
        return baseMapper.selectList(queryWrapper).size() <= 0;
    }

    @Override
    @Transactional
    public void add(SysDept sysDept) {
        Long pId = sysDept.getParentId();
        if (pId == null) {
            sysDept.setParentId(0L);
        }
        this.save(sysDept);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        baseMapper.deleteById(id);
        baseMapper.changeTopNode(id);
    }

    @Override
    @Transactional
    public void update(SysDept sysDept) {
        this.updateById(sysDept);
    }

}
