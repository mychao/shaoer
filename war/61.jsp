<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.youerba.service.ShaoerService"%>
<%@page import="com.youerba.bean.CategoryBean"%>
<%@page import="com.youerba.bean.VideoBean"%>
<%@page import="java.util.List"%>

<%
	ShaoerService shaoerService = ShaoerService.getInstance();
	List<CategoryBean> cateList = shaoerService.queryCategorys(1, 5);
%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="seo.html"></jsp:include>
<title><%=ShaoerService.TITLE %></title>
<link rel="stylesheet" href="/css/base.css">
</head>
<body>

	<script type="text/javascript" src="/js/sc_f.js"></script>

	<div id="mainpage" class="warp">
		<div id="video_wrapper">
			<jsp:include page="nav.jsp"></jsp:include>
			<jsp:include page="imagescroll.jsp?id=1"></jsp:include>
			<div class="maincont">
			<!--
				<div class="videobox">
					<h3>今日推荐</h3>
					<ul class="yyklist">
						<li><a
							href=""><img
								src=""
								alt="" /><br /></a></li>
					</ul>
				</div>

				<div class='b1'>
					<div class='adsty'>
						<span class='color1'><a href="#">广告位</a><br /></span>
					</div>
				</div>
			-->
				<%
				int i = 0;
				for(CategoryBean category: cateList){
				%>
				<div class="videobox">
					<h3>
						<span><a href="612.jsp?cid=<%=category.getId()%>"><%=category.getName() %></a></span>
					</h3>
					<ul class="yyklist">
						<% 
							List<VideoBean> videos = shaoerService.queryByCategoryId(category.getId(), 1, 15);
							for(VideoBean video: videos){
								%>
								<li><a href="61p.jsp?id=<%=video.getId()%>">
								<%if (i == 0) {
								%>
								<img src="<%=video.getImgurl() %>" alt="<%=video.getName() %>" />
								<%
								}else{
								%>
								<img original="<%=video.getImgurl() %>"	src="/images/dot.jpg" alt="<%=video.getName() %>" />
								<%
								}%>
								<br />
								<%=video.getName() %></a></li>
								<%
							}
							%>
					</ul>
				</div>
				<%
					i++;
				}
				%>
				<!-- 
				<div class="videobox">
					<h3>
						<span><a
							href="http://video.sina.cn/?sa=t441d41v3761&amp;pos=91&amp;vt=4">不知道看什么？来
								<strong>随便看看</strong> 吧
						</a></span>
					</h3>
				</div>
				<div class="videobox">
					<h3>
						<span><a
							href="http://video.sina.cn/?sa=t441d41v3738&amp;pos=91&amp;vt=4">帮助中心</a></span>
					</h3>
				</div>
				 -->
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
	<script type="text/javascript" src="/js/imageonload.js"></script>

	<div id="dialog" class="dialog">
		<div class="clint_nav">
			<strong><%=ShaoerService.TITLE %>导航</strong> <a href="#" onClick="closeDialog();"
				class="aclose">关闭</a>
			<script type="text/javascript" language="javascript" charset="utf-8">
				function closeDialog() {
					var mainpage = document.getElementById("mainpage");
					var dialog = document.getElementById("dialog");
					dialog.style.display = "none";
					mainpage.style.display = "block";
				}
			</script>
		</div>
		<ul id='urls' class="navigation"></ul>
	</div>
	
</body>
</html>