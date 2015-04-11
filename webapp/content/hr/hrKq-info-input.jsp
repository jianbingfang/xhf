<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "hrKq");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="hrKq-info.hrKq-info.input.title"
		text="编辑" /></title>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#hrKq-infoForm")
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
				createryPicker({
					modalId : 'ryPicker',
					url : '${scopePrefix}/hr/commRy-simple-list.do'
				});
				
				$("#confirmBtn").click(function() {
					saveFile();
				});
			})
			
			

	function saveFile() {
		var fujianFiles = new Array();
		$.each($('.files').children(), function(index, node) {
			$('#hrKq-info_fname').val($(node).data("fileName") + "."+ $(node).data("fileType"));
			$('#hrKq-info_furl').val($(node).data("fileUrl"));
		});

		$(".uploadModal").modal('hide');
	}
	
</script>
</head>

<body>
	<%@include file="/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/hr-workspace.jsp"%>
			
		<!-- start of main -->
		<section id="m-main" class="span10">
			<%@include file="../comm/comm-upload.jsp"%>
		<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>考勤管理<span class="divider">/</span>
							</li>
							<li class="active">考勤统计</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="hrKq-info.hrKq-info.input.title" text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">

					<form id="hrKq-infoForm" method="post" action="hrKq-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hrKq-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<label class="control-label" for="hrKq-info_fcode"><spring:message
									code="hrKq-info.hrKq-info.input.fcode" text="编号" /></label>
							<div class="controls">
								<input id="hrKq-info_fcode" type="text" name="fcode"
									value="${model.fcode}" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div>
					<%-- 	<div class="control-group">
							<label class="control-label" for="hrKq-info_fname"><spring:message
									code="hrKq-info.hrKq-info.input.fname" text="考勤表名称" /></label>
							<div class="controls">
								<input id="hrKq-info_fname" type="text" name="fname"
									value="${model.fname}" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div> --%>
						<div class="control-group">
							<label class="control-label" for="hrKq-info_fmonth"><spring:message
									code="hrKq-info.hrKq-info.input.fmonth" text="月份" /></label>
							<div class="controls">
								<input id="hrKq-info_fmonth" type="text" name="fmonth"
									value="${model.fmonth}" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="hrKq-info_fmakeuserid"><spring:message
									code="hrKq-info.hrKq-info.input.fmakeuserid" text="编制人" /></label>
							<div class="controls">
								<div class="input-append ryPicker">
									<input id="ryBxRecord-info_fryid" type="hidden" name="fmakeuserid"
										value="${model.fmakeuserid}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fmakeuserid].fname}"
										disabled class=" required" style="width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
										<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fwarn"
												text="考勤表" /></label>
										<div class="controls">
											<input type="button" class="btn a-link" value="点击上传"
												onclick="showUpload()">
										</div>
						</div>
									
						<div class="control-group">
							<label class="control-label" for="hrKq-info_fname"><spring:message
									code="hrKq-info.hrKq-info.input.fname" text="" /></label>
							<div class="controls">
								<input id="hrKq-info_fname" type="text" name="fname"
									value="${model.fname}" size="" class="text required"
									minlength="" maxlength="">
									
								<input id="hrKq-info_furl" type="hidden" name="furl"
									value="${model.furl}" >
									
								<a id="jyXm-info_fbmzlDown"  class="btn"  href="${model.furl}"
													target="_blank">下载</a>
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
