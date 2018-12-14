package com.metals.mapper;

import com.metals.pojo.WjAdvert;
import com.metals.pojo.WjAdvertExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjAdvertMapper {
    int countByExample(WjAdvertExample example);

    int deleteByExample(WjAdvertExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WjAdvert record);

    int insertSelective(WjAdvert record);

    List<WjAdvert> selectByExample(WjAdvertExample example);

    WjAdvert selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WjAdvert record, @Param("example") WjAdvertExample example);

    int updateByExample(@Param("record") WjAdvert record, @Param("example") WjAdvertExample example);

    int updateByPrimaryKeySelective(WjAdvert record);

    int updateByPrimaryKey(WjAdvert record);
}