<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="core.login.title" text="首页"/></title>
	<%@include file="/common/s.jsp"%>
    <style type="text/css">
	body{ background:url(../s/xthena/img/WEB_BG.JPG) no-repeat  center 0px; height:500px;}
	ul,li{ margin:0; padding:0;}
	ul li{ list-style:none;}
 
 .warp{ width:784px; height:500px; margin:auto;}

#q1,#a2,#a3{margin:auto; }
#a1{position: relative;left: -10px; top:100px;opacity: 0;-webkit-transition: all 1.3s ease-in-out;-moz-transition: all 1s ease-in-out;
     -o-transition: all 1s ease-in-out;height:46px;  width:784px; }
#a1.animate{position: relative;left:0px;opacity: 1;}

#a2{position: relative;left: 150px; top:200px;opacity: 0;-webkit-transition: all 2.3s ease-in-out;-moz-transition: all 1s ease-in-out;
     -o-transition: all 1s ease-in-out;height:55px; width:487px; }
#a2.animate{position: relative;left: 150px;opacity: 1;}

#a3{position: relative;left: 280px; top:420px;opacity: 0;-webkit-transition: all 3.3s ease-in-out;-moz-transition: all 1s ease-in-out;
     -o-transition: all 1s ease-in-out;height:52px;width:172px; }
#a3.animate{position: relative;left: 280px;opacity: 1;}



    </style>
  </head>

  <body onload='document.f.j_username.focus();'>

    
    <div class="warp">
    <img alt="河南新恒丰建设监理有限公司企业信息化管理系统"  src="${scopePrefix}/s/xthena/img/logo21.png"  id="a1" />
    <br />
  <img src="${scopePrefix}/s/xthena/img/title_1014.png" alt="" id="a2" />
  <br />
  <a href="2.jsp"><img src="${scopePrefix}/s/xthena/img/enter_btn.png" alt="" id="a3" /></a>
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
