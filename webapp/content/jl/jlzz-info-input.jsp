<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-sqzb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
    
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
			<div>
			  	<div id="tab2">
			  		<iframe  src="jlZjTsgz-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			</div>
      </section>
	</div>

  </body>

</html>
