<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xx");%>
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
	  <%@include file="/menu/sckf-workspace.jsp"%>
	  <!-- start of main -->
      <section id="m-main" class="span10">
      	<ul id="myTab" class="nav nav-tabs" role="tablist">
     	  	<li role="presentation" class="active"><a href="#tab1">年度重点项目</a></li>
     	   <li role="presentation" ><a href="#tab2">招标信息</a></li>
        </ul>
	      <div class="tab-content">
		  	  <div class="tab-pane active" id="tab1">
				  <iframe src="niandu-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  </div>
			  <div class="tab-pane" id="tab2">
				 	 <iframe src="jyXm-info-collect-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  </div>
	      </div>
      </section>
	</div>

  </body>

</html>
