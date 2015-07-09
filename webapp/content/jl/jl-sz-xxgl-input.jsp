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
	    	  $(contentId + " iframe").attr("src","jlShizhong-info-list.do?fszleix="+$(this).attr('sz-type')+"&divStyle="+$(this).attr('divStyle'));
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
				<li role="presentation" class="active"><a href="#tab1"
					>各参建单位通讯录</a></li>
				<li role="presentation" class=""><a href="#tab2"
					>档案盒脊背</a></li>
				<li role="presentation" class=""><a href="#tab3"
					divStyle="uploadWithdate" sz-type="TEMP_JL_KGL">开工令</a></li>

				<li role="presentation" class=""><a href="#tab4"
					>台账</a></li>

				<li role="presentation" class=""><a href="#tab5"
					divStyle="uploadMonth" sz-type="TEMP_JL_JLYB">监理月报</a></li>

				<li role="presentation" class=""><a href="#tab6"
					divStyle="uploadWithdate" sz-type="TEMP_JL_JLRZ">监理日志</a></li>

				<li role="presentation" class=""><a href="#tab7"
					divStyle="uploadWithdate" sz-type="TEMP_JL_GZLXD">工作联系单</a></li>

				<li role="presentation" class=""><a href="#tab8"
					divStyle="uploadWithdate" sz-type="TEMP_JL_JLTZD">监理通知单</a></li>

				<li role="presentation" class=""><a href="#tab9"
					divStyle="uploadWithdate" sz-type="TEMP_JL_LHJY">例会纪要</a></li>

				<li role="presentation" class=""><a href="#tab10"
					divStyle="uploadWithdate" sz-type="TEMP_JL_PGBG">评估报告</a></li>

				<li role="presentation" class=""><a href="#tab11"
					divStyle="uploadWithdate" sz-type="TEMP_JL_JDXZJ">阶段性总结</a></li>
				<li role="presentation" class=""><a href="#tab12"
					divStyle="uploadWithdate" sz-type="TEMP_JL_GCZTL">工程暂停令</a></li>
				<li role="presentation" class=""><a href="#tab13"
					divStyle="uploadWithdate" sz-type="TEMP_JL_GCFGL">工程复工令</a></li>
			</ul>

			<div class="tab-content">
			  <div class="tab-pane active" id="tab1">
			  	 	<iframe src="xgdwContact-info-list.do"  height="600px" width="100%"  style="border: 0px;"></iframe>
				</div>
			  	<div class="tab-pane" id="tab2">
			  		<iframe src="jl-danganhejibei-info-list.do?type=2" height="600px" width="100%"  style="border: 0px;">
					</iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab3">
			  		<iframe   height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>
			  	<div class="tab-pane" id="tab4">
			  		<iframe  src="taizhang-info.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>
			  	<div class="tab-pane" id="tab5">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>
			  	<div class="tab-pane" id="tab6">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab7">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab8">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab9">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab10">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="tab11">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			  	<div class="tab-pane" id="tab12">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			  	<div class="tab-pane" id="tab13">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			 </div>
      </section>
	</div>

  </body>

</html>
