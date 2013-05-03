package com.youerba.util;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

public class TypeUtils {
	/**
	 * 字符串是否为空判断
	 * 
	 * @param str
	 * @return true:为空;false:不为空
	 */
	public static boolean isEmptyString(String str) {
		if (str == null || str.isEmpty() || "null".equals(str)) {
			return true;
		}
		return false;
	}
	public static <E> List<E> querySubList(List<E> list, int pageNow, int pageSize){
		int totalPage = list.size() % pageSize == 0?list.size() / pageSize : list.size() / pageSize + 1;
		if(pageNow > totalPage){
			pageNow = totalPage;
		}
		int pageStart = pageNow * pageSize - pageSize;
		if(pageStart < 0){
			pageStart = 0;
		}
		int pageEnd = pageStart + pageSize;
		if(list.size() < pageEnd){
			pageEnd = list.size();
		}
		return list.subList(pageStart, pageEnd);
	}
	/**
	 * 从request中取出参数值：字符串
	 * 
	 * @param paramName
	 *            参数名
	 * @param req
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static String getStringParameterFromRequest(String paramName,
			HttpServletRequest req, String defaultValue) {
		if (TypeUtils.isEmptyString(paramName)) {
			return defaultValue;
		}
		String value = req.getParameter(paramName);
		if (TypeUtils.isEmptyString(value)) {
			return defaultValue;
		}
		return value;
	}

	
	/**
	 * 从request中取出参数值：Double
	 * 
	 * @param paramName
	 *            参数名
	 * @param req
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static Double getDoubleParameterFromRequest(String paramName,
			HttpServletRequest req, double defaultValue) {
		if (TypeUtils.isEmptyString(paramName)) {
			return defaultValue;
		}
		String value = req.getParameter(paramName);
		try {
			return Double.parseDouble(value);
		} catch (Exception e) {
		}
		return defaultValue;
	}
	/**
	 * 从request中取出整形参数值
	 * 
	 * @param paramName
	 *            参数名
	 * @param req
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static int getIntParameterFromRequest(String paramName,
			HttpServletRequest req, int defaultValue) {
		if (TypeUtils.isEmptyString(paramName)) {
			return defaultValue;
		}
		String value = req.getParameter(paramName);
		try {
			return Integer.parseInt(value);
		} catch (Exception e) {
		}
		return defaultValue;
	}
	
	private static Random rand = new Random(System.currentTimeMillis());
	/**
	 * 随机的int值
	 * @param max
	 * @return
	 */
	public static int randNumber(int max) {
		return rand.nextInt(max);
	}
	/**
	 * 随机int值,左闭右开
	 * @param min 大于等于
	 * @param max 小于
	 * @return
	 */
	public static int randNumber(int min, int max) {
		return (rand.nextInt(max - min) + min);
	}
}
