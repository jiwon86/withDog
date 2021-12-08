<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var info = "<h2>웹 브라우저 정보 확인</h2><br>"; 
	info += "<p>브라우저 이름 : " + navigator.appName + "</p>"; 
	info += "<p>브라우저 코드명 : " + navigator.appCodeName + "</p>"; 
	info += "<p>플랫폼 정보 : " + navigator.platform + "</p>"; 
	info += "<p>사용자 정보 : " + navigator.userAgent + "</p>"; 
	info += "<p>브라우저 버전 : " + navigator.appVersion + "</p><br>"; 
	console.log(info);
	
	function isMobile() { 
		var user = navigator.userAgent; 
		var is_mobile = false; 
		
		if( user.indexOf("iPhone") > -1 || user.indexOf("Android") > -1 ) {
		 	is_mobile = true; 
		} 
		return is_mobile; 
	}
	
	$(document).ready(function() {
		var is_mobile = isMobile(); 
		if( is_mobile ) { 
			console.log("모바일로 접속하셨습니다."); 
			$("#browser").text("모바일 접속");
		} else { 
			console.log("PC로 접속하셨습니다. (" + isBrowserCheck() + ")");
			$("#browser").text("PC 접속 (" + isBrowserCheck() + ")");
		}
	});
	
	function isBrowserCheck(){ 
		const agt = navigator.userAgent.toLowerCase(); 
		if (agt.indexOf("chrome") != -1) return 'Chrome'
		if (agt.indexOf("opera") != -1) return 'Opera'
		if (agt.indexOf("staroffice") != -1) return 'Star Office'
		if (agt.indexOf("webtv") != -1) return 'WebTV'
		if (agt.indexOf("beonex") != -1) return 'Beonex'
		if (agt.indexOf("chimera") != -1) return 'Chimera'
		if (agt.indexOf("netpositive") != -1) return 'NetPositive'
		if (agt.indexOf("phoenix") != -1) return 'Phoenix'
		if (agt.indexOf("firefox") != -1) return 'Firefox'
		if (agt.indexOf("safari") != -1) return 'Safari'
		if (agt.indexOf("skipstone") != -1) return 'SkipStone'
		if (agt.indexOf("netscape") != -1) return 'Netscape'
		if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'
		if (agt.indexOf("msie") != -1) { 
	    	let rv = -1; 
			if (navigator.appName == 'Microsoft Internet Explorer') { 
				let ua = navigator.userAgent; var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})")
			if (re.exec(ua) != null) 
				rv = parseFloat(RegExp.$1)
			} 
			return 'Internet Explorer '+rv
		} 
	}
	
</script>
<footer class="footer-admin mt-auto footer-light">
    <div class="container-xl px-4">
        <div class="row">
            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
            <div class="col-md-6 text-md-end small" id="browser">
                           브라우저 체크
            </div>
        </div>
    </div>
</footer>