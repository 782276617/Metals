package com.metals.service;

import java.util.List;

import com.metals.common.pojo.MetalsResult;
import com.metals.pojo.WjFavorite;

public interface FavoriteService {
	
	MetalsResult insertFavorite(WjFavorite favorite);
	
	MetalsResult delteFavorite(Integer favoriteId);
	
	List<WjFavorite> getFavorite(Integer userId,String goodsId);
	
	MetalsResult deleteFavorite(Integer id);
	
}
