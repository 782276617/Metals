package com.taotao.pagehelper;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metals.common.utils.CommUtil;
import com.metals.common.utils.JsonUtils;
import com.metals.common.utils.UserPic;
import com.metals.mapper.WjGoodsMapper;
import com.metals.mapper.WjGoodsSpecMapper;
import com.metals.mapper.WjOrderItemMapper;
import com.metals.mapper.WjOrderMapper;
import com.metals.mapper.WjUserMapper;
import com.metals.pojo.WjGoods;
import com.metals.pojo.WjGoodsExample;
import com.metals.pojo.WjGoodsSpec;
import com.metals.pojo.WjGoodsSpecExample;
import com.metals.pojo.WjOrder;
import com.metals.pojo.WjOrderExample;
import com.metals.pojo.WjOrderExample.Criteria;
import com.metals.pojo.WjOrderItem;
import com.metals.pojo.WjOrderItemExample;
import com.metals.pojo.WjUser;
import com.metals.pojo.WjUserExample;
import com.metals.utils.Rows;

public class TestPageHelper {
	
	private ApplicationContext applicationContext;
	
	@Before
	public void init() {
		//创建一个spring容器
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
	}

	@Test
	public void testPageHelper() throws Exception {
		//从spring容器中获得Mapper的代理对象
		WjOrderMapper itemMapper =  applicationContext.getBean(WjOrderMapper.class);
		//设置分页信息
		
		WjOrderExample example = new WjOrderExample();
		Criteria criteria = example.createCriteria();
		List<Integer> lists = new ArrayList<>();
		lists.add(3);
		lists.add(6);
		lists.add(7);
		lists.add(20);
		criteria.andAidIn(lists);
		PageHelper.startPage(1, 10);
		//执行查询
		List<WjOrder> list = itemMapper.selectByExample(example);
		//取查询结果
		PageInfo<WjOrder> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		System.out.println("总数："+total);
		
		System.out.println("首页："+pageInfo.getFirstPage());
		System.out.println("末页："+pageInfo.getLastPage());
		System.out.println("末页："+pageInfo.getEndRow());
		System.out.println("末页："+pageInfo.getStartRow());
		System.out.println("总页数："+pageInfo.getPageSize());
		
		
		for (WjOrder tbItem : list) {
			System.out.println(tbItem.getAid());
		}
	}
	
	
	@Test
	public void testPageHelper2() throws Exception {
/*		WjCategoryMapper itemMapper = applicationContext.getBean(WjCategoryMapper.class);
		WjCategoryExample example = new WjCategoryExample();
		List<WjCategory> list = itemMapper.selectByExample(example);
		
		Map<Long,String> map = new HashMap<>();
		Map<Long,CategoryNode> map2 = new HashMap<>();
		for (WjCategory category : list) {
			if(category.getParentId()==0) {
				//父分类
				map.put(category.getId(),category.getName());
			}else {
				//子分类
				CategoryNode node = new CategoryNode();
				node.setId(category.getId());
				node.setName(category.getName());
				node.setParentId(category.getParentId());
				map2.put(category.getId(),node);
			}
		}
		
		
		
		Map<Long,List<Long>> zd = new HashMap<>();
		
		//父迭代器
		Set<Entry<Long, String>> entrySet = map.entrySet();
		Iterator<Entry<Long, String>> iterator = entrySet.iterator();
		
		//子迭代器
		Set<Entry<Long, CategoryNode>> entrySet2 = map2.entrySet();
		Iterator<Entry<Long, CategoryNode>> iterator2 = entrySet2.iterator();	
		
		
		while(iterator.hasNext()) {
			Entry<Long, String> next = iterator.next();
			Long key = next.getKey();
			List<Long> lists = new ArrayList<>();
			while(iterator2.hasNext()){
				Entry<Long, CategoryNode> next2 = iterator2.next();
				CategoryNode value = next2.getValue();
				if(key==value.getParentId()) {
					lists.add(next2.getKey());
				}
			}
			
			zd.put(key, lists);
		}*/
		
		
		/*
			Set<Entry<Long, List<Long>>>  entrySetzd = zd.entrySet();
			Iterator<Entry<Long, List<Long>>> iterator3 = entrySetzd.iterator();
			while(iterator3.hasNext()) {
				Entry<Long, List<Long>> next = iterator3.next();
				Long key = next.getKey();
				System.out.println("父节点："+map.get(key));
				List<Long> value = next.getValue();
				for(Long ls:value){
					System.out.println("======="+map2.get(ls).getName());
				}
				
			}*/
	}
	
