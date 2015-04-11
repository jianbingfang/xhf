<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "hr-plain");
%>
<!doctype html>
<html lang="en">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="plain-info.plain-info.input.title"
		text="工作计划" /></title>
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
				var editor = CKEDITOR.replace('plain-info_fdetail');
				// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
				editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";

			})
</script>
</head>

<body>
	<%@include file="/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/plain-info.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
		<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>工作计划<span class="divider">/</span>
							</li>
							<li class="active">月计划</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="plain-info.plain-info.input. title"
							text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">
					<form id="plain-infoForm" method="post"
						action="plain-info-save.do?taskId=${taskId}" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="plain-info_fid" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<label class="control-label" for="plain-info_ftitle"><spring:message
									code="plain-info.plain-info.input.ftitle" text="标题" /></label>
							<div class="controls">
								<input id="plain-info_ftitle" type="text" name="ftitle"
									value="${model.ftitle}" size="40" class="text required"
									minlength="4" maxlength="20" readonly="readonly">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fmonth"><spring:message
									code="plain-info.plain-info.input.ftitle" text="月份" /></label>
							<div class="controls">
									<input id="plain-info_fmonth" type="text" readonly="readonly" name="fmonth" value="${model.fmonth}" size="40" class="text " minlength="4" maxlength="20">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fdetail">计划内容</label>
							<div class="controls">
								${model.fdetail}
							</div>
						</div>
						
						<div class="control-group">
							<label class="control-label" for="plain-info_fdetail">审批意见</label>
							<div class="controls">
								<textarea  name="fcomment"
									class="form-control" rows="6" style="width: 800px;"></textarea>
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
		<!-- end of main -->
	</div>

</body>

</html>
