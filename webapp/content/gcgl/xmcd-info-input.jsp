<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
       <script type="text/javascript" src="${scopePrefix}/s/xthena/js/ajaxfileupload.js"></script>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.css">
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
    
    
    $('#myTab a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    });
})

    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
  <!--     <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目管理<span class="divider">/</span>
							</li>
							<li class="active">项目撤点</li>
						</ul>
					</div>
				</div>
			</div> -->
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation"  class="active"><a href="#tab3">固定资产台账</a></li>
			 <!--  <li role="presentation"><a href="#tab4">监理内业资料</a></li>
			  <li role="presentation"><a href="#tab5">获奖证书</a></li> -->
			</ul>
			
			<div class="tab-content">
			  	<div class="tab-pane active" id="tab3">
			  		<iframe  src="pjWz-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			  	<!-- <div class="tab-pane" id="tab4">
			  		<iframe  src="pjNy-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			  	<div class="tab-pane" id="tab5">
			  		<iframe  src="pjSubmit-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  -->
			</div>
      </section>
	</div>

  </body>

</html>
