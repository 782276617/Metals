package com.metals.mapper;

import com.metals.pojo.WjOrder;
import com.metals.pojo.WjOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjOrderMapper {
    int countByExample(WjOrderExample example);

    int deleteByExample(WjOrderExample example);

    int deleteByPrimaryKey(String id);

    int insert(WjOrder record);

    int insertSelective(WjOrder record);

    List<WjOrder> selectByExample(WjOrderExample example);

    WjOrder selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") WjOrder record, @Param("example") WjOrderExample example);

    int updateByExample(@Param("record") WjOrder record, @Param("example") WjOrderExample example);

    int updateByPrimaryKeySelective(WjOrder record);

    int updateByPrimaryKey(WjOrder record);

    Double selectByPrimaryAmountKey(Integer id);
}