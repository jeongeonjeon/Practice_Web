/**
 *  Ajax(비동기통신) 관련된 함수 라이브러리
 */
var httpRequest = null;
	
function getXMLHttpRequest() {
	if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function sendProcess(method, url, params, callback) {
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	
	var httpMethod = method.toUpperCase();
	if(httpMethod != 'GET' && httpMethod != 'POST')
		httpMethod = 'GET';
	
	var httpParams = '';
	if(params != null) {
	
		if(typeof params == 'object') {
			
			// {name : '홍길동', age : 30, addr : '서울시 강남구 역삼동'}
			for(var key in params) {
				if(httpParams != '')
					httpParams += '&';
				httpParams += key + '=' + encodeURIComponent(params[key]);
			}
		} else if(typeof params == 'string') {
			
			//"name=홍길동&age=30&addr=서울시 강남구 역삼동"
			var array = params.split('&');
			for(var i = 0; i < array.length; i++) {
				var data = array[i].split('=');
				var name = data[0];
				var value = data[1];
				if(i != 0)
					httpParams += '&';
				httpParams += name + '=' + encodeURIComponent(value);
		}
		
		}
	}
	
	var httpUrl = url;
	if(httpMethod == 'GET' && params != null)
		httpUrl = url + '?' + httpParams;
		
	httpRequest.open(httpMethod, httpUrl, true);
	
	if(httpMethod == 'POST') {
		httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
	}
	
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
	
}

















