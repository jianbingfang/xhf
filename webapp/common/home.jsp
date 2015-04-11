<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="core.login.title" text="首页"/></title>
	<%@include file="/common/s.jsp"%>
    <meta http-equiv="refresh" content="12;URL=crossing.jsp">
    <style type="text/css">
	body{ background:url(../s/xthena/img/WEB_BG.JPG) no-repeat  center top; height:900px;   overflow:hidden}
	ul,li{ margin:0; padding:0;}
	ul li{ list-style:none;}
 img{ max-width:none;}
 .warp{ width:784px; height:500px; margin:auto;}

#q1,#a2,#a3{margin:auto; }
#a1{position: relative;left: -250px; top:300px;height:119px;  width:1200px;opacity: 0;-webkit-transition: all 6s ease-in-out;-moz-transition: all 1s ease-in-out;-o-transition: all 1s ease-in-out;}
 
#a1.animate{position: relative;   -webkit-animation:tantiao 8s ease both}
@-webkit-keyframes tantiao{
	0%{left:-250px; top:400px;height:139px;  width:1400px;opacity:0;}
	50%{left:160px; top:200px;height:46px;  width:462px;opacity:0.5;}
	100%{left:160px; top:100px;height:46px;  width:462px;opacity:1;}
	}


#a2{position: relative;left: 77px; top:240px;opacity: 0;-webkit-transition: all 8s ease-in-out;-moz-transition: all 8s ease-in-out;
     -o-transition: all 8s ease-in-out;height:70px; width:645px; }
#a2.animate{position: relative;left: 77px;opacity: 1; -webkit-animation:biaoti 8s ease both}
@-webkit-keyframes biaoti{
	0%{opacity:0;}
	90%{opacity:0;}
	100%{opacity:1;}
	}


#a3{position: fixed;right: 50px; top:620px;opacity: 0;-webkit-transition: all 10s ease-in-out;-moz-transition: all 10s ease-in-out;
     -o-transition: all 10s ease-in-out;height:36px;width:120px;-webkit-animation:btn 10s ease both}
#a3.animate{position: fixed;right: 50px;opacity: 1;}
@-webkit-keyframes btn{
	0%{opacity:0;}
	90%{opacity:0;}
	100%{opacity:1;}
	}


    </style>
  </head>

  <body onload='document.f.j_username.focus();'>

    
    <div class="warp">
    <img alt="河南新恒丰建设监理有限公司企业信息化管理系统"  src="${scopePrefix}/s/xthena/img/logo20.png"  id="a1" />
    <br />
  <img src="${scopePrefix}/s/xthena/img/title_1014.png" alt="" id="a2" />
  <br />
  <a href="crossing.jsp"><img src="${scopePrefix}/s/xthena/img/enter_btn.png" alt="" id="a3" /></a>
  </div>
<script type="text/javascript"> 
$(document).ready(function() {
     $("#a1").addClass("animate");
	 $("#a2").addClass("animate");
	 $("#a3").addClass("animate");

});
</script>
 
  </body>
</html>
