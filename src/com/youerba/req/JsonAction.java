package com.youerba.req;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.youerba.bean.VideoBean;
import com.youerba.service.ShaoerService;
import com.youerba.util.TypeUtils;

/**
 * ajax 请求
 * @author mychao
 *
 */
public class JsonAction extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5761813590897695098L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
		String result = "";
		//方法名
		int methodId = TypeUtils.getIntParameterFromRequest("m", req, 0);
		switch(methodId){
		case 1://获取分类下视频分页数据
			int categoryId = TypeUtils.getIntParameterFromRequest("cid", req, 1);
			int pageNow = TypeUtils.getIntParameterFromRequest("page", req, 1);
			int pageSize = TypeUtils.getIntParameterFromRequest("ps", req, 10);
			
			List<VideoBean> videoList = ShaoerService.getInstance().queryByCategoryId(categoryId, pageNow, pageSize);
			
			result = ShaoerService.gson.toJson(videoList);
			System.out.println(result);
			break;
		case 2://搜索
			String keywords = TypeUtils.getStringParameterFromRequest("keyword", req, null);
			List<VideoBean> videos = ShaoerService.getInstance().searchByName(keywords);
			if(videos != null && videos.size() > 0){
				StringBuffer sb = new StringBuffer();
				for(VideoBean video: videos){
					//<li><a href="javascript:void(0);">0<font color='red'>1</font>你好!问候用语</a></li>
					sb.append("<li>");
					sb.append("<a href=\"javascript:void(0);\">");
					sb.append(video.getName());
					sb.append("</a></li>");
				}
				result = sb.toString();
			}
			break;
		default :
		}
		resp.getOutputStream().print("======="+result);
//		resp.setCharacterEncoding("utf-8");
//		resp.setContentType("text/plain");
//		PrintWriter pw = resp.getWriter();
//		System.out.println("json result: " + result);
//		pw.write(result);
//		pw.flush();
//		pw.close();
	}
	
}
