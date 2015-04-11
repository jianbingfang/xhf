<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xmtb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jyBmRecord-info.list.title" text="报名登记 - 项目投标 - 市场开发" /></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
var config = {
    id: '${lowerName}-infoGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_name': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jyBmRecord-infoGridForm',
	exportUrl: 'jyBmRecord-info-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});
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
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jyXm-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jyXm-infoSearch" class="content content-inner">

		  <form name="jyXm-infoForm" method="post" action="jyXm-info-list.do" class="form-inline">
		    <label for="jyXm-info_fname"><spring:message code='jyXm-info.jyXm-info.list.search.fname' text='工程名称'/>:</label>
		    <input type="text" id="jyXm-info_fname" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}" style="width: 100px">
		     <label for="jyXm-info_ftype"><spring:message code='jyXm-info.jyXm-info.list.search.ftype' text='工程类别'/>:</label>
		   	    <select class="form-control" id="jyXm-info_ftype" name="fstatus" value="${model.ftype}" class=" required"  style="width: 100px">
													<option value="1"
														<c:if test="${model.fstatus==1}"> selected="selected" </c:if>>房建</option>
													<option value="2"
														<c:if test="${model.fstatus==2}"> selected="selected"  </c:if>>市政</option>
													<option value="3"
														<c:if test="${model.fstatus==3}"> selected="selected"  </c:if>>道路</option>
													<option value="4"
														<c:if test="${model.fstatus==4}"> selected="selected"  </c:if>>桥梁</option>
													<option value="5"
														<c:if test="${model.fstatus==5}"> selected="selected"  </c:if>>景观绿化</option>
													<option value="6"
														<c:if test="${model.fstatus==6}"> selected="selected"  </c:if>>工业厂房</option>
													<option value="7"
														<c:if test="${model.fstatus==7}"> selected="selected"  </c:if>>电力</option>
													<option value="8"
														<c:if test="${model.fstatus==8}"> selected="selected"  </c:if>>人防</option>
													<option value="9"
														<c:if test="${model.fstatus==9}"> selected="selected"  </c:if>>地铁</option>
													<option value="10"
														<c:if test="${model.fstatus==10}"> selected="selected"  </c:if>>隧道</option>
													<option value="11"
														<c:if test="${model.fstatus==11}"> selected="selected"  </c:if>>公路</option>
													<option value="12"  
														<c:if test="${model.fstatus==12}"> selected="selected"  </c:if>>水利</option>
												</select>
		     <label for="jyXm-info_fstate"><spring:message code='jyXm-info.jyXm-info.list.search.fstate' text='工程状态'/>:</label>
		    <select class="form-control" id="jyXm-info_fstate" name="fstate" value="${model.fstate}" class=" required"  style="width: 100px">
		      <option value="1" <c:if test="${model.fstate==1}"> selected="selected"  </c:if>>信息登记</option>
				<option value="2" <c:if test="${model.fstate==2}"> selected="selected"  </c:if>>报名登记</option>
				<option value="3" <c:if test="${model.fstate==3}"> selected="selected"  </c:if>>资格预审及备案</option>
				<option value="4" <c:if test="${model.fstate==4}"> selected="selected"  </c:if>>招标文件登记</option>
				<option value="5" <c:if test="${model.fstate==5}"> selected="selected"  </c:if>>投标文件登记</option>
				<option value="6" <c:if test="${model.fstate==6}"> selected="selected"  </c:if>>投标文件评审</option>
				<option value="7" <c:if test="${model.fstate==7}"> selected="selected"  </c:if>>开标登记</option>
				<option value="7" <c:if test="${model.fstate==7}"> selected="selected"  </c:if>>转换成项目</option>
		     </select>
		     <label class="control-label"
												for="jyXm-info.jyXm-info.input.fcity"><spring:message
													code="jyBm-info.jyBm-info.input.fprovince" text="所属城市" /></label>
												<select id="jyXm-info_fprovince" type="text"
													name="fprovince" value="${model.fprovince}"
													style="width:100px;"></select>省 <select
													id="jyXm-info_fcity" type="text" name="fcity"
													value="${model.fcity}" style="width:100px;"></select>市
			<button class="btn btn-small a-search" onclick="document.jyXm-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jyBmRecord-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jyBmRecord-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jyBmRecord-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
		  <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>
		</div>

		<div class="pull-right">
		  每页显示
		  <select class="m-page-size">
		    <option value="10">10</option>
		    <option value="20">20</option>
		    <option value="50">50</option>
		  </select>
		  条
		</div>

	    <div class="m-clear"></div>
	  </article>

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jyBmRecord-info.jyBmRecord-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jyBmRecord-infoGridForm" name="jyBmRecord-infoGridForm" method='post' action="jyBmRecord-info-remove.do" class="m-form-blank">
  <table id="jyBmRecord-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
           <th class="sorting" name="fname">工程名称</th>
        	<th class="sorting" name="fweituoren">委托人</th>
        	<th class="sorting" name="fzhubanren">主办人</th>
        	<th class="sorting" name="fbaomingren">报名总监</th>
        	<th class="sorting" name="fisbeian">备案情况</th>
        	<th class="sorting" name="fiszigeyushen">资格预审情况</th>
        	<th class="sorting" name="fiszhaobiaowenj">购买招标文件情况</th>
        	<th class="sorting" name="fzhaobiaowenjiandate">招标文件购买时间</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fweituoren}</td>
      	 	 <td>${item.fzhubanren}</td>
      	 	 <td>${item.fname}</td>
      	 	 <td>${item.fbaomingren}</td>
      	 	 <td>${item.fisbeian}-${item.fbeiandate}-${item.fbeianstatus}</td>
      	 	 <td>${item.fiszigeyushen}-${item.fyushendate}-${item.fyushenstatus}</td>
      	 	 <td>${item.fiszhaobiaowenj}-${item.fzhaobiaowenjiandate}</td>
      	 	 <td>${item.fbmid}</td>
        <td>
          <a href="jyBmRecord-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>
        </div>
      </article>

	  <article>
	    <div class="m-page-info pull-left">
		  共100条记录 显示1到10条记录
		</div>

		<div class="btn-group m-pagination pull-right">
		  <button class="btn btn-small">&lt;</button>
		  <button class="btn btn-small">1</button>
		  <button class="btn btn-small">&gt;</button>
		</div>

	    <div class="m-clear"></div>
      </article>

      <div class="m-spacer"></div>

      </section>
	  <!-- end of yyyy  main -->
	</div>

  </body>

</html>
