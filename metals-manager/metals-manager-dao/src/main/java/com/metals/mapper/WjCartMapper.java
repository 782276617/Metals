package com.metals.mapper;

import com.metals.pojo.WjCart;
import com.metals.pojo.WjCartExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjCartMapper {
    int countByExample(WjCartExample example);

    int deleteByExample(WjCartExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WjCart record);

    int insertSelective(WjCart record);

    List<WjCart> selectByExample(WjCartExample example);

    WjCart selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WjCart record, @Param("example") WjCartExample example);

    int updateByExample(@Param("record") WjCart record, @Param("example") WjCartExample example);

    int updateByPrimaryKeySelective(WjCart record);

    int updateByPrimaryKey(WjCart record);
}