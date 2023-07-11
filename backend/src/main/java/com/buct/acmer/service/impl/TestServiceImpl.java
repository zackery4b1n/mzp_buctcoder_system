package com.buct.acmer.service.impl;

import com.buct.acmer.entity.Test;
import com.buct.acmer.mapper.TestMapper;
import com.buct.acmer.service.ITestService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author BUCT
 * @since 2023-07-11
 */
@Service
public class TestServiceImpl extends ServiceImpl<TestMapper, Test> implements ITestService {

}
