<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jsgl-home");%>
<%pageContext.setAttribute("currentMenu", "jsgl-plain");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="plain-info.plain-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#plain-infoForm").validate({
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
	  <%@include file="/menu/jsgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="plain-info.plain-info.input. title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">
			<form id="plain-infoForm" method="post" action="jsgl-plain-info-save.do" class="form-horizontal">
			  <c:if test="${model != null}">
			  <input id="plain-info_fid" type="hidden" name="fid" value="${model.fid}">
			  </c:if>
			    <input id="plain-info_fmodulecode" type="hidden" name="fmodulecode" value="jsgl">
			     <input id="plain-info_ftype" type="hidden" name="ftype" value="1">
			  <div class="control-group">
			    <label class="control-label" for="plain-info_ftitle"><spring:message code="plain-info.plain-info.input.ftitle" text="标题"/></label>
				<div class="controls">
				  <input id="plain-info_ftitle" type="text" name="ftitle" value="${model.ftitle}" size="40" class="text required" minlength="4" maxlength="20">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="plain-info_fmonth"><spring:message code="plain-info.plain-info.input.ftitle" text="月份"/></label>
				<div class="controls">
				  <select class="form-control" id="plain-info_ftitle" name="fmonth" value="${model.fmonth}" class=" required" >
					  <option <c:if test="${model.fmonth=='201407'}"> selected="selected"  </c:if>>201407</option>
					    <option <c:if test="${model.fmonth=='201408'}"> selected="selected"  </c:if>>201408</option>
					      <option <c:if test="${model.fmonth=='201409'}"> selected="selected"  </c:if>>201409</option>
					        <option <c:if test="${model.fmonth=='201410'}"> selected="selected"  </c:if>>201410</option>
					          <option <c:if test="${model.fmonth=='201411'}"> selected="selected"  </c:if>>201411</option>
					</select>
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="plain-info_fdetail">计划内容</label>
				<div class="controls">
					<textarea id="plain-info_fdetail"  name="fdetail"  class="form-control" rows="6">${model.fdetail}</textarea>
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
