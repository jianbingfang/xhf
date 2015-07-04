<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="core.login.title" text="首页"/></title>
	<%@include file="/common/s.jsp"%>
    <style type="text/css">
	body{ background:url(../s/xthena/img/WEB_BG.JPG) no-repeat  center 60px;}
	ul,li{ margin:0; padding:0;}
	ul li{ list-style:none;}
    .form-horizontal .control-label{ width:60px;}
	.form-horizontal .controls {margin-left: 80px;}
	.zhuti{ width:860px; height:550px; margin:auto; padding-top:30px;}
	.zhuti ul li{ float:left; margin-left:10px; width:270px; height:115px; line-height:50px; font-size:22px; font-family: "Microsoft JhengHei","微軟正黑體","Microsoft YaHei","微软雅黑","华文细黑","Trebuchet MS",Verdana,Arial;background: -moz-linear-gradient( top,#76C5F4,#3789C2);background: -webkit-linear-gradient( top,#76C5F4,#3789C2); border-radius:6px; text-align:center; box-shadow:0px 2px 2px #ccc; margin-bottom:10px; text-shadow:0px 1px 0px #666}
	.zhuti ul li img{ display:block; margin:15px 0 0 110px}
	.zhuti ul li a{ display: block; color:#fff;}
	.zhuti ul li:hover{background: -moz-linear-gradient( top,#44AFF0,#2F75A4);background: -webkit-linear-gradient( top,#44AFF0,#2F75A4);}
	.zhuti ul li:active{ box-shadow:inset 3px 3px 4px #00698C;}
	.copyright_1{ position:fixed; bottom:0; left:0; width:100%; height:40px; line-height:40px; text-align:center; background:#dfdfdf; color:#333; border-top:1px solid #d4d4d4;}
    </style>
  </head>

  <body onload='document.f.j_username.focus();'>

    <!-- start of header bar -->
    <div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <div class="container" >
        <div class="" style="text-align:center; padding:16px 0;">
          <a href="${scopePrefix}/"><img alt="河南新恒丰建设监理有限公司企业信息化管理系统"  src="${scopePrefix}/s/xthena/img/logo22.png"></a>
          </div>
        </div>
      </div><!-- /navbar-inner -->
    </div><div class="zhuti">
	<ul>
    <li><a href="#"><img src="${scopePrefix}/s/xthena/img/icon_main_10.png" alt="">工会</a></li>
    <li><a href="#"><img src="${scopePrefix}/s/xthena/img/icon_main_11.png" alt="">党支部</a></li>
    <li><a href="#"><img src="${scopePrefix}/s/xthena/img/icon_main_12.png" alt="">考核委</a></li>
    
    
		<li><a href="${scopePrefix}/hr/hr-home.do"><img src="${scopePrefix}/s/xthena/img/icon_main_5.png" alt="">人力资源</a></li>
		<li><a href="${scopePrefix}/xz/xz-home.do"><img src="${scopePrefix}/s/xthena/img/icon_main_4.png" alt="">行政管理</a></li>
        <li><a href="${scopePrefix}/cw/cw-home.do"><img src="${scopePrefix}/s/xthena/img/icon_main_1.png" alt="">财务管理</a></li>
        <li><a href="${scopePrefix}/sckf/sckf-home.do"><img src="${scopePrefix}/s/xthena/img/icon_main_6.png" alt="">市场开发</a></li>
        <li><a href="${scopePrefix}/gcgl/gcgl-home.do"><img src="${scopePrefix}/s/xthena/img/icon_main_2.png" alt="">工程管理</a></li>
        <li><a href="${scopePrefix}/jl/jl-home.do"><img src="${scopePrefix}/s/xthena/img/icon_main_3.png" alt="">监理部</a></li>
        <li><a href="${scopePrefix}/common/jsz.jsp"><img src="${scopePrefix}/s/xthena/img/icon_main_7.png" alt="">招标代理</a></li>
        <li><a href="${scopePrefix}/common/jsz.jsp"><img src="${scopePrefix}/s/xthena/img/icon_main_8.png" alt="">造价咨询</a></li>
        <li><a href="${scopePrefix}/common/jsz.jsp"><img src="${scopePrefix}/s/xthena/img/icon_main_9.png" alt="">成本控制</a></li>
    </ul>
</div>
    <!-- end of header bar -->


<div class="copyright_1">郑州典纳科技有限公司版权所有</div>
  </body>
</html>
