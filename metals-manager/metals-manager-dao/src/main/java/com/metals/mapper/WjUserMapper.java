package com.metals.mapper;

import com.metals.pojo.WjUser;
import com.metals.pojo.WjUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjUserMapper {
    int countByExample(WjUserExample example);

    int deleteByExample(WjUserExample example);

    int deleteByPrimaryKey(Integer uid);

    int insert(WjUser record);

    int insertSelective(WjUser record);

    List<WjUser> selectByExample(WjUserExample example);

    WjUser selectByPrimaryKey(Integer uid);

    int updateByExampleSelective(@Param("record") WjUser record, @Param("example") WjUserExample example);

    int updateByExample(@Param("record") WjUser record, @Param("example") WjUserExample example);

    int updateByPrimaryKeySelective(WjUser record);

    int updateByPrimaryKey(WjUser record);
}