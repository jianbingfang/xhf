<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-yz");
%>
<!doctype html>
<html lang="zh">

<head><%@include file="/common/meta.jsp"%>
<title><spring:message
		code="xzKzList-info.xzKzList-info.input.title" text="刻章记录 - 印章管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
	        <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
	
<script type="text/javascript">
	$(
			function() {
				$("#xzKzList-infoForm")
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
				
				 
			    createxmPicker({
					modalId : 'xmPicker',
					url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
				});
			    
			})
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
						<spring:message code="xzKzList-info.xzKzList-info.input.title"
							text="编辑" /> 
					</h4>
				</header>

				<div class="content content-inner">

					<form id="xzKzList-infoForm" method="post"
						action="xzKzList-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzKzList-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
					<%-- 	<div class="control-group" hidden>
							<label class="control-label" for="xzKzList-info_fcode"><spring:message
									code="xzKzList-info.xzKzList-info.input.fcode" text="序号" /></label>
							<div class="controls">
							<input id="xzKzList-info_fcode" type="text" name="fcode"
									value="${model.fcode}" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div> --%>
						<div class="control-group">
							<label class="control-label" for="xzKzList-info_fname"><spring:message
									code="xzKzList-info.xzKzList-info.input.fname" text="印章名称" /></label>
							<div class="controls">
								<input id="xzKzList-info_fcode" type="text" name="fname"
									value="${model.fname}" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzYinzhang-info_ftype"><spring:message
									code="xzYinzhang-info.xzYinzhang-info.input.ftype" text="印章类别" /></label>
							<div class="controls">
								<select class="form-control" id="xzYinzhang-info_ftype"
									name="ftype" value="${model.fname}" class=" ">
									<option value="公司章"
										<c:if test="${model.fname}=='公司章'}"> selected="selected"  </c:if>>公司章</option>
									<option value="项目章"
										<c:if test="${model.fname}=='项目章'}"> selected="selected"  </c:if>>项目章</option>
									<option value="个人章"
										<c:if test="${model.fname}=='个人章'}"> selected="selected"  </c:if>>个人章</option>
								</select>
							</div>
						</div>
						
						
			 

						<div class="control-group">
							<label class="control-label" for="xzKzList-info_fcaizhi"><spring:message
									code="xzKzList-info.xzKzList-info.input.fcaizhi" text="材质" /></label>
							<div class="controls">
								<select class="form-control" id="xzKzList-info_fcaizhi"
									name="fcaizhi" value="${model.fcaizhi}" class=" required">
									<option value="光敏"
										<c:if test="${model.fcaizhi=='光敏'}"> selected="selected"  </c:if>>光敏</option>
									<option value="普通"
										<c:if test="${model.fcaizhi=='普通'}"> selected="selected"  </c:if>>原子</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzKzList-info_fprice"><spring:message
									code="xzKzList-info.xzKzList-info.input.fprice" text="价格" /></label>
							<div class="controls">
								<input id="xzKzList-info_fprice" type="text" name="fprice"
									value="${model.fprice}" size="" class="text “
									minlength="" maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzKzList-info_flqsj"><spring:message
									code="xzKzList-info.xzKzList-info.input.flqsj" text="领取时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="xzKzList-info_flqsj" type="text" name="flqsj"
										value="${model.flqsj}" size="40" class="text "
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
						
						   	<div class="control-group">
				    <label class="control-label" for="pjFirstCheck-info_fxmid"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.input.fxmid" text="项目"/></label>
					<div class="controls">
							<div class="input-append xmPicker">
								<input id="xzChufa-info_fxmid" type="hidden" name="fxmid"
									value="${model.fxmid}"> <input
									id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
					  	<%-- 	<input id="pjFirstCheck-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength=""> --%>
				    </div>
				  </div>
				  
				  
								<div class="control-group">
							<label class="control-label" for="xzKzList-info_flqr"><spring:message
									code="xzKzList-info.xzKzList-info.input.flqr" text="领取人" /></label>
							<div class="controls">
								<div class="input-append ryPicker">
									<input id="xzWs-info_fry" type="hidden" name="flqr"
										value="${model.flqr}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.flqr].fname}"
										disabled class="required " style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzKzList-info_fghsj"><spring:message
									code="xzKzList-info.xzKzList-info.input.fghsj" text="归还时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="xzKzList-info_fghsj" type="text" name="fghsj"
										value="${model.fghsj}" size="40" class="text "
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
								<div class="control-group">
							<label class="control-label" for="xzKzList-info_fghr"><spring:message
									code="xzKzList-info.xzKzList-info.input.fghr" text="归还人" /></label>
							<div class="controls">
								<div class="input-append ryPicker">
									<input id="xzWs-info_fghr" type="hidden" name="fghr"
										value="${model.fghr}"> <input
										id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fghr].fname}"
										disabled class="required " style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzKzList-info_fmemo"><spring:message
									code="xzKzList-info.xzKzList-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<input id="xzKzList-info_fmemo" type="text" name="fmemo"
									value="${model.fmemo}" size="" class="text "
									minlength="" maxlength="">
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
