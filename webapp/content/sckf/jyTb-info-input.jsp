<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xmtb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyTb-info.jyTb-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
		$(function() {
		    $("#jyTb-infoForm").validate({
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
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jyTb-info.jyTb-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jyTb-infoForm" method="post" action="jyTb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyTb-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
					<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyTb-info_ftbwjbh"><spring:message code="jyTb-info.jyTb-info.input.ftbwjbh" text="投标文件编号"/></label>
						<div class="controls">
							  	 <input id="jyTb-info_ftbwjbh" type="text" name="ftbwjbh" value="${model.ftbwjbh}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fzbfs"><spring:message code="jyTb-info.jyTb-info.input.fzbfs" text="正本份数"/></label>
						<div class="controls">
							  	<input id="jyTb-info_fzbfs" type="text" name="fzbfs" value="${model.fzbfs}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyTb-info_ffbfs"><spring:message code="jyTb-info.jyTb-info.input.ffbfs" text="副本份数"/></label>
						<div class="controls">
							  	<input id="jyTb-info_ffbfs" type="text" name="ffbfs" value="${model.ffbfs}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fdzbfs"><spring:message code="jyTb-info.jyTb-info.input.fdzbfs" text="电子版份数"/></label>
						<div class="controls">
							  	<input id="jyTb-info_fdzbfs" type="text" name="fdzbfs" value="${model.fdzbfs}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyTb-info_ftbts"><spring:message code="jyTb-info.jyTb-info.input.ftbts" text="投标文件套数"/></label>
						<div class="controls">
							  	 <input id="jyTb-info_ftbts" type="text" name="ftbts" value="${model.ftbts}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fispass"><spring:message code="jyTb-info.jyTb-info.input.fispass" text="是否通过评审"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="jyTb-info_fispass" name="fispass" value="${model.fispass}" class=" " >
							    	 	<option value="是"  <c:if test="${model.fispass}=='是'}"> selected="selected"  </c:if>>是</option>
							    	 	<option value="否"  <c:if test="${model.fispass}=='否'}"> selected="selected"  </c:if>>否</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fpingshenren"><spring:message code="jyTb-info.jyTb-info.input.fpingshenren" text="评审人"/></label>
						<div class="controls">
							  	<input id="jyTb-info_fpingshenren" type="text" name="fpingshenren" value="${model.fpingshenren}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fmemo"><spring:message code="jyTb-info.jyTb-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="jyTb-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fmemo1"><spring:message code="jyTb-info.jyTb-info.input.fmemo1" text="备注1"/></label>
						<div class="controls">
						      	<textarea id="jyTb-info_fmemo1"  name="fmemo1"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo1}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fmemo2"><spring:message code="jyTb-info.jyTb-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
						      	<textarea id="jyTb-info_fmemo2"  name="fmemo2"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo2}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fmemo3"><spring:message code="jyTb-info.jyTb-info.input.fmemo3" text="备注3"/></label>
						<div class="controls">
						      	<textarea id="jyTb-info_fmemo3"  name="fmemo3"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo3}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fmemo4"><spring:message code="jyTb-info.jyTb-info.input.fmemo4" text="备注4"/></label>
						<div class="controls">
						      	<textarea id="jyTb-info_fmemo4"  name="fmemo4"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo4}</textarea>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyTb-info_fbmid"><spring:message code="jyTb-info.jyTb-info.input.fbmid" text="报名信息id"/></label>
						<div class="controls">
							  	<input id="jyTb-info_fbmid" type="text" name="fbmid" value="${model.fbmid}" size="" class="number   " minlength="" maxlength="">
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
