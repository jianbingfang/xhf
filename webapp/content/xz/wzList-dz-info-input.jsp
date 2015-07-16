<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "wzList");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="wzList-info.wzList-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#wzList-infoForm")
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
			})
</script>
</head>
<body>
	<div class="row-fluid">
		<!-- start of main -->
		<section id="m-main" class="span12">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="wzList-info.wzList-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="wzList-infoForm" method="post" name="wzList-infoForm"
						action="wzList-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="wzList-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group hidden">
							<%-- 	<div class="span5">
								<label class="control-label" for="wzList-info_fcode"><spring:message
										code="wzList-info.wzList-info.input.fcode" text="物资编码" /></label>
								<div class="controls">
									<input id="wzList-info_fcode" type="text" name="fcode"
										value="${model.fcode}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div> --%>
							<div class="span5">
								<label class="control-label" for="wzList-info_ftype"><spring:message
										code="wzList-info.wzList-info.input.ftype" text="物品类别" /></label>
								<div class="controls">
									<input id="wzList-info_ftype" type="text" name="ftype"
										value="${ftype}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fname"><spring:message
										code="wzList-info.wzList-info.input.fname" text="名称" /></label>
								<div class="controls">
									<input id="wzList-info_fname" name="fname" type="text"
										class="text  " maxlength="200" value="${model.fname}">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fgg"><spring:message
										code="wzList-info.wzList-info.input.fgg" text="规格" /></label>
								<div class="controls">
									<input id="wzList-info_fgg" type="text" name="fgg"
										value="${model.fgg}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<%-- 		<div class="span5">
								<label class="control-label" for="wzList-info_flyr"><spring:message
										code="wzList-info.wzList-info.input.flyr" text="领用人" /></label>
								<div class="controls">
									<input id="wzList-info_flyr" type="text" name="flyr"
										value="${model.flyr}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div> --%>
							<div class="span5">
								<label class="control-label" for="wzList-info_fnum"><spring:message
										code="wzList-info.wzList-info.input.fnum" text="数量" /></label>
								<div class="controls">
									<input id="wzList-info_fnum" type="text" name="fnum"
										value="${model.fnum}" size="" class="number  required " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fprice"><spring:message
										code="wzList-info.wzList-info.input.fprice" text="单价" /></label>
								<div class="controls">
									<input id="wzList-info_fprice" type="text" name="fprice"
										value="${model.fprice}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<%-- 	<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_flydate"><spring:message
										code="wzList-info.wzList-info.input.flydate" text="领用日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="wzList-info_flydate" type="text" name="flydate"
											value="${model.flydate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fxmid"><spring:message
										code="wzList-info.wzList-info.input.fxmid" text="所在项目" /></label>
								<div class="controls">
									<input id="wzList-info_fxmid" type="text" name="fxmid"
										value="${model.fxmid}" size="" class="number   " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fsystate"><spring:message
										code="wzList-info.wzList-info.input.fsystate" text="使用状态" /></label>
								<div class="controls">
									<select class="form-control" id="wzList-info_fsystate"
										name="fsystate" value="${model.fsystate}" class=" ">
										<option value="在库"
											<c:if test="${model.fsystate}=='在库'}"> selected="selected"  </c:if>>在库</option>
										<option value="在使用"
											<c:if test="${model.fsystate}=='在使用'}"> selected="selected"  </c:if>>在使用</option>
										<option value="已报废"
											<c:if test="${model.fsystate}=='已报废'}"> selected="selected"  </c:if>>已报废</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fxjstate"><spring:message
										code="wzList-info.wzList-info.input.fxjstate" text="新旧程度" /></label>
								<div class="controls">
									<input id="wzList-info_fxjstate" type="text" name="fxjstate"
										value="${model.fxjstate}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
						</div> --%>
						<%-- 
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="wzList-info_fprice"><spring:message code="wzList-info.wzList-info.input.fprice" text="原价"/></label>
						<div class="controls">
							  	 <input id="wzList-info_fprice" type="text" name="fprice" value="${model.fprice}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="wzList-info_fcprice"><spring:message code="wzList-info.wzList-info.input.fcprice" text="净残值"/></label>
						<div class="controls">
							  	 <input id="wzList-info_fcprice" type="text" name="fcprice" value="${model.fcprice}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="wzList-info_fsubprice"><spring:message code="wzList-info.wzList-info.input.fsubprice" text="已折旧金额"/></label>
						<div class="controls">
							  	 <input id="wzList-info_fsubprice" type="text" name="fsubprice" value="${model.fsubprice}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="wzList-info_fyscz"><spring:message code="wzList-info.wzList-info.input.fyscz" text="预设残值"/></label>
						<div class="controls">
							  	 <input id="wzList-info_fyscz" type="text" name="fyscz" value="${model.fyscz}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="wzList-info_fzjtjwcdate"><spring:message code="wzList-info.wzList-info.input.fzjtjwcdate" text="折旧计提完成时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="wzList-info_fzjtjwcdate" type="text" name="fzjtjwcdate" value="${model.fzjtjwcdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="wzList-info_fyzjprice"><spring:message code="wzList-info.wzList-info.input.fyzjprice" text="月折旧金额"/></label>
						<div class="controls">
							  	 <input id="wzList-info_fyzjprice" type="text" name="fyzjprice" value="${model.fyzjprice}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="wzList-info_fzjstate"><spring:message code="wzList-info.wzList-info.input.fzjstate" text="折旧状态"/></label>
						<div class="controls">
						      	<textarea id="wzList-info_fzjstate"  name="fzjstate"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="255">${model.fzjstate}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="wzList-info_fzjrule"><spring:message code="wzList-info.wzList-info.input.fzjrule" text="折旧规则"/></label>
						<div class="controls">
							  	 <input id="wzList-info_fzjrule" type="text" name="fzjrule" value="${model.fzjrule}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="wzList-info_fmemo"><spring:message code="wzList-info.wzList-info.input.fmemo" text="备注"/></label>
						<div class="controls">
						      	<textarea id="wzList-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="wzList-info_fmemo1"><spring:message code="wzList-info.wzList-info.input.fmemo1" text="备注1"/></label>
						<div class="controls">
							  	 <input id="wzList-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="wzList-info_fmemo2"><spring:message code="wzList-info.wzList-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
						      	<textarea id="wzList-info_fmemo2"  name="fmemo2"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo2}</textarea>
					    </div>
					  </div>
		 --%>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fmemo"><spring:message
										code="wzList-info.wzList-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<textarea id="wzList-info_fmemo" name="fmemo"
										class="form-control" rows="6" style="width: 560px"
										class="text  " minlength="" maxlength="500">${model.fmemo}</textarea>
								</div>
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
