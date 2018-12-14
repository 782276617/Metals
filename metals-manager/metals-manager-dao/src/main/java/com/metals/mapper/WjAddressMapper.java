package com.metals.mapper;

import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjAddress;
import com.metals.pojo.WjAddressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjAddressMapper {
    int countByExample(WjAddressExample example);

    int deleteByExample(WjAddressExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WjAddress record);

    int insertSelective(WjAddress record);

    List<WjAddress> selectByExample(WjAddressExample example);

    WjAddress selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WjAddress record, @Param("example") WjAddressExample example);

    int updateByExample(@Param("record") WjAddress record, @Param("example") WjAddressExample example);

    int updateByPrimaryKeySelective(WjAddress record);

    int updateByPrimaryKey(WjAddress record);
}