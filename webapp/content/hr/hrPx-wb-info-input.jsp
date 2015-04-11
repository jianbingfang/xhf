<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-hy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
        <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <title><spring:message code="hrPx-info.hrPx-info.input.title" text="外部培训 - 员工培训 - 人力资源"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#hrPx-infoForm").validate({
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
	  <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
<!-- <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="hr-home.do">人力资源</a> <span class="divider">/</span>
				</li>
				<li>
					员工培训<span class="divider">/</span>
				</li>
				<li class="active">
					外部培训
				</li>
			</ul>
		</div>
	</div>
</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrPx-info.hrPx-info.input.title" text="编辑"/></h4>
		</header>

		<div class="content content-inner">

<form id="hrPx-infoForm" method="post" action="hrPx-wb-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="hrPx-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
    	<div class="control-group">
    	<div class="span5">
	    <label class="control-label" for="hrPx-info_fpxzt"><spring:message code="hrPx-info.hrPx-info.input.fpxzt" text="培训主题"/></label>
		<div class="controls">
		  <input id="hrPx-info_fpxzt" type="text" name="fpxzt" value="${model.fpxzt}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="span5">
	    <label class="control-label" for="hrPx-info_fpxdd"><spring:message code="hrPx-info.hrPx-info.input.fpxdd" text="培训地点"/></label>
		<div class="controls">
		  <input id="hrPx-info_fpxdd" type="text" name="fpxdd" value="${model.fpxdd}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
	  </div>
	  
    <div class="control-group">
    	<div class="span5">
	    <label class="control-label" for="hrPx-info_fzzdw"><spring:message code="hrPx-info.hrPx-info.input.fzzdw" text="组织单位"/></label>
		<div class="controls">
		  <input id="hrPx-info_fzzdw" type="text" name="fzzdw" value="${model.fzzdw}" size="" class="text required" minlength="" maxlength="">
	    </div>
	  </div>
    	<div class="span5">
	    <label class="control-label" for="hrPx-info_fzzdw"><spring:message code="hrPx-info.hrPx-info.input.fzzdw" text="培训时间"/></label>
		<div class="controls">
			<div class="input-append datepicker date" style="padding-left: 0px;">
		    	<input id="hrPx-info_fdate" type="text" name="fdate" value="${model.fdate}" size="40" class="text required"   style="background-color:white;cursor:default; width: 175px;">
		 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		 	 </div>
	    </div>
	  </div>
	  </div>
	  

    	<div class="control-group">
	    	<div class="span5">
		    <label class="control-label" for="hrPx-info_fcjrs"><spring:message code="hrPx-info.hrPx-info.input.fcjrs" text="参加人数"/></label>
				<div class="controls">
				  <input id="hrPx-info_fcjrs" type="text" name="fcjrs" value="${model.fcjrs}" size="" class="text required" minlength="" maxlength="">
			    </div>
		  	</div>
		  	<div class="span5">
			    <label class="control-label" for="hrPx-info_ftgrs"><spring:message code="hrPx-info.hrPx-info.input.ftgrs" text="通过人数"/></label>
				<div class="controls">
				  <input id="hrPx-info_ftgrs" type="text" name="ftgrs" value="${model.ftgrs}" size="" class="text " minlength="" maxlength="">
			    </div>
		  </div>
	    </div>
	    
    	<div class="control-group">
	    
	    <div class="span5">
		    <label class="control-label" for="hrPx-info_fpxfs"><spring:message code="hrPx-info.hrPx-info.input.fpxfs" text="培训方式"/></label>
			<div class="controls">
			  	  <select class="form-control" id="hrPx-info_fpxfs" name="fpxfs" value="${model.fpxfs}" class=" required" >
				   <option value="6"  <c:if test="${model.fpxfs=='6'}"> selected="selected"  </c:if>>面授</option>
				   <option  value="7" <c:if  test="${model.fpxfs=='7'}"> selected="selected"  </c:if>>网络</option>
				   <option  value="8" <c:if  test="${model.fpxfs=='8'}"> selected="selected"  </c:if>>其他</option>
				</select>
		    </div>
		  </div>
	    
	    
    	<div class="span5">
	   <label class="control-label" for="hrPx-info_fzlmc"><spring:message code="hrPx-info.hrPx-info.input.fzlmc" text="培训资料"/></label>
		<div class="controls">
		  <input id="hrPx-info_fzlmc" type="text" name="fzlmc" value="${model.fzlmc}" size="" class="text " minlength="" maxlength="">
	    </div>
	  </div>
	  </div>
	  
    	<div class="control-group">
    	<div class="span5">
	 -----
	  </div>
    	<div class="span5">
	    <label class="control-label" for="hrPx-info_ffzr"><spring:message code="hrPx-info.hrPx-info.input.ffzr" text="负责人"/></label>
		<div class="controls">
			<div class="input-append ryPicker">
			 <input id="ryBxRecord-info_fryid" type="hidden" name="ffzr" value="${model.ffzr}">
			  <input id="ryBxRecord-info_userName" type="text"  value="${userName}" disabled class=" required"  style="width: 175px;" value="">
			  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
		    </div>
	    </div>
	  </div>
	  </div>
	  
	  
	  <div class="control-group">
	  <div class="span5">
	    <label class="control-label" for="hrPx-info_fsfks"><spring:message code="hrPx-info.hrPx-info.input.fsfks" text="是否考试"/></label>
		<div class="controls">
		     <select class="form-control" id="hrPx-info_fsfks" name="fsfks" value="${model.fsfks}" class=" required" >
			   <option value="0"  <c:if test="${model.fsfks=='0'}"> selected="selected"  </c:if>>否</option>
			   <option  value="1" <c:if  test="${model.fsfks=='1'}"> selected="selected"  </c:if>>是</option>
			</select>
	    </div>
	    </div>
	   
	   	<div class="span5">
	    <label class="control-label" for="hrPx-info_fksfs"><spring:message code="hrPx-info.hrPx-info.input.fksfs" text="考试方式"/></label>
		<div class="controls">
		  <input id="hrPx-info_fksfs" type="text" name="fksfs" value="${model.fksfs}" size="" class="text " minlength="" maxlength="">
	    </div>
	  </div>
	   </div>
	   
	    <div class="control-group">
	    	<div class="span5">
	    <label class="control-label" for="hrPx-info_fzjlq"><spring:message code="hrPx-info.hrPx-info.input.fzjlq" text="证件领取情况"/></label>
		<div class="controls">
		    <select class="form-control" id="hrPx-info_fzjlq" name="fzjlq" value="${model.fzjlq}" class=" " >
		   	 <option value=""  <c:if test="${model.fzjlq==''}"> selected="selected"  </c:if>></option>
			   <option value="0"  <c:if test="${model.fzjlq=='0'}"> selected="selected"  </c:if>>未领取</option>
			   <option  value="1" <c:if  test="${model.fzjlq=='1'}"> selected="selected"  </c:if>>已领取</option>
			</select>
		  
	    </div>
	  </div>
    	<div class="span5">
	    <label class="control-label" for="hrPx-info_ffplq"><spring:message code="hrPx-info.hrPx-info.input.ffplq" text="发票领取情况"/></label>
		<div class="controls">
		 <select class="form-control" id="hrPx-info_ffplq" name="ffplq" value="${model.ffplq}" class=" " >
		    	 <option value=""  <c:if test="${model.ffplq==''}"> selected="selected"  </c:if>></option>
			   <option value="0"  <c:if test="${model.ffplq=='0'}"> selected="selected"  </c:if>>未领取</option>
			   <option  value="1" <c:if  test="${model.ffplq=='1'}"> selected="selected"  </c:if>>已领取</option>
			</select>
	    </div>
	  </div> 
	  </div>
	   
	  
    	<div class="control-group">
	    <label class="control-label" for="hrPx-info_fpxnrzy"><spring:message code="hrPx-info.hrPx-info.input.fpxnrzy" text="培训内容摘要"/></label>
		<div class="controls">
		  <textarea id="hrPx-info_fpxnrzy"  name="fpxnrzy"  class="form-control" rows="6"  style="width: 560px" class="text "  minlength="20" maxlength="500">${model.fpxnrzy}</textarea>
	    </div>
	  </div>
    	<div class="control-group">
	    <label class="control-label" for="hrPx-info_fksjg"><spring:message code="hrPx-info.hrPx-info.input.fksjg" text="考试结果总结"/></label>
		<div class="controls">
			  <textarea id="hrPx-info_fksjg"  name="fksjg"  class="form-control" rows="6" style="width: 560px" class="text "  minlength="20" maxlength="500">${model.fksjg}</textarea>
	    </div>
	  </div>
    	
 	<div class="control-group">
    <div class="controls">
      <button type="submit" class="btn a-submit"><spring:message code='core.input.wbsave' text='保存'/></button>
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
