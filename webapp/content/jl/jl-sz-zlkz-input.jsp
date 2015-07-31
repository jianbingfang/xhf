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
    	  if($(this).attr('sz-type'))
    		  $("#tab iframe").attr("src","jlShizhong-info-list.do?fszleix="+$(this).attr('sz-type')+"&divStyle="+$(this).attr('divStyle'));
    
	  	  if($(this).attr('href')=='#tab13')
	  		 $("#tab iframe").attr("src","pxjcjl-info.do");
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
			<!-- <ul id="myTab" class="nav nav-pills nav-stacked" role="tablist" style="float: left;"> -->
			<ul id="myTab" class="nav nav-tabs" role="tablist" >
			  <li  class="active" role="presentation"><a href="#tab1" divStyle="upload" sz-type="TEMP_JL_XCZKGLJCJL">现场质量管理检查记录</a></li>
			   <li role="presentation" ><a href="#tab2" divStyle="yiqi"  sz-type="TEMP_JL_YQSBJC">计量器具检测</a></li>
			     <li role="presentation" ><a href="#tab4"  divStyle="nameVlaueMathWithoutStatus"  sz-type="TEMP_JL_CLFXBG">测量放线报告</a></li>
			     <li role="presentation" ><a href="#tab5"  divStyle="nameVlaueMathWithoutStatus"  sz-type="TEMP_JL_DIYCJL">地基验槽记录</a></li>
			     <li role="presentation" ><a href="#tab6"  divStyle="nameVlaueMathWithoutStatus"  sz-type="TEMP_JL_TRJCBG">土壤氡检测</a></li>
			     <li role="presentation" ><a href="#tab3"  divStyle="nameVlaueMathWithoutStatus"  sz-type="TEMP_JL_HJJCYJGNXBG">环境监测以及功能性检测报告</a></li>
		         <li role="presentation" ><a href="#tab8"  divStyle="nameVlaueMathWithoutStatus"  sz-type="TEMP_JL_FSXJCTZ">材料放射性监测</a></li>
	         	 <li role="presentation" ><a href="#tab9"  divStyle="upload"  sz-type="TEMP_JL_JZQYJL">见证取样记录</a></li>
	          	 <li role="presentation" ><a href="#tab10" divStyle="singleAsync"  sz-type="TEMP_JL_PYGCBYZL">检验批、隐蔽工程报验资料</a></li>
           		 <li role="presentation" ><a href="#tab11" divStyle="hunningtu"  sz-type="TEMP_JL_SPHNTZLJJZL">商品混凝土资料及浇筑令</a></li>
		         <li role="presentation" ><a href="#tab12" divStyle="multipleAsync"  sz-type="TEMP_JL_GCSYZL">工程试验资料</a></li>
		         <li role="presentation" ><a href="#tab13">平行检查记录</a></li>
		         <li role="presentation" ><a href="#tab14" divStyle="upload" sz-type="TEMP_JL_PZJL">旁站记录</a></li>
		         <li role="presentation" ><a href="#tab15" divStyle="nameVlaueMathWithoutStatus" sz-type="TEMP_JL_JGJCBG">结构检测报告</a></li>
		         <li role="presentation" ><a href="#tab21" divStyle="nameVlaueMathWithoutStatus"  sz-type="TEMP_JL_ZLSGDCBGJCLFA">质量事故调查报告及处理方案</a></li>
		         <li role="presentation" ><a href="#tab16" divStyle="nameVlaueMathWithoutStatus"  sz-type="TEMP_JL_FBYSZL">分部验收资料</a></li>
		         <li role="presentation" ><a href="#tab18" divStyle="jgysh" sz-type="TEMP_JL_JGYS">竣工预验收</a></li>
		         <li role="presentation" ><a href="#tab19" divStyle="singleUpload" sz-type="TEMP_JL_JGYSBG">竣工验收报告</a></li>
		         <li role="presentation" ><a href="#tab20" divStyle="singleJgyszl" sz-type="TEMP_JL_JGYSZL">竣工验收资料</a></li>
		         <%--<li role="presentation" ><a href="#tab21" sz-type="TEMP_JL_BXQ">保修期</a></li>--%>
			</ul>
			
			<div class="tab-content">
			  <div id="tab">
			  	 	<iframe src="jlShizhong-info-list.do?fszleix=TEMP_JL_XCZKGLJCJL&divStyle=upload" height="600px" width="100%"  style="border: 0px;"></iframe>
				</div>
			</div>
      </section>
	</div>

  </body>

</html>
