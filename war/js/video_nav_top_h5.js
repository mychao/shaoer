//视频导航地址
var videoNavUrls = [
{
	"id" : 0,
	"name" : "首页"
},                  
   {
	"url" : "612.jsp?cid\u003d1",
	"id" : 1,
	"name" : "中文儿歌"
}, {
	"url" : "612.jsp?cid\u003d2",
	"id" : 2,
	"name" : "英文儿歌"
}, {
	"url" : "612.jsp?cid\u003d12",
	"id" : 12,
	"name" : "3D儿歌"
}, {
	"url" : "612.jsp?cid\u003d6",
	"id" : 6,
	"name" : "幼儿教育"
}, {
	"url" : "612.jsp?cid\u003d3",
	"id" : 3,
	"name" : "学字母"
}, {
	"url" : "612.jsp?cid\u003d18",
	"id" : 18,
	"name" : "学单词"
}, {
	"url" : "612.jsp?cid\u003d7",
	"id" : 7,
	"name" : "学古诗"
}, {
	"url" : "612.jsp?cid\u003d8",
	"id" : 8,
	"name" : "学拼音"
}, {
	"url" : "612.jsp?cid\u003d14",
	"id" : 14,
	"name" : "三字经"
}, {
	"url" : "612.jsp?cid\u003d5",
	"id" : 5,
	"name" : "童话故事"
}, {
	"url" : "612.jsp?cid\u003d15",
	"id" : 15,
	"name" : "成语故事"
}, {
	"url" : "612.jsp?cid\u003d16",
	"id" : 16,
	"name" : "三国故事"
}, {
	"url" : "612.jsp?cid\u003d4",
	"id" : 4,
	"name" : "小故事"
}, {
	"url" : "612.jsp?cid\u003d17",
	"id" : 17,
	"name" : "其它故事"
}, {
	"url" : "612.jsp?cid\u003d9",
	"id" : 9,
	"name" : "卡通金曲"
}, {
	"url" : "612.jsp?cid\u003d10",
	"id" : 10,
	"name" : "经典民歌"
}, {
	"url" : "612.jsp?cid\u003d11",
	"id" : 11,
	"name" : "流行音乐"
} ]
var goTopTimer; // 回到顶部计时器
addOnload(function() {

	// 显示#go_top按钮
	window.onscroll = function() {
		if (document.querySelector('#go_top')) {
			document.querySelector('#go_top').style.display = 'none';
		}
		clearTimeout(goTopTimer);
		if (parseInt(window.pageYOffset)) {
			goTopTimer = setTimeout(function() {
				showTopBtn();
			}, 800);
		}
	}

});

// 追加 onload 事件
function addOnload(fn) {
	if (typeof window.onload == 'function') {
		var tempOnload = window.onload;
		window.onload = function() {
			tempOnload();
			fn();
		}
	} else {
		window.onload = function() {
			fn();
		}
	}
}

// 视频导航弹出层
function videoPopNav() {
	var popNav = document.querySelector("#video_pop_nav");
	if (!popNav) {
		var navWrapper = document.createElement('div'), navContent;
		navWrapper.id = "video_pop_nav";
		for (item in videoNavUrls) { // 生成导航内容
			if (item <= 0) {
				navContent = '<li class="li_' + (parseInt(item) + 1)
						+ '"><a href="61.jsp">'
						+ videoNavUrls[item].name + '</a></li>';
			} else {
				if (parseInt(item)) {
					navContent += '<li class="li_' + (parseInt(item) + 1)
							+ '"><a href="' + videoNavUrls[item].url
							+ '">' + videoNavUrls[item].name
							+ '</a></li>';
				}
			}
		}
		navWrapper.innerHTML = '<div class="navbox">'
				+ '<h1>儿童乐吧导航</h1>'
				+ '<p class="r_btn"><a onclick="closePopNav()" href="javascript:;" title="">关闭</a></p>'
				+ '</div>'
				+ '<div class="maincont">'
				+ '<ul class="videodhlist">	'
				+ navContent
				+ '<ul>'
				+ '<!--div class="videobox">'
				+ '<h3><span><a href="http://video.sina.cn/?sa=t441d41v3761">不知道看什么？来 <strong>随便看看</strong> 吧</a></span></h3>'
				+ '</div-->' + '</div>';
		document.querySelector('#mainpage').insertBefore(navWrapper,
				document.querySelector(".footbox")); // 主内容页 追加 导航内容
	}
	document.querySelector("#video_wrapper").style.display = 'none';
	document.querySelector("#video_pop_nav").style.display = 'block';
}

// 关闭视频导航弹出层
function closePopNav() {
	document.querySelector("#video_pop_nav").style.display = "none";
	document.querySelector("#video_wrapper").style.display = "block";
}

// 显示go_top按钮 模拟position:fixed
function showTopBtn() {
	var goTopBtn = document.querySelector('#go_top');
	var scrollTop = parseInt(window.pageYOffset);
	var clientHeight = parseInt(document.documentElement.clientHeight);
	if (!goTopBtn) {
		goTopBtn = document.createElement('a');
		goTopBtn.id = "go_top";
		goTopBtn.href = 'javascript:;'
		document.body.appendChild(goTopBtn);
	}
	goTopBtn.onclick = function() {
		document.documentElement.scrollTop = 0;
		document.body.scrollTop = 0;
	}
	goTopBtn.style.top = (scrollTop + clientHeight - 60) + 'px';
	goTopBtn.style.display = 'block';
}
