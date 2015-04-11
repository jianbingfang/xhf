<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "pjNy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjNy-info.pjNy-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#pjNy-infoForm").validate({
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
		  <h4 class="title"><spring:message code="pjNy-info.pjNy-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjNy-infoForm" method="post" action="pjNy-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjNy-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fxmid"><spring:message code="pjNy-info.pjNy-info.input.fxmid" text="项目id"/></label>
					<div class="controls">
					  	<input id="pjNy-info_fxmid" type="text" name="fxmid" value="${model.fxmid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fyijiaorenid"><spring:message code="pjNy-info.pjNy-info.input.fyijiaorenid" text="移交人id"/></label>
					<div class="controls">
					  	<input id="pjNy-info_fyijiaorenid" type="text" name="fyijiaorenid" value="${model.fyijiaorenid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fyijiaodate"><spring:message code="pjNy-info.pjNy-info.input.fyijiaodate" text="移交时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjNy-info_fyijiaodate" type="text" name="fyijiaodate" value="${model.fyijiaodate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fjieshourenid"><spring:message code="pjNy-info.pjNy-info.input.fjieshourenid" text="接收人id"/></label>
					<div class="controls">
					  	<input id="pjNy-info_fjieshourenid" type="text" name="fjieshourenid" value="${model.fjieshourenid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fyjdname"><spring:message code="pjNy-info.pjNy-info.input.fyjdname" text="移交单名称"/></label>
					<div class="controls">
					  	 <input id="pjNy-info_fyjdname" type="text" name="fyjdname" value="${model.fyjdname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fyjdurl"><spring:message code="pjNy-info.pjNy-info.input.fyjdurl" text="移交单URL"/></label>
					<div class="controls">
					  	 <input id="pjNy-info_fyjdurl" type="text" name="fyjdurl" value="${model.fyjdurl}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fyijioaren"><spring:message code="pjNy-info.pjNy-info.input.fyijioaren" text="移交人"/></label>
					<div class="controls">
					  	 <input id="pjNy-info_fyijioaren" type="text" name="fyijioaren" value="${model.fyijioaren}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjNy-info_fjieshouren"><spring:message code="pjNy-info.pjNy-info.input.fjieshouren" text="接收人"/></label>
					<div class="controls">
					  	 <input id="pjNy-info_fjieshouren" type="text" name="fjieshouren" value="${model.fjieshouren}" size="" class="text " minlength="" maxlength="">	
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

	  <!-- end of main -->
	</div>

  </body>

</html>
