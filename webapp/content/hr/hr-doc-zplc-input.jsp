<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "hr-xc");
%>
<!doctype html>
<html lang="en">

<head>
<%@include file="/common/meta.jsp"%>
<title>
		基本工资计算 - 员工招聘 - 人力资源 </title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript" src="${ctx}/s/xthena/js/jbgzjsq.js"></script>
<script type="text/javascript">
	function sj(){
	var value = jbgzjsq($("#plain-info_fxueli").val(),$("#plain-info_fbyz").val(),$("#plain-info_fgyxz").val(),$("#plain-info_fbysj").val());
		$("#fjbgzje").val(value);
	} 
</script>
</head>

<body>
	<%@include file="/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/plain-info.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
			
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="plain-info.plain-info.input. title"
							text="基本工资计算器" />
					</h4>
				</header>

				<div class="content content-inner">
					<form id="plain-infoForm" method="post"
						action="hr-doc-zplc-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="plain-info_fid" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<input id="plain-info_fmodulecode" type="hidden" name="fmodule"
							value="hr"> <input id="plain-info_ftype" type="hidden"
							name="ftype" value="4">
						<div class="control-group">
							<label class="control-label" for="plain-info_ftitle"><spring:message
									code="plain-info.plain-info.input.ftitle" text="学历" /></label>
							<div class="controls">
								<select class="form-control" id="plain-info_fxueli"
									name="fxueli" value="${model.fxueli}" class=" required"  onchange="js()">
									<option value="-1">小学</option>
									<option value="0">初中</option>
									<option value="1">中专</option>
									<option value="2" selected= "selectd" >大专</option>
									<option value="3">本科</option>
									<option value="4">硕士</option>
									<option value="5">博士</option>
									
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_ftitle"><spring:message
									code="plain-info.plain-info.input.fgyxz" text="雇佣性质" /></label>
							<div class="controls">
								<select class="form-control" id="plain-info_fgyxz"
									name="fgyxz"  value="" class=" required" onchange="js()">
									<option value="1" selected="selected"  >实习期</option>
									<option value="2" selected="selected"  >试用期</option>
									<option value="3" selected="selected"  >正式</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_ftitle"><spring:message
									code="plain-info.plain-info.input.fbyz" text="是否有毕业证" /></label>
							<div class="controls">
								<select class="form-control" id="plain-info_fbyz"
									name="fbyz" value="${model.fbyz}" class=" required" onchange="js()">
									<option value="1" selected="selected"  >有</option>
									<option value="2" >无</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fbysj"><spring:message
									code="plain-info.plain-info.input.fbysj" text="毕业时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="plain-info_fbysj" type="text" name="fbysj"
										value="${model.fbysj}" size="40" class="text required"
										 maxlength="10" readonly
										style="background-color:white;cursor:default; width: 175px;" onchange="js()">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>

							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="plain-info_fjbgzje"><spring:message
									code="plain-info.plain-info.input.fjbgzje" text="基本工资金额" /></label>
							<div class="controls">
								<input id="fjbgzje" value="${model.jbgzje}" type="number"  readonly/>

							</div>
						</div>
						
						<div class="control-group">
							<div class="controls">
								<button type="button" class="btn a-submit" onclick="sj()">
									计算
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									返回
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
