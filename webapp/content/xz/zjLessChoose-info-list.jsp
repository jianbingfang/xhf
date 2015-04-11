<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xzZjDxlist");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.xzZjDxlist-info.list.title" text="列表" /></title>
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
        'filter_LIKES_fname': '${param.filter_LIKES_fname}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzZjDxlist-infoGridForm',
	exportUrl: 'xzZjDxlist-info-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});


function selectItem(){
	var selected=$(".selectedItem:checked");
	for(var i=0;i<selected.length;i++){
		var row=$(selected[i]).parent().parent().parent().parent();
		
		/*  <td filed="zjid" hidden="hidden">${item[0].fid}</td>
  	 	 <td filed="fstate" hidden="hidden">${item[0].fstate}</td>
  	 	  <td filed="lastupdate" hidden="hidden">${item[0].fupdatetime}</td>
  	 	 <td filed="forderstatus" hidden="hidden">${item[1]}</td>
  	 	  */
		var fid=$(row).children('[filed="zjid"]').html();
		var ftype=$(row).children('[filed="ftype"]').html();
		var forderstatus=$(row).children('[filed="forderstatus"]').html();
		var lastupdate=	$(row).children('[filed="lastupdate"]').html();
		var fzjinfo=$(row).children('[filed="fzjinfo"]').html();
		var fstatus=$(row).children('[filed="fstate"]').html();
		
		var selectObj={
				fid:fid,
				ftype:ftype,
				forderstatus:forderstatus,
				lastupdate:lastupdate,
				fzjinfo:fzjinfo,
				fstatus:fstatus
		};
		if(forderstatus==1){
			alert("证件："+fzjinfo+"  已有订单。无法选择。");
			continue;
		}
		var typeName="";
		if(ftype==1){
			typeName='公司证件';
		}else if(ftype==2){
			typeName='人员证件';
		}else if(ftype==3){
			typeName='获奖证书';
		}else if(ftype==4){
			typeName='合同';
		}else if(ftype==5){
			typeName='中标通知书';
		}else if(ftype==6){
			typeName='竣工验收报告';
		}
		
		 var trHtml='<tr> <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value=""></td>'+
			'<td filed="zjid" hidden="hidden">'+fid+'</td>'+
   	    	'<td filed="zjtype" hidden="hidden">'+ftype+'</td>'+
   	    	'<td filed="updatetime" hidden="hidden">'+lastupdate+'</td>'+
		 	'<td>'+typeName+'</td> <td>'+fzjinfo+'</td> <td>';
			if(fstatus==1){
	     		//+data[i].fstatus
	     		trHtml+="<font color='grenn'>在库</font>";	
	     	}else{
	     		trHtml+="<font color='red'>未在库</font>";	
	     	}
			
			trHtml+='</td> </tr>';
	    	/* trHtml+='</td>';
	     	if(selectObj.forderStutas==0){
	     		trHtml+="<font color='grenn'>无订单</font>";
	     	}else{
	     		trHtml+="<font color='red'>有订单</font>";
	     	} */
		 	
		 $('#selectResult',window.parent.document).append(trHtml);
		 $('#selectResult',window.parent.document).data("selected"+selectObj.fid,selectObj);
	}
	$('.sr-only',window.parent.document).click();
	$('#searChResult',window.parent.document).removeData();
}


    </script>
  </head>

  <body>
    <%-- <%@include file="/header.jsp"%> --%>

    <div class="row-fluid">
	 <%--   <%@include file="/menu/xz-workspace.jsp"%> --%>

	  <!-- start of main -->
      <section id="m-main" class="span12">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="xzZjDxlist-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzZjDxlist-infoSearch" class="content content-inner">

		  <form name="xzZjDxlist-infoForm" method="post" action="xzZjDxlist-info-lesslist.do?startTime=<%=request.getParameter("startTime")%>&endTime=<%=request.getParameter("endTime")%>" class="form-inline">
		    <label for="xzZjDxlist-info_fname"><spring:message code='xzZjDxlist-info.xzZjDxlist-info.list.search.fname' text='名称'/>:</label>
		    <input type="text" id="xzZjDxlist-info_fname" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
			<button class="btn btn-small a-search" onclick="document.xzZjDxlist-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  	<button type="button" class="btn" onclick="selectItem()">
									<spring:message code='core.input.save' text='选择' />
								</button>
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
		  <h4 class="title"><spring:message code="xzZjDxlist-info.xzZjDxlist-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="xzZjDxlist-infoGridForm" name="xzZjDxlist-infoGridForm" method='post' action="xzZjDxlist-info-remove.do" class="m-form-blank">
  <table id="xzZjDxlist-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="ftype">证件类型</th>
        	<!-- <th class="sorting" name="fzjid">证件id</th> -->
        	<th class="sorting" name="fname">证件描述</th>
        	<th class="sorting" name="fstate">状态</th>
        	<th class="sorting" name="forderstatus">订单状态</th>
        	<th hidden="hidden"></th>
        	<th hidden="hidden"></th>
        	<th hidden="hidden"></th>
       		 <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody id="searchResult">
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><c:if test="${item[1]==1}"></c:if><c:if test="${item[1]==0}"><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item[0].fid}"></c:if></td>
      	 	 <td class="span2">
	      	 	 <c:if test="${item[0].ftype=='1'}">公司证件</c:if>
	      	 	 <c:if test="${item[0].ftype=='2'}">人员证件</c:if>
	      	 	 <c:if test="${item[0].ftype=='3'}">荣誉证书</c:if>
	      	 	 <c:if test="${item[0].ftype=='4'}">合同</c:if>
	      	 	 <c:if test="${item[0].ftype=='5'}">中标通知书</c:if>
	      	 	 <c:if test="${item[0].ftype=='6'}">竣工验收报告</c:if>
	      	 	 <c:if test="${item[0].ftype=='7'}">红头文件</c:if>
	      	 	 <c:if test="${item[0].ftype=='8'}">外部评先</c:if>
      	 	 </td>
			<%--<td>${item.fzjid}</td> --%>
      	 	 <td class="span7" filed="fzjinfo">${item[0].fname}</td>
      	 	 <td class="span2"><c:if test="${item[0].fstate=='1'}"><font color="grenn">在库</font></c:if><c:if test="${item[0].fstate=='2'}"><font color="red">未在库</font></c:if></td>
      	 	 <td class="span2"><c:if test="${item[1]==1}"><font color="red">有订单</font></c:if><c:if test="${item[1]==0}"><font color="green">无订单</font></c:if> </td>
      	 	 <td filed="zjid" hidden="hidden">${item[0].fid}</td>
      	 	 <td filed="fstate" hidden="hidden">${item[0].fstate}</td>
      	 	 <td filed="ftype" hidden="hidden">${item[0].ftype}</td>
      	 	  <td filed="lastupdate" hidden="hidden">${item[0].fupdatetime}</td>
      	 	 <td filed="forderstatus" hidden="hidden">${item[1]}</td>
      	 	<%--<td>${item.fupdatetime}</td> --%>
      	 	<%--  <td>${item.fmemo}</td> --%>
        <td class="span2">
          <a  href="${item[0].furl}" target="_blank"><spring:message  text="详细"/></a>
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
	  <!-- end of main -->
	</div>

  </body>

</html>
