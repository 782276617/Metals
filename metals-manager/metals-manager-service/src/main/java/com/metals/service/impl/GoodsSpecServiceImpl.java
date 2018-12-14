package com.metals.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.metals.common.pojo.EasyUIDataGridResult;
import com.metals.common.pojo.MetalsResult;
import com.metals.common.utils.JsonUtils;
import com.metals.mapper.WjGoodsSpecMapper;
import com.metals.pojo.WjGoodsSpec;
import com.metals.pojo.WjGoodsSpecExample;
import com.metals.pojo.WjGoodsSpecExample.Criteria;
import com.metals.service.GoodsSpecService;

@Service
public class GoodsSpecServiceImpl implements GoodsSpecService {

	@Autowired
	private WjGoodsSpecMapper goodsSpecMapper;
	
	/* (non-Javadoc)
	 * @see com.metals.service.GoodsSpecService#getGoodsSpecList(int, int)
	 */
	@Override
	public EasyUIDataGridResult getGoodsSpecList(int page, int rows) {
		PageHelper.startPage(page, rows);
		
		WjGoodsSpecExample example = new WjGoodsSpecExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(1);
		List<WjGoodsSpec> list = goodsSpecMapper.selectByExampleWithBLOBs(example);
		for (WjGoodsSpec spec : list) {
				if(!StringUtils.isEmpty(spec.getSpec())){
					
				List<Map> toList = JsonUtils.jsonToList(spec.getSpec(),Map.class);
				StringBuffer sb = new StringBuffer();
				for (Map map : toList) {
					sb.append(map.get("spec")+"、");
				}
				sb.deleteCharAt(sb.length()-1);
				spec.setSpec(sb.toString());
			}
		}
		PageInfo<WjGoodsSpec> pageInfo = new PageInfo<>(list);
		
		return new EasyUIDataGridResult(pageInfo.getFirstPage(),page,pageInfo.getPages(),list);
	}

	@Override
	public MetalsResult insertGoodsSpec(WjGoodsSpec goodsSpec) {
		int i = goodsSpecMapper.insertSelective(goodsSpec);
		if (i>0) {
			return MetalsResult.build(200,"数据保存成功！");
		}
		return MetalsResult.build(500,"数据保存失败！");
	}

	@Override
	public WjGoodsSpec getGoodsSpecId(Integer id) {
		WjGoodsSpec spec = goodsSpecMapper.selectByPrimaryKey(id);
		return spec;
	}

	@Override
	public MetalsResult updateGoodsSpec(WjGoodsSpec goodsSpec) {
		int i = goodsSpecMapper.updateByPrimaryKeySelective(goodsSpec);
		if (i>0) {
			return MetalsResult.build(200,"数据更新成功！");
		}
		return MetalsResult.build(500,"数据更新失败！");
	}

	@Override
	public MetalsResult deleteGoodsSpec(Integer id) {
		WjGoodsSpec spec = new WjGoodsSpec();
		spec.setId(id);
		spec.setStatus(2);
		int i = goodsSpecMapper.updateByPrimaryKey(spec);
		if (i>0) {
			return MetalsResult.build(200,"数据删除成功！");
		}
		return MetalsResult.build(500,"数据删除失败！");
	}

}
