package com.book.utils;
/*
 * 分页查询
 */
public class PageTool {
	
	public PageTool() {}
	public PageTool(int totalCount, String currentPage,int pagesize) {
		this.totalCount = totalCount;
		this.pageSize = pagesize;
		initCurrentPage(currentPage);//当前页码初始化
		initTotalPages();//总页数初始化
		initPrePage();
		initNextPage();
		initStartIndex();
	}
	//给当前类中的当前页码进行初始化，如果currentPage为null则
	//默认查询第一页，否则查询传递过来的当前页码
	public void initCurrentPage(String currentPage) {
		if(currentPage==null) {
			this.currentPage = 1;
		}else {
			this.currentPage = Integer.valueOf(currentPage);
		}
	}
	public void initTotalPages() {
		this.totalPages = totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
	}
	public void initPrePage() {
		if(this.currentPage == 1) {
			this.prePage =1;
		}else {
			this.prePage =this.currentPage-1;
		}
	}
	public void initNextPage() {
		if(this.currentPage == this.totalPages) {
			this.nextPage = this.totalPages;
		}else {
			this.nextPage = this.currentPage+1;
		}
	}
	public void initStartIndex() {
		this.startIndex = this.pageSize *(this.currentPage-1);
	}
	private int pageSize;
	private int totalCount;
	private int totalPages;
	private int currentPage;
	private int prePage;
	private int nextPage;
	private int startIndex;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	
}
