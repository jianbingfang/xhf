<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="core.login.title" text="登录"/></title>
	<%@include file="/common/s.jsp"%>
    <style type="text/css">
	body{ background:url(../s/xthena/img/WEB_BG.JPG) no-repeat  center 60px; height:500px;}
    .form-horizontal .control-label{ width:60px;}
	.form-horizontal .controls {margin-left: 80px;}
	.login_input_1{background:url(../s/xthena/img/login_input_1.png) no-repeat right center;}
	.login_input_2{background:url(../s/xthena/img/login_input_2.png) no-repeat right center;}
    </style>
  </head>

  <body onload='document.f.j_username.focus();'>

    <!-- start of header bar -->
    <div class="navbar navbar-inverse">
      <div class="navbar-inner" style="float:none;">
        <div class="container" style="float:none; text-align:center; padding:16px 0;">
          <a href="${scopePrefix}/"  ><img alt="科扬建设监理有限公司"  src="${scopePrefix}/s/xthena/img/kylogo3.png"> </a>
        </div>
      </div><!-- /navbar-inner -->
    </div>
    <!-- end of header bar -->

	<div class="row-fluid">
	  <div class="span4"></div>

	<!-- start of main -->
    <section class="span4" >
	  <div class="alert m-alert-error" ${param.error==true ? '' : 'style="display:none"'}>
        <strong><spring:message code="core.login.failure" text="登陆失败"/></strong>
		&nbsp;
        ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
      </div>
      <br>

      <article class="m-widget" style="background:#fff; margin-top:100px;">
        <header class="header">
		  <h4 class="title"><spring:message code="core.login.title" text="登录"/></h4>
		</header>

		<div class="content content-inner">

<form id="userForm" name="f" method="post" action="${scopePrefix}/j_spring_security_check" class="form-horizontal">
  <div class="control-group" style="padding-top:20px;">
    <label class="control-label" for="username"><spring:message code="core.login.username" text=""/>账号:</label>
	<div class="controls">
      <input type='text' id="username" name='j_username' class="text span10 login_input_1"  style="height:40px;" placeholder="账号" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="password"><spring:message code="core.login.password" text=""/>密码:</label>
	<div class="controls">
      <input type='password' id="password" name='j_password' class="text span10 login_input_2" value='' style="height:40px;"  placeholder="密码">
    </div>
  </div>
  <div class="control-group" style="padding-bottom:20px;">
    <div class="controls">
      <input class="btn span10 btn-success btn-large" style="font-family:'microsoft yahei';" name="submit" type="submit" value="<spring:message code='core.login.submit' text='登录'/>"/>
    </div>
  </div>
</form>
        </div>
      </article>

      <div class="m-spacer"></div>
	</section>
	<!-- end of main -->

	  <div class="span4"></div>
    </div>

  </body>
</html>
