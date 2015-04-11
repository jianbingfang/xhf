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
       <script type="text/javascript" src="${scopePrefix}/s/xthena/js/jquery-ui-1.10.3.mouse_core.js"></script>
      <script type="text/javascript" src="${scopePrefix}/s/xthena/js/jquery.ui.touch-punch.js"></script>
      <script type="text/javascript" src="${scopePrefix}/s/xthena/js/bootstrapslider.js"></script>
  	
  	
  	<style type="text/css">
	    .slider-bar{
	        display:block; width:20px; background-color:#656d78; position:relative;
	    }
	
	    .slider, .slider-bar{
	        height:30px;
	    }
    </style>
    
    <script type="text/javascript">
 
    
var oldjd="${xmInfo.fxmjd}";

$(function() {
    loadProcessBar();
});

function loadProcessBar(){
    //for jsfiddle so its mobile friendly.
    $('head').append('<meta name="viewport" content="width=device-width, initial-scale=1" />');
   
    var $alert = $($(".alert"));
    var $p = $($(".progress"));
    
    $p.on("sliderchange", function (e, result) {
         $alert.html("当前进度: " + result.value.toFixed(0)+"%");
         
    });

    $p.on("slidercomplete", function (e, result) {
        console.log('slider completed!');
    });
    
    $p.on("mouseup", function () {
    	var nowValue=Number($('[role="progressbar"]').attr("aria-valuenow")).toFixed(0);
    	if(nowValue>Number(oldjd)){
    		$('#xmJdDiv').modal();
    		$('#pjXmJd-info_jd').val(nowValue);
    	}
    });
    
}

function saveXmjd(){
	$('#pjXmJd-infoForm').submit();
}

function tabShow(){
	$('.nav.nav-tabs').show();
}

function tabHide(){
	$('.nav.nav-tabs').hide();	
}
    </script>
  </head>

  <body>

    <div class="row-fluid">

	  <!-- start of main -->
	  		<div class="bs-example">
		    <div class="progress slider">
		        <div  aria-valuemax="100" aria-valuemin="0" aria-valuenow="${xmInfo.fxmjd}" role="progressbar" class="progress-bar progress-bar-warning"
		         style="height:30px;float: left;background-color: #37bc9b;" > 
		   		 </div>
		    </div>
		    <div class="alert alert-success">当前进度：0%</div>
			</div>
	</div>
	<div id="xmJdDiv" class="modal hide fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="fryName">填写项目进度</h4>
	      </div>
	      <div class="modal-body">
	      <form id="pjXmJd-infoForm" method="post" action="jl-sz-jdgl-save.do">
			<input id="pjXmJd-info_id" type="hidden" name="fid" >
			<input id="pjXmJd-info_jd" type="hidden" name="fjd" >
	      	<div class="control-group">
				    <label class="control-label" for="pjXmJd-info_fjlf"><spring:message code="pjXmJd-info.pjXmJd-info.input.fjlf" text="本期监理费"/></label>
					<div class="controls">
					  	<input id="pjXmJd-info_fjlf" type="text" name="fjlf"  size="" class="number" minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjXmJd-info_fmemo"><spring:message code="pjXmJd-info.pjXmJd-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="pjXmJd-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 450px" class="text"  minlength="" maxlength="500"></textarea>
				    </div>
				  </div>
				  </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button id="uploadPickerBtnSelect" onclick="saveXmjd()" type="button" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	     <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjXmJd-info.pjXmJd-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
		<form id="pjXmJd-infoGridForm" name="pjXmJd-infoGridForm" method='post' action="pjXmJd-info-remove.do" class="m-form-blank">
		  <table id="pjXmJd-infoGrid" class="m-table table-hover table-bordered">
		    <thead>
		      <tr>
		        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
		        	<th class="sorting" name="fdate">日期</th>
		        	<th class="sorting" name="fjlf">监理费</th>
		        	<th class="sorting" name="fjd">进度（％）</th>
		        	<th class="sorting" name="fmemo">进度备注</th>
		        <th width="80">&nbsp;</th>
		      </tr>
		    </thead>
		
		    <tbody>
		      <c:forEach items="${page.result}" var="item">
		      <tr>
		        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
		       		 <td>${item.fdate}</td>
		      	 	 <td>${item.fjlf}</td>
		      	 	 <td>${item.fjd}%</td>
		      	 	 <td>${item.fmemo}</td>
		        <td>
		         <%--  <a href="pjXmJd-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a> --%>
		        </td>
		      </tr>
		      </c:forEach>
		    </tbody>
		  </table>
		</form>
        </div>
      </article>
	

  </body>

</html>
