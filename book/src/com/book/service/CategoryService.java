package com.book.service;

import java.util.List;

import com.book.entity.Category;
import com.book.utils.PageTool;
import com.book.dao.CategoryDao;

public class CategoryService {
	CategoryDao cd = new CategoryDao();
	public List<Category> findAllCategory() {
		// TODO Auto-generated method stub
		return cd.findAllCategory();
	}
	public int getTotalCount() {//获取数据库中分类表总数据数目
		return cd.getTotalCount();
	}
	public int getTotalCount2(String search) {
		return cd.getTotalCount2(search);
	}
	public List<Category> findcategoryByPage(PageTool p) {//获取数据库中分类表数据信息
		 return cd.findCategoryByPage(p);
	}

	public boolean addcategory(Category category) {//添加商品分类项
			return cd.addcategory(category)>0?true:false;
		}

	public Category findCategoryByCid(String cid) {//获取分类表中对应id的分类项信息
		return cd.findCategoryByCid(cid);
	}

	public boolean updatecategory(Category category) {//修改当前商品分类项信息
		return cd.updatecategory(category)>0?true:false;
	}

	public boolean deletecategory(String cids) {//删除当前多个分类项信息
		return cd.deletecategory(cids)>0?true:false;
	}

	public boolean deletecategoryById(String cid) {//删除当前单个分类项信息
		return cd.deletecategoryById(cid)>0?true:false;
	}

	public List<Category> findTheCategory(String search,PageTool p) {//模糊查找书籍信息
		// TODO Auto-generated method stub
		return cd.findTheCategory(search,p);
	}
	public List<Category> findcategoryByCondition(int row){
		return cd.findcategoryByCondition(row);
	}
}
