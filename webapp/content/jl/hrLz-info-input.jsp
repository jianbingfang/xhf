<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-ry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
        <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <title><spring:message code="jl-hrLz-info.jl-hrLz-info.input.title" text="离职申请"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jl-hrLz-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createryPicker({
		modalId: 'ryPicker',
		url: '${scopePrefix}/hr/commRy-simple-list.do'
	});
})
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
<!-- <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="jl-home.do">监理部</a> <span class="divider">/</span>
				</li>
				<li>
					监理部人员管理<span class="divider">/</span>
				</li>
				<li class="active">
					离职申请
				</li>
			</ul>
		</div>
	</div>
</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">

<form id="jl-hrLz-infoForm" method="post" action="jl-hrLz-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jl-hrLz-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
    	<div class="control-group">
    	<div class="span5">
    	 <label class="control-label" for="hrLdht-info_fryid"><spring:message code="hrLdht-info.hrLdht-info.input.fryid" text="申请人"/></label>
		<div class="controls">
			<div class="input-append ryPicker">
			 <input id="ryBxRecord-info_fryid" type="hidden" name="fry" value="${model.fry}">
			  <input id="ryBxRecord-info_userName" type="text"  value="${userName}" disabled="disabled" style="width: 175px;" value="">
			  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
		    </div>
	    </div>
	  </div>
    	<div class="span5">
	    <label class="control-label" for="jl-hrLz-info_fstartdate"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.fstartdate" text="申请时间"/></label>
		<div class="controls">
		<div class="input-append datepicker date" style="padding-left: 0px;">
		    	<input id="jl-hrLz-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text required"   style="background-color:white;cursor:default; width: 175px;">
		 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div>
	    </div>
	  </div>
	  </div>
	  	<div class="control-group">
	  	<div class="span5">
	    <label class="control-label" for="jl-hrLz-info_fspstatus"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.fspstatus" text="离职审批状态"/></label>
		<div class="controls">
		 		<select class="form-control" id="jl-hrLz-info_fspstatus"  name="fspstatus" value="${model.fspstatus}" class=" " >
				   <option value="0"  disabled="disabled"  <c:if test="${model.fspstatus=='0'}"> selected="selected"  </c:if>>未审批</option>
				   <option  value="1"  <c:if  test="${model.fspstatus=='1'}"> selected="selected"  </c:if>>已审批</option>
				   
				</select>
	    </div>
	  </div>
<%--     	<div class="span5">
	    <label class="control-label" for="jl-hrLz-info_fsbstatus"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.fsbstatus" text="停保状态"/></label>
		<div class="controls">
	   	  	<select class="form-control" id="jl-hrLz-info_fsbstatus" name="fsbstatus" value="${model.fsbstatus}" class=" " >
				   <option value="0"  <c:if test="${model.fsbstatus=='0'}"> selected="selected"  </c:if>>未停保</option>
				   <option  value="1" <c:if  test="${model.fsbstatus=='1'}"> selected="selected"  </c:if>>已停保</option>
			</select>	
	    </div>
	  </div> --%>
	  </div>
    	<%-- <div class="control-group">
	    <label class="control-label" for="jl-hrLz-info_fywstatus"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.fywstatus" text="意外险停办状态"/></label>
		<div class="controls">
	    	<select class="form-control" id="jl-hrLz-info_fywstatus" name="fywstatus" value="${model.fywstatus}" class=" " >
				   <option value="0"  <c:if test="${model.fywstatus=='0'}"> selected="selected"  </c:if>>未停险</option>
				   <option  value="1" <c:if  test="${model.fywstatus=='1'}"> selected="selected"  </c:if>>已停险</option>
			</select>	
	    </div>
	  </div> --%>
    	<div class="control-group">
	    <label class="control-label" for="jl-hrLz-info_freason"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.freason" text="辞职原因"/></label>
		<div class="controls">
			<textarea id="jl-hrLz-info_freason" name="freason" class="form-control text required" rows="6"
					  style="width: 560px" minlength="0" maxlength="500">${model.freason}</textarea>
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="jl-hrLz-info_fczbg"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.fczbg" text="辞职报告"/></label>
		<div class="controls">
			<textarea id="jl-hrLz-info_fczbg" name="fczbg" class="form-control text required" rows="6"
					  style="width: 560px" minlength="0" maxlength="500">${model.fczbg}</textarea>
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="jl-hrLz-info_fjy"><spring:message code="jl-hrLz-info.jl-hrLz-info.input.fjy" text="对公司建议"/></label>
		<div class="controls">
			<textarea id="jl-hrLz-info_fjy" name="fjy" class="form-control text required" rows="6" style="width: 560px"
					  minlength="0" maxlength="500">${model.fjy}</textarea>
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
