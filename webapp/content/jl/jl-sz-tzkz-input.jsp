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
    	  var contentId=$(this).attr('href');
    	  $(contentId + " iframe").attr("src","jlShizhong-info-list.do?fszleix="+$(this).attr('sz-type'));
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
			  <li role="presentation" class="active"><a href="#tab1" sz-type="TEMP_JL_GCKSH">工程款审核</a></li>
			  <li role="presentation" class=""><a href="#tab2" sz-type="TEMP_JL_JHBGSH">计划变更审核</a></li>
			  <li role="presentation" class=""><a href="#tab3" sz-type="TEMP_JL_TZSPJXCQZ">投资索赔及现场签证</a></li>
			</ul>
			
			<div class="tab-content">
			  <div class="tab-pane active" id="tab1">
			  	  <iframe  src="jlShizhong-info-list.do?fszleix=TEMP_JL_GCKSH" height="600px" width="100%"  style="border: 0px;"></iframe>
				</div>
			  	<div class="tab-pane" id="tab2">
			  		<iframe height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab3">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			 </div>
      </section>
	</div>

  </body>

</html>
