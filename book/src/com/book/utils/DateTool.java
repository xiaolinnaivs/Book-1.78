package com.book.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
   * 实现日期格式Date类型与String之间的相互转换
 */
public class DateTool {
	//静态成员属于类所拥有的，类可以打点调用
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//将字符串转日期
	public static Date stringToDate(String str) {
		try {
			return sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	//将日期转字符串
	public static String dateToString(Date dt) {
		return sdf.format(dt);
	}
}
