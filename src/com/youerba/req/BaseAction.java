package com.youerba.req;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class BaseAction extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1999973350540476896L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String page = doRequest(req, resp);
		if(!page.startsWith("/") && !page.startsWith("http")){
			page = "/" + page;
		}
		resp.setCharacterEncoding("utf-8");
		try {
			resp.sendRedirect(page);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 子类需要实现
	 * @param req
	 * @param res
	 */
	abstract protected String doRequest(HttpServletRequest req, HttpServletResponse res);
	
}