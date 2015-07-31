<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-xcgl");%>
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
    
    $('#m-main .active a').css('font-size','16px');
    
    $('#myTab a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    	  $('#m-main li a').css('font-size','12px');
    	  $(this).css('font-size','16px');
    	  if($(this).attr('sz-type')){
    	 	var contentId=$(this).attr('href');
    		$(contentId + " iframe").attr("src","jlShizhong-info-list.do?fszleix="+$(this).attr('sz-type'));
    	  }
    });
    
})

function tabShow(){
	$('.nav.nav-tabs').show();
}

function tabHide(){
	$('.nav.nav-tabs').hide();	
}

    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation"  class="active" ><a href="#tab1" >总进度计划</a></li>
			  <li role="presentation" class=""><a href="#tab2" >月工作计划及分析</a></li>
			  <li role="presentation" class=""><a href="#tab3" >周工作计划及分析</a></li>
			  <!-- <li role="presentation" class=""><a href="#tab4"  >进度索赔</a></li> -->
			  <!-- <li role="presentation" class="active" ><a href="#tab5">进度管理</a></li> -->
			</ul>
			
			<div class="tab-content">
			  <div class="tab-pane active" id="tab1">
			  	 	<iframe src="jljindugenzong-info-list.do?type=1" height="600px"  width="100%"  style="border: 0px;"></iframe>
				</div>
			  	<div class="tab-pane" id="tab2">
			  		<iframe src="jljindugenzong-info-list.do?type=2" height="600px"  width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab3">
			  		<iframe src="jljindugenzong-info-list.do?type=3"  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			 <!--  	<div class="tab-pane" id="tab4">
			  		柱状图展示
			  	</div>  -->
			  <!-- 	<div class="tab-pane active" id="tab5">
			  		<iframe src="jl-sz-jdgl-input.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  -->
			</div>
      </section>
	</div>

  </body>

</html>
