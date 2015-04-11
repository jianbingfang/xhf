<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-jbxx");%>

<%pageContext.setAttribute("dwType",request.getParameter("dwType"));%>

<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlXgdw-info.jlXgdw-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlXgdw-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
})
    </script>
  </head>

  <body>
  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">


      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlXgdw-info.jlXgdw-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlXgdw-infoForm" method="post" action="jlXgdw-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlXgdw-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
   				  <div class="control-group">
				    <label class="control-label" for="jlXgdw-info_fdwtype"><spring:message code="jlXgdw-info.jlXgdw-info.input.fdwtype" text="参建单位"/></label>
					<div class="controls">
						 <select class="form-control" id="jlXgdw-info_fdwtype" name="fdwtype" value="${model.fdwtype}" class="required " >
					    	 	<option value="1"  <c:if test="${model.fdwtype=='1'}"> selected="selected"</c:if>>建设单位</option>
					    	 	<option value="2"  <c:if test="${model.fdwtype=='2'}"> selected="selected"</c:if>>项目管理单位</option>
					    	 	<option value="3"  <c:if test="${model.fdwtype=='3'}"> selected="selected"</c:if>>设计单位</option>
					    	 	<option value="4"  <c:if test="${model.fdwtype=='4'}"> selected="selected"</c:if>>施工单位</option>
					    	 	<option value="5"  <c:if test="${model.fdwtype=='5'}"> selected="selected"</c:if>>勘察单位</option>
					    	 	<option value="6"  <c:if test="${model.fdwtype=='6'}"> selected="selected"</c:if>>监理单位</option>
					    	 	<option value="7"  <c:if test="${model.fdwtype=='7'}"> selected="selected"</c:if>>其他单位</option>
					 	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlXgdw-info_fdw"><spring:message code="jlXgdw-info.jlXgdw-info.input.fdw" text="单位名称"/></label>
					<div class="controls">
					  	 <input id="jlXgdw-info_fdw" type="text" name="fdw" value="${model.fdw}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlXgdw-info_fcontact"><spring:message code="jlXgdw-info.jlXgdw-info.input.fcontact" text="联系人"/></label>
					<div class="controls">
					  	 <input id="jlXgdw-info_fcontact" type="text" name="fcontact" value="${model.fcontact}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
				      	<div class="control-group">
				    <label class="control-label" for="jlXgdw-info_fzhiw"><spring:message code="jlXgdw-info.jlXgdw-info.input.fzhiw" text="职务"/></label>
					<div class="controls">
					  	 <input id="jlXgdw-info_fzhiw" type="text" name="fzhiw" value="${model.fzhiw}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlXgdw-info_ftel"><spring:message code="jlXgdw-info.jlXgdw-info.input.ftel" text="联系方式"/></label>
					<div class="controls">
					  	 <input id="jlXgdw-info_ftel" type="text" name="ftel" value="${model.ftel}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlXgdw-info_fmail"><spring:message code="jlXgdw-info.jlXgdw-info.input.fmail" text="邮箱"/></label>
					<div class="controls">
					  	 <input id="jlXgdw-info_fmail" type="text" name="fmail" value="${model.fmail}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jlXgdw-info_fmemo"><spring:message code="jlXgdw-info.jlXgdw-info.input.fmemo" text="备注"/></label>
					<div class="controls">
					  	 <input id="jlXgdw-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
					 	<div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
						  &nbsp;
					      <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
		</form>
        </div>
      </article>
</section>
	  <!-- end of main -->
	</div>

  </body>

</html>
