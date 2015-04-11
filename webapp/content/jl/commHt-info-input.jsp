<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-xcgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="commHt-info.commHt-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#commHt-infoForm").validate({
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

    <div class="row-fluid">

	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="commHt-info.commHt-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="commHt-infoForm" method="post" action="jl-commHt-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="commHt-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
	  
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fpaytype"><spring:message code="commHt-info.commHt-info.input.fpaytype" text="付款方式"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fpaytype" type="text" name="fpaytype" value="${model.fpaytype}" size="" class="text ">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fadrr"><spring:message code="commHt-info.commHt-info.input.fadrr" text="工程地点"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fadrr" type="text" name="fadrr" value="${model.fadrr}" size="" class="text ">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fscale"><spring:message code="commHt-info.commHt-info.input.fscale" text="工程规模"/></label>
						<div class="controls">
							 <input id="commHt-info_fprojecttype" type="text" name="fscale" value="${model.fscale}" size="" class="text ">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fprojecttype"><spring:message code="commHt-info.commHt-info.input.fprojecttype" text="工程类别"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fprojecttype" type="text" name="fprojecttype" value="${model.fprojecttype}" size="" class="text ">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fprojectname"><spring:message code="commHt-info.commHt-info.input.fprojectname" text="工程名称"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fprojectname" type="text" name="fprojectname" value="${model.fprojectname}" size="" class="text ">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_ftotalMoney"><spring:message code="commHt-info.commHt-info.input.ftotalMoney" text="工程总投资"/></label>
						<div class="controls">
							  	 <input id="commHt-info_ftotalMoney" type="text" name="ftotalMoney" value="${model.ftotalMoney}" size="" class="text ">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fhetongno"><spring:message code="commHt-info.commHt-info.input.fhetongno" text="合同编号"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fhetongno" type="text" name="fhetongno" value="${model.fhetongno}" size="" class="text ">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fstartdate"><spring:message code="commHt-info.commHt-info.input.fstartdate" text="合同开工时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="commHt-info_fstartdate" type="text" name="fstartdate" value="${model.fstartdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fenddate"><spring:message code="commHt-info.commHt-info.input.fenddate" text="合同竣工时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="commHt-info_fenddate" type="text" name="fenddate" value="${model.fenddate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fgettype"><spring:message code="commHt-info.commHt-info.input.fgettype" text="获取方式"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="commHt-info_fgettype" name="fgettype" value="${model.fgettype}" class=" " >
							    	 	<option value="公开投标"  <c:if test="${model.fgettype}=='公开投标'}"> selected="selected"  </c:if>>公开投标</option>
							    	 	<option value="直接签订"  <c:if test="${model.fgettype}=='直接签订'}"> selected="selected"  </c:if>>直接签订</option>
							    	 	<option value="竞争性谈判"  <c:if test="${model.fgettype}=='竞争性谈判'}"> selected="selected"  </c:if>>竞争性谈判</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fjiafang"><spring:message code="commHt-info.commHt-info.input.fjiafang" text="甲方签约单位"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fjiafang" type="text" name="fjiafang" value="${model.fjiafang}" size="" class="text ">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fjianlifei"><spring:message code="commHt-info.commHt-info.input.fjianlifei" text="监理费(万元)"/></label>
						<div class="controls">
						      	 <input id="commHt-info_fjiafang" type="text" name="fjianlifei" value="${model.fmemo1}" size="" class="text ">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fjianlifeilv"><spring:message code="commHt-info.commHt-info.input.fjianlifeilv" text="监理费率"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fjianlifeilv" type="text" name="fjianlifeilv" value="${model.fjianlifeilv}" size="" class="text ">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fhetongqi"><spring:message code="commHt-info.commHt-info.input.fhetongqi" text="监理合同期"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fhetongqi" type="text" name="fhetongqi" value="${model.fhetongqi}" size="" class="text ">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fguimo"><spring:message code="commHt-info.commHt-info.input.fguimo" text="建筑规模(m2)"/></label>
						<div class="controls">
						      	<input id="commHt-info_fhetongqi" type="text" name="fguimo" value="${model.fguimo}" size="" class="text ">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fqicaoren"><spring:message code="commHt-info.commHt-info.input.fqicaoren" text="起草人"/></label>
						<div class="controls">
							  	<input id="commHt-info_fqicaoren" type="text" name="fqicaoren" value="${model.fqicaoren}" size="" class="number   ">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fqicaodate"><spring:message code="commHt-info.commHt-info.input.fqicaodate" text="起草时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="commHt-info_fqicaodate" type="text" name="fqicaodate" value="${model.fqicaodate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fqiandingren"><spring:message code="commHt-info.commHt-info.input.fqiandingren" text="签订人"/></label>
						<div class="controls">
							  	<input id="commHt-info_fqiandingren" type="text" name="fqiandingren" value="${model.fqiandingren}" size="" class="number   ">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fqiandingdate"><spring:message code="commHt-info.commHt-info.input.fqiandingdate" text="签订时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="commHt-info_fqiandingdate" type="text" name="fqiandingdate" value="${model.fqiandingdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fqiandingstatus"><spring:message code="commHt-info.commHt-info.input.fqiandingstatus" text="签订状态"/></label>
						<div class="controls">
						      	 	 <select class="form-control" id="commHt-info_fqiandingstatus" name="fqiandingstatus" value="${model.fqiandingstatus}" class=" " >
							    	 	<option value="未起草"  <c:if test="${model.fqiandingstatus}=='未起草'}"> selected="selected"  </c:if>>未起草</option>
							    	 	<option value="已经起草"  <c:if test="${model.fqiandingstatus}=='已经起草'}"> selected="selected"  </c:if>>已经起草</option>
							    	 	<option value="合同谈判"  <c:if test="${model.fqiandingstatus}=='合同谈判'}"> selected="selected"  </c:if>>合同谈判</option>
							    	 	<option value="会签通过"  <c:if test="${model.fqiandingstatus}=='会签通过'}"> selected="selected"  </c:if>>会签通过</option>
							    	 	<option value="业主签章"  <c:if test="${model.fqiandingstatus}=='业主签章'}"> selected="selected"  </c:if>>业主签章</option>
							    	 	<option value="返还归档"  <c:if test="${model.fqiandingstatus}=='返还归档'}"> selected="selected"  </c:if>>返还归档</option>
							 	</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fprovince"><spring:message code="commHt-info.commHt-info.input.fprovince" text="所属省份"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fprovince" type="text" name="fprovince" value="${model.fprovince}" size="" class="text ">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fcity"><spring:message code="commHt-info.commHt-info.input.fcity" text="所属城市"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fcity" type="text" name="fcity" value="${model.fcity}" size="" class="text ">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_ftanpanren"><spring:message code="commHt-info.commHt-info.input.ftanpanren" text="谈判人"/></label>
						<div class="controls">
							  	<input id="commHt-info_ftanpanren" type="text" name="ftanpanren" value="${model.ftanpanren}" size="" class="number   ">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_ftouzie"><spring:message code="commHt-info.commHt-info.input.ftouzie" text="投资额（万元）"/></label>
						<div class="controls">
							 <input id="commHt-info_fyezhuhetongno" type="text" name="ftouzie" value="${model.ftouzie}" size="" class="text ">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fywtype"><spring:message code="commHt-info.commHt-info.input.fywtype" text="业务类型"/></label>
						<div class="controls">
						      	 <select class="form-control" id="commHt-info_fywtype" name="fywtype" value="${model.fywtype}" class=" " >
							    	 	<option value="工程管理"  <c:if test="${model.fywtype}=='工程管理'}"> selected="selected"  </c:if>>工程管理</option>
							    	 	<option value="项目管理"  <c:if test="${model.fywtype}=='项目管理'}"> selected="selected"  </c:if>>项目管理</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fyezhuhetongno"><spring:message code="commHt-info.commHt-info.input.fyezhuhetongno" text="业主合同编号"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fyezhuhetongno" type="text" name="fyezhuhetongno" value="${model.fyezhuhetongno}" size="" class="text ">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fyezhuname"><spring:message code="commHt-info.commHt-info.input.fyezhuname" text="业主名称"/></label>
						<div class="controls">
							  	 <input id="commHt-info_fyezhuname" type="text" name="fyezhuname" value="${model.fyezhuname}" size="" class="text ">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fyifang"><spring:message code="commHt-info.commHt-info.input.fyifang" text="乙方签约单位"/></label>
						<div class="controls">
							  	<input id="commHt-info_fyifang" type="text" name="fyifang" value="${model.fyifang}" size="" class="number   ">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commHt-info_fzhubanren"><spring:message code="commHt-info.commHt-info.input.fzhubanren" text="主办人"/></label>
						<div class="controls">
							  	<input id="commHt-info_fzhubanren" type="text" name="fzhubanren" value="${model.fzhubanren}" size="" class="number   ">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commHt-info_fzongjian"><spring:message code="commHt-info.commHt-info.input.fzongjian" text="总监"/></label>
						<div class="controls">
							  	<input id="commHt-info_fzongjian" type="text" name="fzongjian" value="${model.fzongjian}" size="" class="number   ">
					    </div>
					    </div>
					    </div>
	  
		
					 	<div class="control-group">
					    <div class="controls">
					      <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
		</form>
        </div>
      </article>

	  <!-- end of main -->
	</div>

  </body>

</html>
