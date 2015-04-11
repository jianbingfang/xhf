<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-xw");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="xzCommNews-info.xzCommNews-nb-info.input2.title"
		text="公司内部新闻 - 新闻平台 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#xzCommNews-nb-infoForm")
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

				var editor = CKEDITOR.replace('xzCommNews-nb-info_fnewcontent');
				// editorObj.config.filebrowserImageUploadUrl = dir + "core/connector/" + ckfinder.ConnectorLanguage + "/connector." + ckfinder.ConnectorLanguage + "?command=QuickUpload&type=" + ( imageType || 'Images' ) ;
				editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
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
						<spring:message
							code="xzCommNews-info.xzCommNews-nb-info.input2.title" text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">

					<form id="xzCommNews-nb-infoForm" method="post"
						action="xzCommNews-nb-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzCommNews-nb-info_fid" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>


						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommNews-nb-info_fname"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.fname"
										text="新闻标题" /></label>
								<div class="controls">
									<input id="xzCommNews-nb-info_fname" type="text" name="fname"
										value="${model.fname}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCommNews-nb-info_freadnum"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.freadnum"
										text="阅读次数" /></label>
								<div class="controls">
									<input id="xzCommNews-nb-info_freadnum" type="text"
										name="freadnum" readonly value="${model.freadnum}" size=""
										class="number   " minlength="" maxlength="">
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommNews-nb-info_froles"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.froles"
										text="访问权限" /></label>
								<div class="controls">
									<select class="form-control" id="xzCommNews-info_froles"
										name="froles" value="${model.froles}" class=" ">
										<option value="不限"
											<c:if test="${model.froles}=='不限'}"> selected="selected"  </c:if>>不限</option>
										<option value="机关"
											<c:if test="${model.froles}=='机关'}"> selected="selected"  </c:if>>机关</option>
										<option value="监理部"
											<c:if test="${model.froles}=='监理部'}"> selected="selected"  </c:if>>监理部</option>
									</select>
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="xzCommNews-nb-info_fitop"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.fitop"
										text="是否置顶" /></label>
								<div class="controls">
									<select class="form-control" id="xzCommNews-info_fitop"
										name="fitop" value="${model.fitop}" class=" ">
										<option value="是"
											<c:if test="${model.fitop}=='是'}"> selected="selected"  </c:if>>是</option>
										<option value="否"
											<c:if test="${model.fitop}=='否'}"> selected="selected"  </c:if>>否</option>
									</select>
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommNews-nb-info_ffaburen"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.ffaburen"
										text="发布单位" /></label>
								<div class="controls">
									<select id=xzCommNews-info_ffaburen name="ffaburen"
										class="form-control required" value="${model.ffaburen}">
										<c:forEach items="${deptList}" var="item">
											<option value="${item.id}"
												${item.id==model.ffaburen? 'selected' : ''}>${item.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="xzCommNews-nb-info_ftuijian"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.ftuijian"
										text="是否推荐" /></label>
								<div class="controls">
									<select class="form-control" id="xzCommNews-info_ftuijian"
										name="ftuijian" value="${model.ftuijian}" class=" ">
										<option value="是"
											<c:if test="${model.ftuijian}=='是'}"> selected="selected"  </c:if>>是</option>
										<option value="否"
											<c:if test="${model.ftuijian}=='否'}"> selected="selected"  </c:if>>否</option>
									</select>
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommNews-nb-info_forder"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.forder"
										text="排序" /></label>
								<div class="controls">
									<select class="form-control" id="xzCommNews-info_forder"
										name="forder" value="${model.forder}" class=" ">
										<option value="0"
											<c:if test="${model.ftuijian}=='0'}"> selected="selected"  </c:if>>0-按更新时间排序</option>
										<option value="1"
											<c:if test="${model.ftuijian}=='1'}"> selected="selected"  </c:if>>1</option>
										<option value="2"
											<c:if test="${model.ftuijian}=='2'}"> selected="selected"  </c:if>>2</option>
										<option value="3"
											<c:if test="${model.ftuijian}=='3'}"> selected="selected"  </c:if>>3</option>
										<option value="4"
											<c:if test="${model.ftuijian}=='4'}"> selected="selected"  </c:if>>4</option>
										<option value="5"
											<c:if test="${model.ftuijian}=='5'}"> selected="selected"  </c:if>>5</option>
										<option value="6"
											<c:if test="${model.ftuijian}=='6'}"> selected="selected"  </c:if>>6</option>
										<option value="7"
											<c:if test="${model.ftuijian}=='7'}"> selected="selected"  </c:if>>7</option>
										<option value="8"
											<c:if test="${model.ftuijian}=='8'}"> selected="selected"  </c:if>>8</option>
										<option value="9"
											<c:if test="${model.ftuijian}=='9'}"> selected="selected"  </c:if>>9</option>
									</select>
								</div>
							</div>

							<div class="span5">
								<label class="control-label"
									for="xzCommNews-nb-info_fcreatedate"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.fcreatedate"
										text="发布时间" /></label>
								<div class="controls">
									<div class="input-append datetimepicker date"
										style="padding-left: 0px;">
										<input id="xzCommNews-info_fcreatedate" type="text"
											name="fcreatedate" value="${model.fcreatedate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label"
									for="xzCommNews-nb-info_fupdatedate"><spring:message
										code="xzCommNews-info.xzCommNews-nb-info.input2.fupdatedate"
										text="更新时间" /></label>
								<div class="controls">
									<div class="input-append datetimepicker date"
										style="padding-left: 0px;">
										<input id="xzCommNews-info_fupdatedate" type="text"
											name="fupdatedate" value="${model.fupdatedate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="xzCommNews-nb-info_fnewcontent"><spring:message
									code="xzCommNews-info.xzCommNews-nb-info.input2.fnewcontent"
									text="新闻内容" /></label>
							<div class="controls">
								<textarea id="xzCommNews-nb-info_fnewcontent" name="fnewcontent"
									class="form-control" rows="6" style="width: 560px"
									class="text  required" minlength="" maxlength="4,000">${model.fnewcontent}</textarea>
							</div>
						</div>

						<%-- 	<div class="control-group">
					    <label class="control-label" for="xzCommNews-info_furl"><spring:message code="xzCommNews-info.xzCommNews-info.input.furl" text="url"/></label>
						<div class="controls">
						      	<textarea id="xzCommNews-info_furl"  name="furl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="512">${model.furl}</textarea>
					    </div>
					    </div> --%>

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
