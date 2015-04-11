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
    	  $(contentId + " iframe").attr("src","jlShizhong-info-list.do?fszleix="+$(this).attr('sz-type')+"&divStyle="+$(this).attr('divStyle'));
    });
})

function tabShow(){
	$('#myTab').show();
}

function tabHide(){
	$('#myTab').hide();	
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
			 <li role="presentation" class="active"><a href="#tab1" divStyle="nameVlaueMath" sz-type="TEMP_JL_AQZXSGFA">专项安全施工方案</a></li>
			  <li role="presentation" class=""><a href="#tab2" divStyle="nameVlaueMath" sz-type="TEMP_JL_GXYJYA">各项应急预案</a></li>
			  <li role="presentation" class=""><a href="#tab3"  divStyle="nameVlaueMath" sz-type="TEMP_JL_WXYSZJGKCS">施工单位对危险源设置及管控措施</a></li>
			  <li role="presentation" class=""><a href="#tab4"  divStyle="upload" sz-type="TEMP_JL_AQWMJCJL">安全文明检查记录</a></li>
			  <li role="presentation" class=""><a href="#tab5" divStyle="upload" sz-type="TEMP_JL_AQSGFABSBSB">安全施工方案、措施报审表</a></li>
			  <li role="presentation" class=""><a href="#tab6" divStyle="upload" sz-type="TEMP_JL_SGJXSSBSB">施工机械设施报审表</a></li>
			  <li role="presentation" class=""><a href="#tab7" divStyle="upload" sz-type="TEMP_JL_AQJLTZD">安全监理通知单</a></li>
			  <li role="presentation" class=""><a href="#tab8" divStyle="upload" sz-type="TEMP_JLAQJLTZHFD">安全监理通知回复单</a></li>
			  <li role="presentation" class=""><a href="#tab9" divStyle="upload" sz-type="TEMP_JL_AQLXD">安全联系单</a></li>
			  <li role="presentation" class=""><a href="#tab10" divStyle="upload" sz-type="TEMP_JL_SGXCAQGLJLB">施工现场安全管理记录表</a></li>
			  <li role="presentation" class=""><a href="#tab11" divStyle="upload" sz-type="TEMP_JL_JCZXSGFASGJXANQSS">检查专项安全施工方案、施工机械、安全设施及安全交底</a></li>
			</ul>
			<div class="tab-content">
			  <div class="tab-pane active" id="tab1">
			  	 	<iframe src="jlShizhong-info-list.do?fszleix=TEMP_JL_AQZXSGFA&divStyle=nameVlaueMath"  height="600px" width="100%"  style="border: 0px;"></iframe>
				</div>
			  	<div class="tab-pane" id="tab2">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>
			  	<div class="tab-pane " id="tab3">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>
			  	<div class="tab-pane" id="tab4">
			  		<iframe  height="600px" width="100%"  style="border: 0px;"></iframe>
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
			 </div>
      </section>
	</div>

  </body>

</html>
