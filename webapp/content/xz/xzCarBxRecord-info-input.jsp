<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-cl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/carpicker/carpicker.css">
    <script type="text/javascript" src="${scopePrefix}/s/xthena/carpicker/carpicker.js"></script>
    <title><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.title" text="保险登记 - 车辆管理 - 行政管理"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#xzCarBxRecord-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createcarPicker({
		modalId: 'carPicker',
		url: '${scopePrefix}/xz/xzCar-simple-list.do'
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
	  <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
   <!--   <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
				</li>
				<li>
					车辆管理<span class="divider">/</span>
				</li>
				<li class="active">
					保险登记
				</li>
			</ul>
		</div>
	</div>
</div> -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="xzCarBxRecord-infoForm" method="post" action="xzCarBxRecord-info-save.do" class="form-horizontal">
				 <c:if test="${model != null}">
				  	<input id="xzCarBxRecord-info_id" type="hidden" name="fid" value="${model.fid}">
				 </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_fcarid"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fcarid" text="车牌号"/></label>
					<div class="controls">
						<div class="input-append carPicker">
						  <input id="xzCarBxRecord-info_fcarid" type="hidden" name="fcarid" value="${model.fcarid}">
						  <input id="fcarno" type="text"  value="${fcarno}" style="width: 175px;" value="">
						  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-list"></i></span>
					    </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_fbxtype"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fbxtype" text="保险种类"/></label>
					<div class="controls">
					  	<select class="form-control" id="xzCarBxRecord-info_fbxtype" name="fbxtype" value="${model.fbxtype}" class=" " >
					    	 	<option value="交强险"  <c:if test="${model.fbxtype=='交强险'}"> selected="selected"  </c:if>>交强险</option>
					    	 	<option value="商业险"  <c:if test="${model.fbxtype=='商业险'}"> selected="selected"  </c:if>>商业险</option>
					    	 <%-- 	<option value="车辆损失险"  <c:if test="${model.fbxtype}=='车辆损失险'}"> selected="selected"  </c:if>>车辆损失险</option>
					    	 	<option value="全车盗抢险"  <c:if test="${model.fbxtype}=='全车盗抢险'}"> selected="selected"  </c:if>>全车盗抢险</option>
					    	 	<option value="车上人员责任险"  <c:if test="${model.fbxtype}=='车上人员责任险'}"> selected="selected"  </c:if>>车上人员责任险</option>
					    	 	<option value="划痕险"  <c:if test="${model.fbxtype}=='划痕险'}"> selected="selected"  </c:if>>划痕险</option>
					    	 	<option value="玻璃单独破碎险"  <c:if test="${model.fbxtype}=='玻璃单独破碎险'}"> selected="selected"  </c:if>>玻璃单独破碎险</option>
					    	 	<option value="自燃险"  <c:if test="${model.fbxtype}=='自燃险'}"> selected="selected"  </c:if>>自燃险</option>
					    	 	<option value="指定专修厂"  <c:if test="${model.fbxtype}=='指定专修厂'}"> selected="selected"  </c:if>>指定专修厂</option>
					    	 	<option value="不计免赔"  <c:if test="${model.fbxtype}=='不计免赔'}"> selected="selected"  </c:if>>不计免赔</option> --%>
					 	</select>
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_fmemo2"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fmemo2" text="保险公司"/></label>
					<div class="controls">
					  	<input id="xzCarBxRecord-info_fmemo2" type="text" name="fmemo2" value="${model.fmemo2}" size="" class="text   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_ftbdate"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.ftbdate" text="投保时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="xzCarBxRecord-info_ftbdate" type="text" name="ftbdate" value="${model.ftbdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
			    	<label class="control-label" for="hrLdht-info_fryid"><spring:message code="hrLdht-info.hrLdht-info.input.fryid" text="投保负责人"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
						 <input id="ryBxRecord-info_fryid" type="hidden" name="ftbryid" value="${model.ftbryid}"  style="width: 175px;">
						  <input id="ryBxRecord-info_userName" type="text"  name="ftbry" value="${model.ftbry}"  class=" required"  style="width: 175px;" > 
						  <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
					    </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_fbxmoney"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fbxmoney" text="保险费用"/></label>
					<div class="controls">
					  	<input id="xzCarBxRecord-info_fbxmoney" type="text" name="fbxmoney" value="${model.fbxmoney}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
				  
			    	<%-- <div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_fbxdate"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fbxdate" text="报销时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="xzCarBxRecord-info_fbxdate" type="text" name="fbxdate" value="${model.fbxdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="xzCarBxRecord-info_fmemo"><spring:message code="xzCarBxRecord-info.xzCarBxRecord-info.input.fmemo" text="备注"/></label>
					<div class="controls">
				      	<textarea id="xzCarBxRecord-info_fmemo"  name="fmemo"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="1000">${model.fmemo}</textarea>
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
