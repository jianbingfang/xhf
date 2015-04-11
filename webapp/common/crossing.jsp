<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="core.login.title" text="首页"/></title>
	<%@include file="/common/s.jsp"%>
    <style type="text/css">
	body{background:url(../s/xthena/img/WEB_BG.JPG) no-repeat  center top; height:900px;   overflow:hidden}
	ul,li{ margin:0; padding:0;}
	ul li{ list-style:none;}
 #a1{ margin:100px 0 0px 0;}
 .warp{ width:820px; height:500px; margin:auto;}

 .tt{ width:820px; margin:auto; height:50px; margin-top:110px;}
.tt ul li{float:left; margin:0 50px;width:300px; height:120px; line-height:120px; font-size:26px; font-family:"Microsoft YaHei","微软雅黑","华文细黑","Trebuchet MS",Verdana,Arial;background: -moz-linear-gradient( top,#fff,#e6e6e6);background: -webkit-linear-gradient( top,#fff,#e6e6e6); border-radius:6px; text-align:center; box-shadow:0px 2px 2px #ccc;   text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);border: 1px solid #CCC;border-bottom-color: #B3B3B3;}
.tt ul li a{color:#222; display:block;}
    </style>
  </head>

  <body onload='document.f.j_username.focus();'>

    
    <div class="warp">
    <img alt="河南新恒丰建设监理有限公司企业信息化管理系统"  src="${scopePrefix}/s/xthena/img/logo21.png"  id="a1"  />
     <div class="tt">
     <ul>
     <li><a href="index.jsp">企业信息化管理系统</a></li>
     <li><a href="http://www.hnxhfjl.com/">企业网站</a></li>
     </ul>
	</div>
  </div>
 
  </body>
</html>