	@Test
	public void testPageHelper3() throws Exception {
		WjOrderMapper mapper = applicationContext.getBean(WjOrderMapper.class);
		WjOrderExample example = new WjOrderExample();
		Criteria criteria = example.createCriteria();
		Date strToDate = CommUtil.StrToDate("2018-08-07 00:00:00");
		Date strToDate2 = CommUtil.StrToDate("2018-08-29 00:00:00");
		
		criteria.andCreateTimeGreaterThanOrEqualTo(strToDate);
		criteria.andCreateTimeLessThanOrEqualTo(strToDate2);
		
		List<WjOrder> list = mapper.selectByExample(example);
		
		System.out.println(list.size());
		
	}
	
	
	@Test
	public void testPageHelper32() throws Exception {
		WjGoodsMapper mapper = applicationContext.getBean(WjGoodsMapper.class);
		
		PageHelper.startPage(2, 10);
		WjGoodsExample example = new WjGoodsExample();

		List<WjGoods>	list = mapper.selectByExample(example);
		
		
		PageInfo<WjGoods> pageInfo = new PageInfo<>(list);
		
		
		System.out.println("当前页开始行数："+pageInfo.getStartRow());
		System.out.println("当前页结束行数："+pageInfo.getEndRow());
		System.out.println("当前导航第一页数："+pageInfo.getFirstPage());
		System.out.println("导航数组："+Arrays.toString(pageInfo.getNavigatepageNums()));
		System.out.println("当前导航最后一页数："+pageInfo.getLastPage());
		System.out.println("导航数："+pageInfo.getNavigatePages());


		System.out.println("==========================");
		System.out.println("上一页数："+pageInfo.getPrePage());
		System.out.println("当前页数(pages)："+pageInfo.getPageNum());
		System.out.println("下一页数："+pageInfo.getNextPage());
		
		
		System.out.println("==========================");
		System.out.println("每页总行数(rows)："+pageInfo.getPageSize());
		System.out.println("当前总行数："+pageInfo.getSize());
		
		
		System.out.println("==========================");
		System.out.println("总页数："+pageInfo.getPages());
		System.out.println("总数："+pageInfo.getTotal());
		
		
		
		System.out.println("==========================");
		List<WjGoods> list2 = pageInfo.getList();
		
		for (WjGoods wjGoods : list2) {
			System.out.println(wjGoods.getName());
		}
		System.out.println("不是最后一页："+pageInfo.isHasNextPage());
		System.out.println("不是第一页："+pageInfo.isHasPreviousPage());
		System.out.println("是否第一页："+pageInfo.isIsFirstPage());
		System.out.println("是否最后一页："+pageInfo.isIsLastPage());
		
	}
	
	@Test
	public void testPageHelper4()  {
		WjOrderMapper mapper = applicationContext.getBean(WjOrderMapper.class);
		WjOrderExample example = new WjOrderExample();

		int	count = mapper.countByExample(example);
		
		System.out.println(count);
		
		System.out.println(String.format("%03d",24421));
	}
	
	
	@Test
	public void testJsonData() {
		WjGoodsSpecMapper mapper = applicationContext.getBean(WjGoodsSpecMapper.class);
		WjGoodsSpecExample example = new WjGoodsSpecExample();
		List<WjGoodsSpec> list = mapper.selectByExampleWithBLOBs(example);
		StringBuffer strbuf = new StringBuffer();
		for (WjGoodsSpec spec : list) {
			String spec2 = spec.getSpec();
			String replace = spec2.substring(1, spec2.length()-1);
			System.out.println(replace+"============");
			String[] split = replace.split(",");
			for (int i = 0; i < split.length; i++) {
				String[] string = split[i].split(":");
				if(string.length>=2){
					if(i==split.length-1) {
						strbuf.append(string[1]);
					}else {
					    strbuf.append(string[1]+"、");
					}
				}
			}
			System.out.println(strbuf.toString());
			strbuf.setLength(0);
		}
	}
	
	
	
