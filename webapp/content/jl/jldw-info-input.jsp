<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-jbxx");%>
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
});
 
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a href="#tab1">建设单位</a></li>
			  <li role="presentation" ><a href="#tab2">项目管理单位</a></li>
			  <li role="presentation" ><a href="#tab3">设计单位</a></li>
			  <li role="presentation"><a href="#tab4">总包施工单位</a></li>
			  <li role="presentation"><a href="#tab5">分包施工单位</a></li>
			</ul>
			
			<div class="tab-content">
			  	<div class="tab-pane active" id="tab1">
			  	 	<iframe  src="jlXgdw-info-list.do?dwType=XGDW_JIANSHEDANWEI" height="600px" width="100%"  style="border: 0px;"></iframe>
				</div>
			  	<div class="tab-pane" id="tab2">
			  		<iframe  src="jlXgdw-info-list.do?dwType=XGDW_XIANGMUGUANLIDANWEI" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab3">
			  		<iframe  src="jlXgdw-info-list.do?dwType=XGDW_SHEJIDANWEI" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			  	<div class="tab-pane" id="tab4">
			  		<iframe  src="jlXgdw-info-list.do?dwType=XGDW_ZONGBAODANWEI" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			  	<div class="tab-pane" id="tab5">
			  		<iframe  src="jlXgdw-info-list.do?dwType=XGDW_FENBAODANWEI" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			</div>
      </section>
	</div>

  </body>

</html>
