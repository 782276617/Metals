package com.metals.mapper;

import com.metals.pojo.WjFavorite;
import com.metals.pojo.WjFavoriteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WjFavoriteMapper {
    int countByExample(WjFavoriteExample example);

    int deleteByExample(WjFavoriteExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WjFavorite record);

    int insertSelective(WjFavorite record);

    List<WjFavorite> selectByExample(WjFavoriteExample example);

    WjFavorite selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WjFavorite record, @Param("example") WjFavoriteExample example);

    int updateByExample(@Param("record") WjFavorite record, @Param("example") WjFavoriteExample example);

    int updateByPrimaryKeySelective(WjFavorite record);

    int updateByPrimaryKey(WjFavorite record);
}