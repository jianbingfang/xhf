<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-nytz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jyZhaobFile-info.jyZhaobFile-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>

	<link type="text/css" rel="stylesheet"
	  href="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.css">

	<script type="text/javascript"
			src="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.js">
	</script>


    <script type="text/javascript">




$(function() {
    $("#jyZhaobFile-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });

	createjyxmPicker({
		modalId : 'jyxmPicker',
		url : '${scopePrefix}/sysconf/jyXm-toubiao-simple-list.do',
		<%--redUrl : '${scopePrefix}/sckf/jyXmYj-info-input.do'--%>
	});

	$("#confirmBtn").click(function() {
		getFiles();
	});
});

<%--createjyxmPicker({--%>
	<%--modalId : 'jyxmPicker',--%>
	<%--url : '${scopePrefix}/sckf/jyXm-toubiao-simple-list.do',--%>
	<%--redUrl : '${scopePrefix}/sckf/jyZhaobFile-info-input.do'--%>
<%--});--%>


//var table;
//
//$(function() {
//	table = new Table(config);
//	table.configPagination('.m-pagination');
//	table.configPageInfo('.m-page-info');
//	table.configPageSize('.m-page-size');
//
//
//});



//在页面定义怎么使用 缓存数据
function getFiles() {
	var filesIndex = $('#filesUl').children('li[litype="new"]').length;
	$.each($('.files').children(),
			function(index, node) {
				$('#jyXm-info_ffilename').val($(node).data("fileName")+ "."+ $(node).data("fileType"));
				$('#jyXm-info_ffileurl').val($(node).data("fileUrl"));
			});
	$(".uploadModal").modal('hide');
}

    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
  
	  <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
  <%@include file="../comm/comm-upload.jsp"%>
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jyZhaobFile-info.jyZhaobFile-info.input.title" text="编辑" /></h4>
		</header>


		<div class="content content-inner">

<form id="jyZhaobFile-infoForm" method="post" action="jyZhaobFile-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jyZhaobFile-info_id" type="hidden" name="fid" value="${model.fid}">
	  <input id="jyZhaobFile-info_id" type="hidden" name="fxmid" value="${model.fxmid}">
  </c:if>
  <c:if test="${xm != null}">
	  <input id="jyZhaobFile-info_id" type="hidden" name="fxmid" value="${xm.fid}">
  </c:if>

		<div class="control-group">

			<label  class="control-label" for="jyZhaobFile-info_xmid"><spring:message
					code='jyXmYj-info.jyXmYj-info.list.search.name'
														  text='项目名称'/></label>
				<div class="input-append jyxmPicker">
					<input class="controls" id="jyZhaobFile-info_xmid" type="hidden" name="filter_EQL_fxmid"
						value="${model.fxmid}">

					<input
						id="jyZhaobFile-info_xmmc" type="text"
						value="${xmMap[model.fxmid].fname}" disabled
						class=" required" style="width: 175px;" value="">
					<span
						class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
						class="icon-th-list"></i></span>

					<%--<div class="controls">--%>
						<%--<input  type="text" readonly="readonly" value="${xmMap[model.fxmid].fkbdate}" size=""  >--%>
					<%--</div>--%>

				</div>



			</div>
				  
				   <%--<div class="control-group">--%>
				    <%--<label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="开标时间"/></label>--%>
					<%--<div class="controls">--%>
				      		<%--<input  type="text" readonly="readonly" value="${xm.fkbdate}" size=""  >--%>
				    <%--</div>--%>
				  <%--</div>--%>
				  <%----%>
				  
				   <%--<div class="control-group">--%>
				    <%--<label class="control-label" for="jyXmYj-info_fyijiaostatus"><spring:message code="jyXmYj-info.jyXmYj-info.input.fyijiaostatus" text="中标金额"/></label>--%>
					<%--<div class="controls">--%>
					    	 	<%--<input  type="text" readonly="readonly" value="${xm.fzbmoney}" size=""  >--%>
				    <%--</div>--%>
				  <%--</div>--%>
				  
			    	<div class="control-group">
				    <label class="control-label" for="jyZhaobFile-info_fweizhi"><spring:message code="jyZhaobFile-info.jyZhaobFile-info.input.fweizhi" text="放置位置"/></label>
					<div class="controls">
					  	 <input id="jyZhaobFile-info_fweizhi" type="text" name="fweizhi" value="${model.fweizhi}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
				  
				  	<div class="control-group">
				    <label class="control-label" for="jyZhaobFile-info_fdahno"><spring:message code="jyZhaobFile-info.jyZhaobFile-info.input.fweizhi" text="档案盒编号"/></label>
					<div class="controls">
					  	 <input id="jyZhaobFile-info_fdahno" type="text" name="fdahno" value="${model.fdahno}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
				  
				  	<div class="control-group">
						<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
								code="jlShizhong-info.jlShizhong-info.input.fwarn"
								text="附件" /></label>
						<div class="controls">
							<input id="jyXm-info_ffilename" type="text" name="ffilename"
									value="${model.ffilename}" size="" class="text" 
									minlength="" maxlength="">
									<input id="jyXm-info_ffileurl" type="hidden" name="ffileurl"
									value="${model.ffileurl}" size="" class="text "
									minlength="" maxlength="">
									
							<a type="button" class="btn a-link" href="javascript:void(0)"
										onclick="showUpload()">上传</a>
										
							<%--<a id="jyXm-info_fbmzlDown"  class="btn"  href="${model.ffileurl}"--%>
													<%--target="_blank">下载</a>--%>
						</div>
					</div>
					
					 	<div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn a-submit" ><spring:message code='core.input.save'
																					  text='保存'/></button>
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
