<%@page import="com.youerba.service.ShaoerService"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.Date"%>
<%@page import="com.youerba.util.DateFormater"%>
<footer class="footbox">
	<p>
		<a href="61.jsp"><%=ShaoerService.TITLE %></a>
	</p>
	<p class="font14">
		<span class="cl">m.618461.com [<%=DateFormater.simpleDateFormat(new Date(), DateFormater.datetimeFormatNoYearNoSecond) %>]
		</span>
	</p>
<div style="display:none">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F4be8444afa8d67b6cb8b747291b126c7' type='text/javascript'%3E%3C/script%3E"));
</script>
</div>
</footer>
