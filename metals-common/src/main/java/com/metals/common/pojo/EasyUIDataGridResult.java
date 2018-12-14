package com.metals.common.pojo;

import java.util.List;

/**
 * EasyUI DataGrid的返回值类型
 * <p>Title: EasyUIDataGridResult</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年8月13日上午11:56:29
 * @version 1.0
 */
public class EasyUIDataGridResult {

	private Integer firstPage;
	private Integer currPageNo;
	private Integer lastPage;
	private List<?> rows;
	public EasyUIDataGridResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EasyUIDataGridResult(Integer firstPage, Integer currPageNo, Integer lastPage, List<?> rows) {
		super();
		this.firstPage = firstPage;
		this.currPageNo = currPageNo;
		this.lastPage = lastPage;
		this.rows = rows;
	}
	public Integer getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(Integer firstPage) {
		this.firstPage = firstPage;
	}
	public Integer getCurrPageNo() {
		return currPageNo;
	}
	public void setCurrPageNo(Integer currPageNo) {
		this.currPageNo = currPageNo;
	}
	public Integer getLastPage() {
		return lastPage;
	}
	public void setLastPage(Integer lastPage) {
		this.lastPage = lastPage;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
}
