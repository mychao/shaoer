<%@page contentType="text/plain; charset=utf-8"%>
<%@page import="com.youerba.service.ShaoerService"%>
<%@page import="com.youerba.bean.VideoBean"%>
<%@page import="com.youerba.util.TypeUtils"%>
<%@page import="java.util.List" %>
<%
response.setContentType("text/html");
response.setCharacterEncoding("utf-8");
String result = "";
String keywords = TypeUtils.getStringParameterFromRequest("keyword", request, null);
System.out.println("keywords: " + keywords);
List<VideoBean> videos = ShaoerService.getInstance().searchByName(keywords);
if(videos != null && videos.size() > 0){
	StringBuffer sb = new StringBuffer();
	String tmp = "";
	int i = 0;
	for(VideoBean video: videos){
		tmp = video.getName().trim();
		//<li><a href="javascript:void(0);">0<font color='red'>1</font>你好!问候用语</a></li>
		sb.append("<li>");
		sb.append("<a href=\"javascript:void(0);\">");
		sb.append(tmp.replace(keywords, "<font color='red'>"+keywords+"</font>"));
		sb.append("</a></li>");
		i ++;
		if(i > 9){
			break;
		}
	}
	result = sb.toString();
}
out.print(result);
%>