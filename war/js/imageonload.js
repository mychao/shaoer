addOnloadImg(function(){
	//图片延迟加载功能
	var lazyloading = new lazyLoading();
    lazyloading.init();
});

//追加 onload 事件
function addOnloadImg(fn){
	if(typeof window.onload == 'function'){
		var tempOnload = window.onload;
		window.onload = function(){
			tempOnload();
			fn();
		}
	}else{
		window.onload = function(){
			fn();
		}
	}
}


//图片延迟加载开始
Array.prototype.del = function(n) {
  if (n < 0) return this;
  else return this.slice(0, n).concat(this.slice(n + 1, this.length));
}

function getDocOffsetTop(element) {
  if (element == null) {
      return null;
  }
  var offsetTop = element.offsetTop;
  while (element = element.offsetParent) {
      offsetTop += element.offsetTop;
  }
  return offsetTop;
}

function lazyLoading() {}
lazyLoading.prototype = {
  init: function() {
      this.container = null;
      this.threshold = 0;
      this.counter = 0;
      _self = this;
      this.containerHeight = window.screen.availHeight;
      addEventListener("scroll",
      function() {
          _self.doscroll()
      },
      false);
      var a = document.getElementsByTagName("img");
      this.elements = Array.prototype.slice.call(a)
  },
  doscroll: function() {
      var b = this;
      var a = 0;
      while (a < b.elements.length) {
          curObj = b.elements[a];
          if (curObj.getAttribute("loaded") == null && curObj.getAttribute("original") != null) {
              if (b.abovethefold(curObj)) {
                  a++
              } else {
                  if (b.belowthefold(curObj)) {
                      b.loadImg(curObj, a);
                      this.elements = this.elements.del(a)
                  } else {
                      a++;
                      if (b.counter++>0) {
                          return false
                      }
                  }
              }
          } else {
              b.elements = b.elements.del(a)
          }
      }
  },
  loadImg: function(c, b) {
      var a = c.getAttribute("original");
      c.src = a;
      c.setAttribute("loaded", "1");
      if (c.complete) {
          c.removeAttribute("original")
      } else {
          c.onload = function() {
              c.removeAttribute("original")
          }
      }
      c.onerror = function() {}
  },
  abovethefold: function(c) {
      var d = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
      var b = d;
      var a = getDocOffsetTop(c);
      return b >= a
  },
  belowthefold: function(c) {
      var d = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
      var b = d + this.containerHeight;
      var a = getDocOffsetTop(c);
      return b >= a - this.threshold
  }
};
//图片延迟加载结束

