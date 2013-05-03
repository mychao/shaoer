package com.youerba.req;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 首页请求
 * @author mychao
 *
 */
public class IndexAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 964907976658982912L;

	@Override
	protected String doRequest(HttpServletRequest req, HttpServletResponse res) {
		return "/index.jsp";
	}
	
}
