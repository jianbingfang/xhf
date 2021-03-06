<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "hr-zd");
%>
<!doctype html>
<html lang="en">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="plain-info.plain-info.input.title"
		text="管理制度 - 管理制度 - 人力资源" /></title>
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
		<%@include file="/menu/plain-info.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>管理制度<span class="divider">/</span>
							</li>
							<li class="active">管理制度</li>
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
						action="hr-doc-glzd-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="plain-info_fid" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<input id="plain-info_fmodulecode" type="hidden" name="fmodule"
							value="hr"> <input id="plain-info_ftype" type="hidden"
							name="ftype" value="1">
						<div class="control-group">
							<label class="control-label" for="plain-info_ftitle"><spring:message
									code="plain-info.plain-info.input.ftitle" text="制度名称" /></label>
							<div class="controls">
								<input id="plain-info_ftitle" type="text" name="ftitle"
									value="${model.ftitle}" size="40" class="text required"
									minlength="" maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_ftitle"><spring:message
									code="plain-info.plain-info.input.ftitle" text="状态" /></label>
							<div class="controls">
								<select class="form-control" id="plain-info_ftitle"
									name="fstatus" value="${model.fstatus}" class=" required">
									<option value="1"
										<c:if test="${model.fstatus==1}"> selected="selected"  </c:if>>试行</option>
									<option value="2"
										<c:if test="${model.fstatus==2}"> selected="selected"  </c:if>>实行</option>
									<option value="3"
										<c:if test="${model.fstatus==3}"> selected="selected"  </c:if>>废除</option>
								</select>
							</div>
						</div>
					<%-- 	<div class="control-group">
							<label class="control-label" for="plain-info_fmonth"><spring:message
									code="plain-info.plain-info.input.ftitle" text="开始时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="plain-info_fstartdate" type="text" name="fstartdate"
										value="${model.fstartdate}" size="40" class="text required"
										minlength="2" maxlength="10" readonly
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fmonth"><spring:message
									code="plain-info.plain-info.input.ftitle" text="废止时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="plain-info_fenddate" type="text" name="fenddate"
										value="${model.fenddate}" size="40" class="text "
										minlength="2" maxlength="10" readonly
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>

							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fmonth"><spring:message
									code="plain-info.plain-info.input.ftitle" text="修订时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="plain-info_fupdatedate" type="text"
										name="fupdatedate" value="${model.fupdatedate}" size="40"
										class="text " minlength="2" maxlength="10" readonly
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>

							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fdetail">编制人</label>
							<div class="controls">
								<input id="plain-info_creator" type="text" name="fcreator"
									value="${model.fcreator}" size="40" class="text required"
									minlength="1" maxlength="50">
							</div>
						</div> --%>
						<div class="control-group">
							<label class="control-label" for="plain-info_fmemo">备注</label>
							<div class="controls">
								<input id="plain-info_creator" type="text" name="fmemo"
									value="${model.fmemo}" size="40" class="text " minlength="1"
									maxlength="50">
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
		<!-- end of main -->
	</div>

</body>

</html>
