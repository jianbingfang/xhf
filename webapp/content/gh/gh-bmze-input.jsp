<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gh-home");
%>
<%
	pageContext.setAttribute("currentMenu", "gh-zd");
%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="plain-info.plain-info.input.title" text="支部职责 - 管理制度 "/></title>
    <%@include file="/common/s.jsp"%>
<script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#plain-infoForm")
						.validate(
								{
									submitHandler : function(form) {
										bootbox.animate(false);
										var box = bootbox
												.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
										form.submit();
									},
									errorClass : 'validate-error'
								});
				var editor = CKEDITOR.replace('plain-info_fmemo1');
				// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
				editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
				editor.config.height = 800;
			})
</script>
  </head>
  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	   <%@include file="/menu/gh-workspace.jsp"%>

<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="plain-info.plain-info.input. title"
							text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">
					<form id="plain-infoForm" method="post"
						action="gh-doc-bmze-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="plain-info_fid" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<input id="plain-info_fmodulecode" type="hidden" name="fmodule"
							value="cw"> <input id="plain-info_ftype" type="hidden"
							name="ftype" value="1">
						<div class="control-group">
							<label class="control-label" for="plain-info_ftitle"><spring:message
									code="plain-info.plain-info.input.ftitle" text="标题" /></label>
							<div class="controls">
								<input id="plain-info_ftitle" type="text" name="ftitle"
									value="${model.ftitle}" size="40" class="text required"
									minlength="4" maxlength="50">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fdetail">制度内容</label>
							<div class="controls">
								<textarea id="plain-info_fmemo1" name="fmemo1"
									class="form-control" style="width:500px;" rows="20">${model.fmemo1}</textarea>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn a-submit">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
						</div>
					</form>
				</div>
			</article>
		</section>
	  <!-- start of main -->
  <%--     <section id="m-main" class="span10">
	 <article class="m-widget">
        <header class="header">
		  <h4 class="title">部门职责</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrLz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrLz-infoSearch" class="content content-inner">
        
			<form id="plain-infoForm" method="post" action="hr-doc-glzd-save.do" class="form-horizontal">
			  <div class="control-group">
				<div class="controls" style="margin-left:10px;">
					<label class="control-label" style="width:94%; text-align: left; line-height:28px;" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${model.fbmze}"/></label>
			    </div>
			  </div>
			
			</form>
		</div>
	  </article>
	  	 <article class="m-widget">
        <header class="header">
		  <h4 class="title">人员列表</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrLz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrLz-infoSearch" class="content content-inner">
			<form id="plain-infoForm" method="post" action="hr-doc-glzd-save.do" class="form-horizontal">
			 <c:forEach items="${model.rylist}" var="item">
			 <label class="control-label" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.key}:"/></label>
			 	<div class="control-group">
					<div class="controls">
						<label class="control-label" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.value}"/></label>
				    </div>
	 			 </div>
			 </c:forEach>
			</form>
		</div>
	  </article>
	  	 <article class="m-widget">
        <header class="header">
		  <h4 class="title">岗位职责</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrLz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrLz-infoSearch" class="content content-inner">
				<form id="plain-infoForm" method="post" action="hr-doc-glzd-save.do" class="form-horizontal">
				<c:forEach items="${model.gwlist}" var="item">
				<label class="control-label" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.key}"/></label>
				  <div class="control-group">
					<div class="controls">
						<label class="control-label" style="width:94%; text-align: left;" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.value}"/></label>
				    </div>
				  </div>
				 </c:forEach>
			</form>
		</div>
	  </article>
      </section> --%>
	</div>

  </body>

</html>
