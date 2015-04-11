<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hr-xc");%>
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
	  <%@include file="/menu/hr-workspace.jsp"%>
	  <!-- start of main -->
      <section id="m-main" class="span10">
      	<ul id="myTab" class="nav nav-tabs" role="tablist">
     	  	<li role="presentation" class="active"><a href="#tab1">薪资台账</a></li>
     	   <li role="presentation" ><a href="#tab2">薪资结构</a></li>
        </ul>
	      <div class="tab-content">
		  	  <div class="tab-pane active" id="tab1">
				  <iframe src="commRy-xinzi-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  </div>
			  <div class="tab-pane" id="tab2">
			  		   <p>1.1.机关员工</p>

					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.1.1一般岗位人员：薪资=基本工资+岗位工资+绩效工资+工龄工资+伙食补助+奖金</p>
					
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.1.2标书制作员：薪资=基本工资+计件工资+工龄工资+伙食补助+奖金</p>
					
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.1.3业务员：薪资=基本工资+提成工资+工龄工资+伙食补助+奖金</p>
					
					<p>&nbsp;&nbsp;&nbsp; 1.2项目人员</p>
					
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 薪资=基本工资+能效工资+岗位工资+工龄工资+注册补助+现场综合补助（异地+环境+伙食+兼项）+绩效工资＋奖金。</p>

				 	 <!-- <iframe src="hrShZhaop-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe> -->
			  </div>
	      </div>
      </section>
	</div>

  </body>

</html>
