package com.metals.trsk;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.metals.common.utils.CommUtil;
import com.metals.service.GoodsService;
import com.metals.service.OrderService;
import com.metals.service.UserService;

@Component
public class TaskCool {
		@Autowired
		private UserService userService;
		@Autowired
		private GoodsService goodsService;
		@Autowired
		private OrderService orderService;
	
	
	//每周执行一次
		@Scheduled(cron="00 05 00 * * 1")
	   public void weekly(){
			InitWeeklyTask();
	    }
	   
	   
	
	//每半小时执行一次
	   @Scheduled(cron="00 00,30 * * * *")
	   public void halfAnHour(){
		   InithalfAnHourTask();
	    }
	 
	   
	//每十分钟执行一次
	   @Scheduled(cron="00 00,20,30,40,50 * * * *")
	   public void orderState(){
		   InitOrderStateTask();
	    }
	 
	   
	   @PostConstruct
	   public  void InithalfAnHourTask(){
		   Calendar calendar = new GregorianCalendar();
		   calendar.setTime(new Date());
		   //本次统计时间
		   String thisstrTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		  
		   calendar.add(calendar.MINUTE, +30);
		   //半小时后的时间
		   String afterstrTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		   
		   //统计数据
		   Date thisTime = CommUtil.StrToDate(thisstrTime);
		   Date afterTime = CommUtil.StrToDate(afterstrTime);
		   int goodsCount = goodsService.getGoodsCount(null, null);
		   int userCount = userService.getUserCount(null,null);
		   int orderCount = orderService.getOrderCount(null, null);
		   //重新计算时间
		   
		   //保存数据
		   HourResult.Thistime = thisTime;
		   HourResult.Nexttime = afterTime;
		   HourResult.userCount = userCount;
		   HourResult.goodsCount = goodsCount;
		   HourResult.orderCount = orderCount;
		   
		   System.out.println("本小时统计数据完成!!!");
	   }
	   
	   @PostConstruct
	   public void InitWeeklyTask(){
		   Calendar calendar = new GregorianCalendar();
		   calendar.setTime(new Date());
		   //本次统计时间
		   String endStrTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		   //一个礼拜前的时间
		   calendar.add(calendar.WEEK_OF_MONTH, -1);
		   String beginStrTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		   
		   //统计数据
		   Date beginTime = CommUtil.StrToDate(beginStrTime);
		   Date endTime = CommUtil.StrToDate(endStrTime);
		   int userCount = userService.getUserCount(beginTime,endTime);
		   int goodsCount = goodsService.getGoodsCount(beginTime, endTime);
		   int orderCount = orderService.getOrderCount(beginTime, endTime);
		   
		   //重新计算时间
		   calendar.add(calendar.WEEK_OF_MONTH, 2);
		   WeekTaskResult.Thistime = endTime;
		   WeekTaskResult.Nexttime = calendar.getTime();
		   WeekTaskResult.newUserCount = userCount;
		   WeekTaskResult.newGoodsCount = goodsCount;
		   WeekTaskResult.newOrderCount = orderCount;
		   System.out.println("一周统计数据完成!!!");
	   }
	   
	   @PostConstruct
	   public void InitOrderStateTask(){
		   Calendar calendar = new GregorianCalendar();
		   calendar.setTime(new Date());
		   //本次统计时间
		   String thisstrTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		  
		   calendar.add(calendar.MINUTE, +10);
		   //半小时后的时间
		   String afterstrTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		   
		   //统计数据
		   
		   //本次统计时间
		   Date thisTime = CommUtil.StrToDate(thisstrTime);
		   //下次统计时间
		   Date afterTime = CommUtil.StrToDate(afterstrTime);
		   
		   //待处理
		   int state1 = orderService.getOrderStateCount(1);
		   //待发货
		   int state2 = orderService.getOrderStateCount(2);
		   //发货中
		   int state3 = orderService.getOrderStateCount(3);
		   //已接收
		   int state4 = orderService.getOrderStateCount(4);
		   
		   //保存数据
		   OrderStateResult.Thistime = thisTime;
		   OrderStateResult.Nexttime = afterTime;
		   OrderStateResult.pendingCount = state1;
		   OrderStateResult.consignmentCount = state2;
		   OrderStateResult.shippingCount = state3;
		   OrderStateResult.receivedCount = state4;
	   }
}
