<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xx");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyBm-info.jyBm-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jyBm-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
})
    </script>
  </head>
  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jyBm-info.jyBm-info.input.title" text="招标信息登记" /></h4>
		</header>
	<form id="jyBm-infoForm" method="post" action="jyBm-info-save.do" class="form-horizontal">
	  <c:if test="${model != null}">
		  <input id="jyBm-info_id" type="hidden" name="fid" value="${model.fid}">
	  </c:if>
			<div class="content content-inner">
						<div class="control-group">
						 	<div class="span5">
						    <label class="control-label" for="jyBm-info_ftype"><spring:message code="jyBm-info.jyBm-info.input.ftype" text="工程类别"/></label>
							<div class="controls">
								  	 <input id="jyBm-info_ftype" type="text" name="ftype" value="${model.ftype}" size="" class="text " minlength="" maxlength="">	
						    </div>
						  </div>
						<div class="span5">
					    <label class="control-label" for="jyBm-info_fname"><spring:message code="jyBm-info.jyBm-info.input.fname" text="工程名称"/></label>
						<div class="controls">
							  	 <input id="jyBm-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    <div class="span5">
					    <label class="control-label" for="jyBm-info_fjsdwtel"><spring:message code="jyBm-info.jyBm-info.input.fjsdwtel" text="建设单位"/></label>
						<div class="controls">
							  	 <input id="jyBm-info_fjsdw" type="text" name="fjsdw" value="${model.fjsdw}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
					    </div>
					    <div class="control-group">
					<%-- 	<div class="span5">
					    <label class="control-label" for="jyBm-info_fjsdwtel"><spring:message code="jyBm-info.jyBm-info.input.fjsdwtel" text="建设单位联系电话"/></label>
						<div class="controls">
							  	 <input id="jyBm-info_fjsdwtel" type="text" name="fjsdwtel" value="${model.fjsdwtel}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div> --%>
	  
						<div class="span5">
					    <label class="control-label" for="jyBm-info_fzbdlgs"><spring:message code="jyBm-info.jyBm-info.input.fzbdlgs" text="招标代理"/></label>
						<div class="controls">
							  	<input id="jyBm-info_fzbdlgs" type="text" name="fzbdlgs" value="${model.fzbdlgs}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    
					    	<div class="span5">
					    <label class="control-label" for="jyBm-info_fzzyq"><spring:message code="jyBm-info.jyBm-info.input.fzzyq" text="资质要求"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jyBm-info_fzzyq" name="fzzyq" value="${model.fzzyq}" class=" " >
							    	 	<option value="综合资质"  <c:if test="${model.fzzyq}=='综合资质'}"> selected="selected"  </c:if>>综合资质</option>
							    	 	<option value="甲级资质"  <c:if test="${model.fzzyq}=='甲级资质'}"> selected="selected"  </c:if>>甲级资质</option>
							    	 	<option value="乙级资质"  <c:if test="${model.fzzyq}=='乙级资质'}"> selected="selected"  </c:if>>乙级资质</option>
							 	</select>
					    </div>
					    </div>
					    </div>
					   <div class="control-group">
									<div class="span5">
					    <label class="control-label" for="jyBm-info_fbmdate"><spring:message code="jyBm-info.jyBm-info.input.fbmdate" text="报名开始时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jyBm-info_fbmdate" type="text" name="fbmdate" value="${model.fbmdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
	  
						<div class="span5">
					    <label class="control-label" for="jyBm-info_fbmjzdate"><spring:message code="jyBm-info.jyBm-info.input.fbmjzdate" text="报名截止时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jyBm-info_fbmjzdate" type="text" name="fbmjzdate" value="${model.fbmjzdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
					  </div>
					  
					  <div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBm-info_fprovince"><spring:message code="jyBm-info.jyBm-info.input.fprovince" text="建设区域"/></label>
						<div class="controls">
							  	<input id="jyBm-info_fprovince" type="text" name="fprovince" value="${model.fprovince}" style="width:80px;" size="" class="number   " minlength="" maxlength="">省
							  	<input id="jyBm-info_fcity" type="text" name="fcity" value="${model.fcity}"  style="width:80px;" size="" class="number   " minlength="" maxlength="">市
					    </div>
					    </div>
	  					
	  					<div class="span5">
					    <label class="control-label" for="jyBm-info_fxmlevel"><spring:message code="jyBm-info.jyBm-info.input.fxmlevel" text="项目级别"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="jyBm-info_fxmlevel" name="fxmlevel" value="${model.fxmlevel}" class=" " >
							    	 	<option value="特级"  <c:if test="${model.fxmlevel}=='特级'}"> selected="selected"  </c:if>>特级</option>
							    	 	<option value="一级"  <c:if test="${model.fxmlevel}=='一级'}"> selected="selected"  </c:if>>一级</option>
							    	 	<option value="二级"  <c:if test="${model.fxmlevel}=='二级'}"> selected="selected"  </c:if>>二级</option>
							    	 	<option value="三级"  <c:if test="${model.fxmlevel}=='三级'}"> selected="selected"  </c:if>>三级</option>
							 	</select>
					    </div>
					    </div>
						</div>
	  
					  <div class="control-group">
	  					<div class="span5">
					    <label class="control-label" for="jyBm-info_ftze"><spring:message code="jyBm-info.jyBm-info.input.ftze" text="投资额(万元)"/></label>
						<div class="controls">
							  	<input id="jyBm-info_ftze" type="text" name="ftze" value="${model.ftze}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
						<div class="span5">
					    <label class="control-label" for="jyBm-info_fscale"><spring:message code="jyBm-info.jyBm-info.input.fscale" text="项目规模"/></label>
						<div class="controls">
							  	 <input id="jyBm-info_fscale" type="text" name="fscale" value="${model.fscale}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
					    
					   <div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBm-info_fsfdbxm"><spring:message code="jyBm-info.jyBm-info.input.fsfdbxm" text="是否大办项目"/></label>
						<div class="controls">
							  	<input id="jyBm-info_fsfdbxm" type="text" name="fsfdbxm" value="${model.fsfdbxm}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    <div class="span5">
					    <label class="control-label" for="jyBm-info_fggurl"><spring:message code="jyBm-info.jyBm-info.input.fggurl" text="招标公告URL"/></label>
						<div class="controls">
								<input id="jyBm-info_fggurl" type="text" name="fggurl" value="${model.fggurl}" size="" class="text   " minlength="" maxlength="">
					    </div>
					  </div>
				   </div>
				   </div>
				   <div class="form-horizontal">
				<header class="header">
				  <h4 class="title"><spring:message code="jyBm-info.jyBm-info.input.title" text="报名登记" /></h4>
				</header>
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jyBm-info_fpsstatus"><spring:message code="jyBm-info.jyBm-info.input.fpsstatus" text="评审状态"/></label>
						<div class="controls">
							  	 <input id="jyBm-info_fpsstatus" type="text" name="fpsstatus" value="${model.fpsstatus}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
						</div>
					 	<div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
						  &nbsp;
					      <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
					  </div>
		</form>
		  </article> 
      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
