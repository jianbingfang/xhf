<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>


<%pageContext.setAttribute("fxmid", request.getParameter("fxmid"));%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
    
    
    var formid="";
    
$(function() {
    $("#jlFujian-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    
    $('#m-main .active a').css('font-size','20px');
    
    $('#myTab a').click(function (e) {
	  	  e.preventDefault();
	  	  $(this).tab('show');
	  	  $('#m-main li a').css('font-size','14px');
	  	  $(this).css('font-size','20px');
	  	  var contentId=$(this).attr('href');
	  	  $(contentId + " iframe").attr("src",$(this).attr('data-href'));
  	}); 
    
    
 });
 
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
   <!--    <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目管理<span class="divider">/</span>
							</li>
							<li class="active">项目管理和技术支持</li>
						</ul>
					</div>
				</div>
			</div> -->
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a href="#tab1">项目督察</a></li>
			  <li role="presentation"><a href="#tab2">项目月报</a></li>
			  <li role="presentation"><a href="#tab3">总监研讨会</a></li>
			  <li role="presentation"><a href="#tab4">总监座谈会</a></li>
			</ul>
			
			<div class="tab-content">
			  <div class="tab-pane active" id="tab1">
			  	 	<iframe  src="pjDc-info-list.do?fxmid=${fxmid}" height="600px" width="100%"  style="border: 0px;"></iframe>
				</div>
			  	<div class="tab-pane" id="tab2">
			  		<iframe  src="gcgl-jlXxjlyb-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab3">
			  		<iframe  src="pjHuiyi-yt-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			  	<div class="tab-pane" id="tab4">
			  		<iframe  src="pjHuiyi-zt-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			</div>
      </section>
	</div>

  </body>

</html>
