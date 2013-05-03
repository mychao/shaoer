/*edit by zhangzhongyan,20120913*/
function _getElementsByClassName(node,classname) { 
      if (node.getElementsByClassName) { // use native implementation if available 
        return node.getElementsByClassName(classname); 
      } 
      else { 
        return (function getElementsByClass(searchClass,node) {     
                            if ( node == null )       node = document;     
                                var classElements = [],
                                els = node.getElementsByTagName("*"),
                                elsLen = els.length,
                                pattern = new RegExp("(^|\\s)"+searchClass+"(\\s|$)"), i, j;
                                for (i = 0, j = 0; i < elsLen; i++) {
                                    if ( pattern.test(els[i].className) ) {
                                    classElements[j] = els[i];
                                    j++;
                                    }}
                                return classElements; 
                            })(classname, node); 
      } 
  }
function _index(current, obj){ 
    for (var i = 0, length = obj.length; i<length; i++) { 
        if (obj[i] == current) { 
            return i; 
        } 
    } 
}
function _getStyle(id)
{
	return window.getComputedStyle?window.getComputedStyle(id,null).backgroundColor:id.currentStyle["backgroundColor"];
}
/*edit by zhangzhongyan,20120829*/

function _$(el)
{
	if(!el)
	{
		return null;
	}
	else if(typeof el=='string')
    {
		return document.getElementById(el);
	}
	else if(typeof el=='object')
	{
		return el;
	}
}

function _query(selector, parentNode) {
        return (parentNode || document).querySelector(selector);
    }
function _addClass(els,val){
	if(!val){
		return false;
	}
	els = (els.length)?els:[els];
	for(var k=0;k<els.length;k++){
		var el = els[k];
		var _cln=el.className.split(' ');
		for(var i=0;i<_cln.length;i++){
			if(_cln[i]==val){
				return false;
			}
		}
		if(el.className.length>0){
			el.className=el.className+' '+val;
		}
		else{
			el.className=val;
		}
	}
}
function _hasClass(el,val){
	if(!val){
		return false;
	}
	var _cln=el.className.split(' ');
	for(var i=0;i<_cln.length;i++){
		if(_cln[i]==val){
			return true;
		}
	}
	return false;
}
function _removeClass(els,val){
	if(!val){
		return false;
	}
	els = (els.length)?els:[els];
	for(var k=0;k<els.length;k++){
		var el = els[k];
		var _cln=el.className.split(' ');
		var _s='';
		for(var i=0;i!=_cln.length;i++){
			if(_cln[i]!=val){
				_s+=_cln[i]+' ';
			}
		}
		if(_s==' '){
			_s='';
		}
		if(_s.length!=0){
			_s=_s.substr(0,_s.length-1);
		}
		el.className=_s;
	}
}

/**
 * Ajax
 * @param {String} url 请求地址
 * @param {Function} callback 请求成功后的回调函数
 */
function _ajax(url, data, callback){
    var xhr = new XMLHttpRequest();
    if (data) {
        xhr.open("post", url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    } else {
        xhr.open("get", url, true);
    }
    xhr.send(data);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            callback(xhr.responseText);
        }
    }
}
