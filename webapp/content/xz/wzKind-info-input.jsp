<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-wz");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="wzKind-info.wzKind-info.input.title" text="物品分类 - 物资管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#wzKind-infoForm")
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
			});
	function extend(){
		
	}
			
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
					<h4 class="title">
						<spring:message code="wzKind-info.wzKind-info.input.title"
							text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">

					<form id="wzKind-infoForm" method="post"
						action="wzKind-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="wzKind-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<label class="control-label" for="wzKind-info_fkindname"><spring:message
									code="wzKind-info.wzKind-info.input.fkindname" text="分类名称" /></label>
							<div class="controls">
								<input id="wzKind-info_fkindname" type="text" name="fkindname"
									value="${model.fkindname}" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="wzKind-info_fpid"><spring:message
									code="wzKind-info.wzKind-info.input.fpid" text="上级" /></label>
							<div class="controls">
								<select id="hrGwbm-info_fbmid" name="fpid" class="form-control " onchange="extend(this)">
									<option></option>
									<c:forEach items="${kindList}" var="item">
										<option value="${item.fid}"
											${item.fid==model.fpid? 'selected' : ''}>${item.fkindname}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="wzKind-info_fisasset"><spring:message
									code="wzKind-info.wzKind-info.input.fisasset" text="是否为固定资产" /></label>
							<div class="controls">
								<select class="form-control" id="wzKind-info_fisasset"
									name="fisasset" value="${model.fisasset}" class=" ">
									<option value="是"
										<c:if test="${model.fisasset}=='是'}"> selected="selected"  </c:if>>是</option>
									<option value="否"
										<c:if test="${model.fisasset}=='否'}"> selected="selected"  </c:if>>否</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="wzKind-info_fcode"><spring:message
									code="wzKind-info.wzKind-info.input.fcode" text="物资代码" /></label>
							<div class="controls">
								<input id="wzKind-info_fcode" type="text" name="fcode"
									value="${model.fcode}" size="" class="text   " minlength=""
									maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="wzKind-info_funit"><spring:message
									code="wzKind-info.wzKind-info.input.funit" text="计量单位" /></label>
							<div class="controls">
								<input id="wzKind-info_funit" type="text" name="funit"
									value="${model.funit}" size="" class="text   " minlength=""
									maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="wzKind-info_fstatus"><spring:message
									code="wzKind-info.wzKind-info.input.fstatus" text="状态" /></label>
							<div class="controls">
								<select class="form-control" id="wzKind-info_fstatus"
									name="fstatus" value="${model.fstatus}" class=" ">
									<option value="可用"
										<c:if test="${model.fstatus}=='可用'}"> selected="selected"  </c:if>>可用</option>
									<option value="停用"
										<c:if test="${model.fstatus}=='停用'}"> selected="selected"  </c:if>>停用</option>
								</select>
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
