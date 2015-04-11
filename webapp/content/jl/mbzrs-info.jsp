<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-xmjd");%>
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
    
    activeFirst();
});


function activeFirst(){
	$('#myTab li:first-child').addClass("active");
	$('.tab-content div:first-child').addClass("active");
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
      <c:forEach items="${page.result}" var="item">
     	  <li role="presentation" ><a href="#tab${item.fid}">${item.ftitle}</a></li>
      </c:forEach>
      </ul>
      <div class="tab-content">
	      <c:forEach items="${page.result}" var="item">
			  	<div class="tab-pane" id="tab${item.fid}">
			  		${item.fmemo1}
				</div>
	      </c:forEach>
      </div>
      </section>
	</div>

  </body>

</html>
