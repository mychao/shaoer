<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.youerba.bean.CategoryBean"%>
<%@page import="com.youerba.bean.VideoBean"%>
<%@page import="com.youerba.util.TypeUtils"%>
<%@page import="com.youerba.service.ShaoerService"%>
<%@page import="java.util.List" %>

<%
int id = TypeUtils.getIntParameterFromRequest("id", request, 0);
VideoBean video = ShaoerService.getInstance().queryForVideoById(id);
if(video == null){
	return;
}
CategoryBean category = ShaoerService.getInstance().queryById(video.getCateid());
int totalSize = ShaoerService.getInstance().statByCategoryId(category.getId());
int pageSize = 10;
int totalPage = totalSize % pageSize == 0?totalSize / pageSize : totalSize / pageSize + 1;
int pageNow = TypeUtils.randNumber(1, totalPage);
List<VideoBean> relatedVideos = ShaoerService.getInstance().queryByCategoryId(category.getId(), pageNow, pageSize);

%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="seo.html"></jsp:include>
<title>详情-<%=ShaoerService.TITLE %></title>
<link rel="stylesheet" href="/css/base.css">
</head>
<body>
	<div id="mainpage">
		<div class="navbox">
			<h1>
				<a href="612.jsp?cid=<%=video.getCateid() %>"><%=category.getName() %></a>><%=video.getName() %>
			</h1>
			<p class="r_btn">
				<a href="javascript:history.go(-1);">返回</a>
			</p>
		</div>

		<div class="maincont">
			<div class="playvideo">
				<div class="videocont">
					<video
						poster="<%=video.getImgurl() %>"
						src="<%=video.getPlayurl() %>"
						width="285" loop="loop" controls="controls" tabindex="0"
						preload="auto" autoplay="autoplay">
					</video>
				</div>
				<div class='ct'>
					<a href='<%=video.getPlayurl()%>'>如果无法观看，请点击这里播放</a>
				</div>
			<%if(relatedVideos != null && relatedVideos.size() > 0){
				%>
				<div class="videobox">
					<h3 class="tj_grey">相关视频</h3>
					<ul class="yyklist">
						<%
						int i = 0;
						for(VideoBean videoRelated: relatedVideos){
							if(i >= 9){
								break;
							}
							if(videoRelated.getId() == video.getId()){
								continue;
							}
							%>
							<li><a id="<%=videoRelated.getId() %>"
							href="61p.jsp?id=<%=videoRelated.getId() %>">
							<img alt="<%=videoRelated.getName()%>" src="<%=videoRelated.getImgurl()%>"><br/>
							<%=videoRelated.getName() %></a></li>
							<%
							i ++;
						}
						%>
					</ul>
				</div>
			<%
			}
			%>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	</div>
</body>
</html>