package com.metals.mapper;

import com.metals.pojo.WjGoodsSpec;
import com.metals.pojo.WjGoodsSpecExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjGoodsSpecMapper {
    int countByExample(WjGoodsSpecExample example);

    int deleteByExample(WjGoodsSpecExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WjGoodsSpec record);

    int insertSelective(WjGoodsSpec record);

    List<WjGoodsSpec> selectByExampleWithBLOBs(WjGoodsSpecExample example);

    List<WjGoodsSpec> selectByExample(WjGoodsSpecExample example);

    WjGoodsSpec selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WjGoodsSpec record, @Param("example") WjGoodsSpecExample example);

    int updateByExampleWithBLOBs(@Param("record") WjGoodsSpec record, @Param("example") WjGoodsSpecExample example);

    int updateByExample(@Param("record") WjGoodsSpec record, @Param("example") WjGoodsSpecExample example);

    int updateByPrimaryKeySelective(WjGoodsSpec record);

    int updateByPrimaryKeyWithBLOBs(WjGoodsSpec record);

    int updateByPrimaryKey(WjGoodsSpec record);
}