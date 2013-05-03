<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.youerba.service.ShaoerService"%>
<%@page import="com.youerba.bean.CategoryBean"%>
<%@page import="com.youerba.bean.VideoBean"%>
<%@page import="com.youerba.util.TypeUtils"%>
<%@page import="java.util.List"%>

<%
int categoryId = TypeUtils.getIntParameterFromRequest("cid", request, 0);
ShaoerService shaoerService = ShaoerService.getInstance();
CategoryBean category = shaoerService.queryById(categoryId);
String categoryName = "";
if(category != null){
	categoryName = category.getName();
}
List<CategoryBean> cateList = shaoerService.queryCategorys(1, 50);
int pageNow = TypeUtils.getIntParameterFromRequest("page", request, 1);
if(pageNow < 1){
	pageNow = 1;
}
int pageSize = 10;
int totalSize = shaoerService.statByCategoryId(categoryId);
int totalPage = totalSize % pageSize == 0? totalSize / pageSize : totalSize / pageSize + 1;
if(pageNow > totalPage){
	pageNow = totalPage;
}
List<VideoBean> videoList = shaoerService.queryByCategoryId(categoryId, pageNow, pageSize);
%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="seo.html"></jsp:include>
<link rel="stylesheet" href="/css/base.css">
<title><%=categoryName+"-"+ShaoerService.TITLE %></title>

<style type='text/css'>
</style>
</head>
<body>
	<div id="mainpage" class="warp">
		<div id="video_wrapper">
			<jsp:include page="nav.jsp"></jsp:include>
			<div class="page">
				<a href="?cid=<%=category.getId() %>&page=<%=pageNow - 1 %>" title="" class="<%=pageNow > 1?"btnEn":"btnUn" %>">&lt; 上一页</a><span>第<em
					style="font-style: normal;"><%=pageNow %></em>页
				</span><a href="?cid=<%=category.getId() %>&page=<%=pageNow + 1 %>" title="" class="<%=pageNow < totalPage?"btnEn":"btnUn" %>" data-pageall="20">下一页
					&gt;</a>
			</div>
			<div class="maincont">
				<div class="videobox" id="j_slide_wrapper">
					<h3 class="yyk">
						<p class="l_m">
							<%=categoryName %>&nbsp;&nbsp;<select
								Onchange="location='612.jsp?cid='+this.value">
								<%
								for(CategoryBean tmp: cateList){
								%>
								<option value="<%=tmp.getId() %>"><%=tmp.getName() %></option>
								<%
								}
								%>
								
							</select>
						</p>
						<!-- 
						<p class="r_m f14">
							<a href="http://video.sina.cn/?sa=t441d9v453&hot_rank=1&amp;vt=4">最热</a>
							| 最新
						</p>
						 -->
					</h3>

					<div class="list-wrapper" style="">
						<ul class="videolist">
							<%
							for(VideoBean video: videoList){
								%>
								<li><a id="video_id_<%=video.getId() %>"
									href="61p.jsp?id=<%=video.getId()%>"><img
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
			<div class="page">
				<a href="?cid=<%=category.getId() %>&page=<%=pageNow - 1 %>" title="" class="<%=pageNow > 1?"btnEn":"btnUn" %>">&lt; 上一页</a><span>第<em
					style="font-style: normal;"><%=pageNow %></em>页
				</span><a href="?cid=<%=category.getId() %>&page=<%=pageNow + 1 %>" title="" class="<%=pageNow < totalPage?"btnEn":"btnUn" %>" data-pageall="20">下一页
					&gt;</a>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>