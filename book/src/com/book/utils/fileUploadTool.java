package com.book.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class fileUploadTool {
	//文件上传操作
	public static String fileUpload(String errorPage,Part part,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//判断是否选择了上传的图片
		if(part.getSize()==0) {
			request.setAttribute("msg","请选择要上传的图片");
			request.getRequestDispatcher(errorPage).forward(request, response);
			return "";
		}
		//上传图片名称
		String filename = part.getSubmittedFileName();
		//System.out.println(filename);
		//获取文件格式
		String type = filename.substring(filename.lastIndexOf(".")+1);
		//	System.out.println(type);
		//判断文件格式
		if(!"jpg".equals(type)&&!"jpeg".equals(type)&&!"png".equals(type)&&!"gif".equals(type)) {
		request.setAttribute("msg","图片格式不正确");
		request.getRequestDispatcher(errorPage).forward(request, response);
		return "";
		}
		String photo = UUID.randomUUID()+filename;
		//	System.out.println(filename);
		String path = "D:/Users/dell/eclipse-workspace/bookpic";
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
		//上传操作fileName指的是上传图片的完整路径
		part.write(path+"/"+photo);
		return photo;
	}
}
