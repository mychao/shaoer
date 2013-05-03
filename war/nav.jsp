<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.youerba.service.ShaoerService"%>
<link rel="stylesheet" href="/css/search.css">
<div class="navbox">
	<script type="text/javascript" src="/js/video_nav_top_h5.js"></script>
	<h1>
		<a href="61.jsp"><%=ShaoerService.TITLE %></a>
	</h1>
	<p class="r_nav">
		<a href="javascript:" onclick="showSearch();">搜索</a>|<!-- a href="#">收藏</a>|--> <a href="#"
			onclick="javascript:videoPopNav();">导航</a>
	</p>
</div>
<div class="search" style="display:none" id="search">
  <form action="61sr.jsp" method="get" id="searchFormFooter">
    <input class="search_input" name="keyword" type="text" id="keyFooter" maxlength="12" onKeyDown="checkMaxInput()" onKeyUp="checkMaxInput()"/>
    <input class="search_btn" onClick="search();" name="" type="button" value="搜索" />
  </form>
  <div class="search_imagine" style="display:none;">
    <ul id="keywords_list">
    </ul>
  </div>
</div>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//ads
	    //$("#ads-btn").click(function(){
	    //    $(".ads_top").hide();
	    //});
		//搜索
		$("#keyFooter").val("输入关键字搜索动画");
	    $('.search_imagine').hide();
	    $("#keyFooter").bind('keyup focus change click',function(){
	        var keywords = $('#keyFooter').val();
	        if($("#keyFooter").val()!="" && $("#keyFooter").val()!="输入关键字搜索动画"){
	            var data = 'keyword=' + keywords;
	            $.ajax({
	                type:"POST",
	                url:"61s.jsp",
	                data:data,
	                success:function(html) {
	                    $('.search_imagine').show();
	                    $('#keywords_list').html(html);
	                    $('li').hover(function(){
	                        $(this).addClass('hover');
	                    },function(){
	                        $(this).removeClass('hover');
	                    });
	                    $('li').click(function(){
	                        $('#keyFooter').val($(this).text());
	                        $('.search_imagine').hide();
	                        //$("#searchFormFooter").submit();
	                    });
	                }
	            });
	        }else{
	            $('.search_imagine').hide();
	        }
	        return false;
	    });
		$("#keyFooter").focus(function(){
		        if($("#keyFooter").val()=="输入关键字搜索动画"){
		            $("#keyFooter").val("");
		            $("#keyFooter").css("color","#000000");
		        }
		    }
		);
		$("#keyFooter").blur(function(){
				$('.search_imagine').hide();
				if($("#keyFooter").val()==""){
					$("#keyFooter").val("输入关键字搜索动画");
					$("#keyFooter").css("color","#b7b7b7");
				}
		    }
		);
	    $("#searchFormFooter").submit(function(){
	       if($("#keyFooter").val()=="" || $("#keyFooter").val()=="输入关键字搜索动画" ){
	            $("#keyFooter").val("输入关键字搜索动画");
	            return false;
	        }else{
	            return true;
	        }
	    });
		$("#back-to-top").click(function(){
			$('body,html').animate({scrollTop:0},500);
			return false;
		});
	}); 
	function search(){
	   if($("#keyFooter").val()=="" || $("#keyFooter").val()=="输入关键字搜索动画" ){
	        $("#keyFooter").val("输入关键字搜索动画");
	        return false;
	    }else{
	        $("#searchFormFooter").submit();
	    }
	}
	function checkMaxInput(form) {
	    maxLen = 12; 
	    if ($("#keyFooter").val().length > maxLen){
	        $("#keyFooter").val($("#keyFooter").val().substring(0, maxLen));
	    }
	}
	function showSearch(){
		var search = document.getElementById("search");
		if(search.style.display == "block"){
			search.style.display = "none";
		}else{
			search.style.display="block";
		}
	}
</script>