<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-plain");%>
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
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
	<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>工作计划<span class="divider">/</span>
							</li>
							<li class="active">周计划</li>
						</ul>
					</div>
				</div>
			</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="plain-info.plain-info.input. title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">
			<form id="plain-infoForm" method="post" action="gcgl-week-plain-info-save.do" class="form-horizontal">
			  <c:if test="${model != null}">
			  <input id="plain-info_fid" type="hidden" name="fid" value="${model.fid}">
			  </c:if>
			    <input id="plain-info_fmodulecode" type="hidden" name="fmodulecode" value="gcgl">
			     <input id="plain-info_ftype" type="hidden" name="ftype" value="2">
			  <div class="control-group">
			    <label class="control-label" for="plain-info_ftitle"><spring:message code="plain-info.plain-info.input.ftitle" text="标题"/></label>
				<div class="controls">
				  <input id="plain-info_ftitle" type="text" name="ftitle" value="${model.ftitle}" size="40" class="text required" minlength="1" maxlength="20">
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="plain-info_fmonth"><spring:message code="plain-info.plain-info.input.ftitle" text="起始时间"/></label>
				<div class="controls">
				 <div class="input-append datepicker date" style="padding-left: 0px;">
				    <input id="plain-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text" minlength="2" maxlength="10" readonly style="background-color:white;cursor:default; width: 175px;">
				    <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
				  </div>
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="plain-info_fmonth"><spring:message code="plain-info.plain-info.input.ftitle" text="截止时间"/></label>
				<div class="controls">
				  <div class="input-append datepicker date" style="padding-left: 0px;">
				    <input id="plain-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text" minlength="2" maxlength="10" readonly style="background-color:white;cursor:default; width: 175px;">
				    <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
				  </div>

			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="plain-info_fdetail">计划内容</label>
				<div class="controls">
					<textarea id="plain-info_fdetail"  name="fdetail"  class="form-control" rows="6">${model.fdetail}</textarea>
			    </div>
			  </div>
			  <div class="control-group">
							<label class="control-label" for="plain-info_fstatus">状态</label>
							<div class="controls">
								<input id="plain-info_fstatus"  readonly="readonly" name="fstatus" value="${model.fstatus}"
									class="form-control" type="text">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fcomment">批示</label>
							<div class="controls">
								<textarea id="plain-info_fcomment" readonly="readonly" name="fcomment"
									class="form-control" rows="6">${model.fcomment}</textarea>
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
