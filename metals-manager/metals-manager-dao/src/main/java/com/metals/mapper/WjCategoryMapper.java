package com.metals.mapper;

import com.metals.pojo.WjCategory;
import com.metals.pojo.WjCategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjCategoryMapper {
    int countByExample(WjCategoryExample example);

    int deleteByExample(WjCategoryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(WjCategory record);

    int insertSelective(WjCategory record);

    List<WjCategory> selectByExample(WjCategoryExample example);

    WjCategory selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") WjCategory record, @Param("example") WjCategoryExample example);

    int updateByExample(@Param("record") WjCategory record, @Param("example") WjCategoryExample example);

    int updateByPrimaryKeySelective(WjCategory record);

    int updateByPrimaryKey(WjCategory record);
}