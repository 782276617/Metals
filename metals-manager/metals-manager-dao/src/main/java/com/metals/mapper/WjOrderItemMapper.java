package com.metals.mapper;

import com.metals.pojo.WjOrderItem;
import com.metals.pojo.WjOrderItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjOrderItemMapper {
    int countByExample(WjOrderItemExample example);

    int deleteByExample(WjOrderItemExample example);

    int deleteByPrimaryKey(String id);

    int insert(WjOrderItem record);

    int insertSelective(WjOrderItem record);

    List<WjOrderItem> selectByExample(WjOrderItemExample example);

    WjOrderItem selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") WjOrderItem record, @Param("example") WjOrderItemExample example);

    int updateByExample(@Param("record") WjOrderItem record, @Param("example") WjOrderItemExample example);

    int updateByPrimaryKeySelective(WjOrderItem record);

    int updateByPrimaryKey(WjOrderItem record);
}