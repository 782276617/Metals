package com.metals.controller.mobile;

import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.JsonUtils;
import com.metals.pojo.WjAdvert;
import com.metals.pojo.WjFavorite;
import com.metals.pojo.WjGoods;
import com.metals.pojo.WjGoodsSpec;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjUser;
import com.metals.service.AdvertService;
import com.metals.service.FavoriteService;
import com.metals.service.GoodsService;
import com.metals.service.GoodsSpecService;
import com.metals.service.OrderService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({"/home"})
public class HomeController
{
  @Autowired
  private GoodsService goodsService;
  @Autowired
  private AdvertService advertService;
  @Autowired
  private GoodsSpecService goodsSpecService;
  @Autowired
  private FavoriteService favoriteService;
  @Autowired
  private OrderService orderService;
  
  @RequestMapping({"/index.htm"})
  public ModelAndView showHome(ModelAndView model)
  {
    List<WjGoods> newx = this.goodsService.selectGoodsState("new", Integer.valueOf(1), Integer.valueOf(8));
    List<WjGoods> sales = this.goodsService.selectGoodsState("sales", Integer.valueOf(1), Integer.valueOf(8));
    List<WjGoods> hotSale = this.goodsService.selectGoodsState("hotSale", Integer.valueOf(1), Integer.valueOf(8));
    List<WjAdvert> list = this.advertService.getAdvertList();
    model.addObject("advert", list);
    model.addObject("newx", newx);
    model.addObject("sales", sales);
    model.addObject("hotSale", hotSale);
    model.setViewName("/home/index");
    return model;
  }
  
  @RequestMapping({"/goods_details.htm"})
  public ModelAndView getGoods_details(String goodsId, ModelAndView model)
  {
    WjGoods goods = this.goodsService.getGoodsId(goodsId);
    model.addObject("goods", goods);
    model.setViewName("/home/goods_details");
    return model;
  }
  
  @RequestMapping({"/goods_product.htm"})
  public ModelAndView getGoods_product(String goodsId, ModelAndView model,HttpServletRequest request)
  {
	  HttpSession session = request.getSession();
	  WjUser user = (WjUser)session.getAttribute("huser");
    WjGoods goods = this.goodsService.getGoodsId(goodsId);
    List<WjFavorite> list = this.favoriteService.getFavorite(user==null?null:user.getUid(), goodsId);
    WjGoodsSpec spec = null;
    List<String> specList = new ArrayList();
    if (goods != null)
    {
      spec = this.goodsSpecService.getGoodsSpecId(goods.getSpecid());
      if ((spec != null) && (!StringUtils.isEmpty(spec.getSpec())))
      {
        List<Map> toJson = JsonUtils.jsonToList(spec.getSpec(), Map.class);
        for (Map map : toJson)
        {
          String specs = (String)map.get("spec");
          specList.add(specs);
        }
      }
      
      //更新商品点击数
      WjGoods goods2 = new WjGoods();
      goods2.setId(goodsId);
      goods2.setClickn(goods.getClickn()+1);
      goodsService.updateGoodsId(goods2);
    }
    
	  
    
    model.addObject("specJson", specList);
    model.addObject("favorite", list==null||list.size()<=0?false:true);
    model.addObject("spec", spec);
    model.addObject("goods", goods);
    model.setViewName("/home/ui_product");
    return model;
  }
  
  @RequestMapping({"/favorite"})
  @ResponseBody
  public MetalsResult goods_favorite(String goodsId,HttpServletRequest request)
  {
	  HttpSession session = request.getSession();
 	  WjUser user = (WjUser)session.getAttribute("huser");
    List<WjFavorite> list = this.favoriteService.getFavorite(user.getUid(), goodsId);
    MetalsResult result = null;
    if (list.isEmpty())
    {
      WjFavorite favorite = new WjFavorite();
      favorite.setUid(user.getUid());
      favorite.setGid(goodsId);
      favorite.setCreated(new Date());
      result = this.favoriteService.insertFavorite(favorite);
      result.setMsg("ins");
      return result;
    }
    result = this.favoriteService.delteFavorite(((WjFavorite)list.get(0)).getId());
    result.setMsg("del");
    
    return result;
  }
  
  @RequestMapping({"/newGoods.htm"})
  public ModelAndView showNewGoods(@RequestParam(defaultValue="New") String orderType, ModelAndView model)
  {
    List<WjGoods> newx = this.goodsService.selectNewGoodsState(orderType, Integer.valueOf(1), Integer.valueOf(50));
    model.addObject("orderType", orderType);
    model.addObject("data", newx);
    model.addObject("type", "new");
    model.setViewName("/home/goodsList");
    return model;
  }
  
  @RequestMapping({"/sales.htm"})
  public ModelAndView showSalesGoods(@RequestParam(defaultValue="New") String orderType, ModelAndView model)
  {
    List<WjGoods> newx = this.goodsService.selectSalesGoodsState(orderType, Integer.valueOf(1), Integer.valueOf(50));
    model.addObject("orderType", orderType);
    model.addObject("data", newx);
    model.addObject("type", "sales");
    model.setViewName("/home/goodsList");
    return model;
  }
  
  
  @RequestMapping({"/recentOrders.htm"})
  public ModelAndView recentOrders(ModelAndView model,HttpServletRequest request){
	HttpSession session = request.getSession();
	WjUser user = (WjUser)session.getAttribute("huser");
	List<WjOrder> AllList = null;
	if(user!=null){
		AllList = this.orderService.selectUOrderList(user.getUid(), null);
	}
    model.addObject("data", AllList);
    model.setViewName("/home/my_recentOrders");
    return model;
  }
}
