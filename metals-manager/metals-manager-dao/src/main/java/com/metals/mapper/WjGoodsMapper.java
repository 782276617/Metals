package com.metals.mapper;

import com.metals.pojo.WjGoods;
import com.metals.pojo.WjGoodsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjGoodsMapper {
    int countByExample(WjGoodsExample example);

    int deleteByExample(WjGoodsExample example);

    int deleteByPrimaryKey(String id);

    int insert(WjGoods record);

    int insertSelective(WjGoods record);

    List<WjGoods> selectByExampleWithBLOBs(WjGoodsExample example);

    List<WjGoods> selectByExample(WjGoodsExample example);

    WjGoods selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") WjGoods record, @Param("example") WjGoodsExample example);

    int updateByExampleWithBLOBs(@Param("record") WjGoods record, @Param("example") WjGoodsExample example);

    int updateByExample(@Param("record") WjGoods record, @Param("example") WjGoodsExample example);

    int updateByPrimaryKeySelective(WjGoods record);

    int updateByPrimaryKeyWithBLOBs(WjGoods record);

    int updateByPrimaryKey(WjGoods record);
}