<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.youerba.service.ShaoerService"%>
<%@page import="com.youerba.bean.CategoryBean"%>
<%@page import="com.youerba.bean.VideoBean"%>
<%@page import="com.youerba.util.TypeUtils"%>
<%@page import="java.util.List"%>

<%
String keywords = TypeUtils.getStringParameterFromRequest("keyword", request, "");
ShaoerService shaoerService = ShaoerService.getInstance();
int pageNow = TypeUtils.getIntParameterFromRequest("page", request, 1);
if(pageNow < 1){
	pageNow = 1;
}
int pageSize = 10;
boolean recommend = false;
List<VideoBean> videoList = shaoerService.searchByName(keywords);
if(videoList.isEmpty()){
	int rand = TypeUtils.randNumber(1, 15);
	pageNow = TypeUtils.randNumber(1, 3);
	videoList = shaoerService.queryByCategoryId(rand, pageNow, pageSize);
	recommend = true;
}
int totalSize = videoList.size();
int totalPage = totalSize % pageSize == 0? totalSize / pageSize : totalSize / pageSize + 1;
if(pageNow > totalPage){
	pageNow = totalPage;
}

%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="seo.html"></jsp:include>
<link rel="stylesheet" href="/css/base.css">
<title><%="搜索-"+ShaoerService.TITLE %></title>

<style type='text/css'>
</style>
</head>
<body>
	<div id="mainpage" class="warp">
		<div id="video_wrapper">
			<jsp:include page="nav.jsp"></jsp:include>
			<div class="maincont">
				<div class="videobox" id="j_slide_wrapper">
					<h3 class="yyk">
						<p class="l_m">
							<%if(recommend){
								%>
								<%="暂无"+keywords+"相关内容,以下为推荐" %>
								<%
							}else{
								%>
								"<%=keywords %>"相关视频<%=totalSize%>条
								<%
							}%>
							
						</p>
					</h3>

					<div class="list-wrapper" style="">
						<ul class="videolist">
							<%
							for(VideoBean video: videoList){
								%>
								<li><a id="video_id_<%=video.getId() %>"
									href="61p.jsp?id=<%=video.getId() %>"><img
										src="<%=video.getImgurl() %>"
										alt="<%=video.getName() %>" />
									<div class="v_mate">
											<strong><%=video.getName() %></strong>
											<p>
												<span> </span>
												<code> </code>
											</p>
									</div></a></li>
								<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>