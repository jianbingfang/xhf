<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-wz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="wzTable-info.wzTable-info.input.title" text="物品属性"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#wzTable-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
});
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="wzTable-info.wzTable-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="wzTable-infoForm" method="post" action="wzTable-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="wzTable-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="wzTable-info_fname"><spring:message code="wzTable-info.wzTable-info.input.fname" text="物品名称"/></label>
					<div class="controls">
					  	 <input id="wzTable-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzTable-info_fcode"><spring:message code="wzTable-info.wzTable-info.input.fcode" text="物品编号"/></label>
					<div class="controls">
					  	 <input id="wzTable-info_fcode" type="text" name="fcode" value="${model.fcode}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzTable-info_fkindid"><spring:message code="wzTable-info.wzTable-info.input.fkindid" text="类型"/></label>
					<div class="controls">
					  	 <select id="hrGwbm-info_fbmid" name="fkindid"  class="form-control required" >
						  <c:forEach items="${kindList}" var="item">
						    <option value="${item.fid}" ${item.fid==model.fkindid? 'selected' : ''}>${item.fkindname}</option>
						  </c:forEach>
					  	</select>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzTable-info_funit"><spring:message code="wzTable-info.wzTable-info.input.funit" text="计量单位"/></label>
					<div class="controls">
					  	<input id="wzTable-info_funit" type="text" name="funit" value="${model.funit}" size="" class="text   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="wzTable-info_fnum"><spring:message code="wzTable-info.wzTable-info.input.fnum" text="数量"/></label>
					<div class="controls">
					  	<input id="wzTable-info_fnum" type="text" name="fnum" value="${model.fnum}" size="" class="number   " minlength="" maxlength="">
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