	@Test
	public void testJsonData2() {
		WjGoodsSpecMapper mapper = applicationContext.getBean(WjGoodsSpecMapper.class);
		WjGoodsSpecExample example = new WjGoodsSpecExample();
		List<WjGoodsSpec> list = mapper.selectByExampleWithBLOBs(example);
		for (WjGoodsSpec spec : list) {
			String jsonData = spec.getSpec();
			List<Map> jsonToList = JsonUtils.jsonToList(jsonData, Map.class);
			for (Map map : jsonToList) {
				System.out.println(map.get("order") +"======="+map.get("spec"));
			}
		}
	}
	
	
	
		@Test
	public void testJsonData3() {
			WjGoodsMapper mapper = applicationContext.getBean(WjGoodsMapper.class);
			WjGoodsExample example = new WjGoodsExample();
			example.setOrderByClause("price desc");
			
			List<WjGoods> list = mapper.selectByExample(example);
			for (WjGoods goods : list) {
					System.out.println(goods.getName() +"======="+goods.getSpecid()+"=========="+goods.getPrice());
			}
		}
		
		
	@Test
	public void testMap(){
		WjOrderItemMapper orderItemMapper = applicationContext.getBean(WjOrderItemMapper.class);
		WjOrderMapper orderMapper = applicationContext.getBean(WjOrderMapper.class);
		WjOrderExample example = new WjOrderExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(1);
		example.setOrderByClause("create_time desc");
		List<WjOrder> list = orderMapper.selectByExample(example);
		Map<WjOrder,List<WjOrderItem>> map = new HashMap<>();
		for (WjOrder wjOrder : list) {
			WjOrderItemExample example2 = new WjOrderItemExample();
			com.metals.pojo.WjOrderItemExample.Criteria criteria2 = example2.createCriteria();
			criteria2.andOrderIdEqualTo(wjOrder.getId());
			List<WjOrderItem> list2 = orderItemMapper.selectByExample(example2);
			map.put(wjOrder,list2);
		}
	}
	
	@Test
	public void testMap2(){
		WjGoodsMapper advertMapper = applicationContext.getBean(WjGoodsMapper.class);
		WjGoodsExample example = new WjGoodsExample();
		List<WjGoods> item = advertMapper.selectByExample(example);
		
		com.metals.utils.LayuiDataGridResult result = new com.metals.utils.LayuiDataGridResult();
		result.setTotal(item.size());
		Rows rows = new Rows();
		rows.setItem(item);
		result.setRows(rows);
		String string = JsonUtils.objectToJson(result);
		System.out.println(string);
	}
	
	@Test
	public void testMap22(){
		WjGoodsMapper advertMapper = applicationContext.getBean(WjGoodsMapper.class);
		
		WjGoodsExample example = new WjGoodsExample();
		String[] gIds = new String[]{"1233","1234","1233"};
		Integer[] number  = new Integer[]{5,20,5};
		for (int i = 0; i < gIds.length; i++) {
			com.metals.pojo.WjGoodsExample.Criteria criteria = example.or();
			criteria.andIdIn(Arrays.asList(gIds[i]));
			//库存数量必须大于零
			criteria.andStocknGreaterThanOrEqualTo(number[i]);
		}
		
	
		List<WjGoods> list = advertMapper.selectByExample(example);
		if(list!=null&&list.size()>0) {
			if((list.size()+1)==gIds.length){
				System.out.println("ok");
				return;
			}
		}
		System.out.println("失败");
	
	}
	


	
	@Test
	public void teaasd(){
		for (int i = 0; i < 100; i++) {
			String str = UserPic.randomPic();
			System.out.println(str);
		}
		
	}
	@Test
	public void testnumberxx(){
		String [] arry = {"2","2","1","1","3","3","1","1","1","2","2","2","3","3"};
		Map<String,String> map = new HashMap<String, String>();
		for(int i =0 ;i<arry.length;i++){
			if(null!= map.get(arry[i])){
				//重复
				//取出之前值
				String str = map.get(arry[i]);
				//进行拼接
				map.put(arry[i], str+","+i); //value+1
			}else{
			    //不重复
				map.put(arry[i],i+"");
			}
		}
		
		Iterator it = map.entrySet().iterator();  
		while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();   
			String  key  =  entry.getKey().toString();      
			String  value  =  entry.getValue().toString();
			System.out.println("key is :"+key+"---value :"+value);
		} 
	}
}
