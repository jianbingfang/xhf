<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
    pageContext.setAttribute("currentMenu", "jl-xcgl");
%>
<!doctype html>
<html lang="zh">
<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="dev.jlTouzi-info.list.title"
                           text="列表"/></title>
    <%@include file="/common/s.jsp" %>
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
                'ftype': '${param.ftype}',
                'filter_LIKES_name': '${param.filter_LIKES_name}'
            },
            selectedItemClass: 'selectedItem',
            gridFormId: 'jlTouzi-infoGridForm',
            exportUrl: 'jlTouzi-info-export.do'
        };

        var table;

        $(function () {
            table = new Table(config);
            table.configPagination('.m-pagination');
            table.configPageInfo('.m-page-info');
            table.configPageSize('.m-page-size');
        });
    </script>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="row-fluid">
    <%@include file="/menu/jl-workspace.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <!-- start of main -->
    <section id="m-main" class="span10">
        <%--   <article class="m-widget">
    <header class="header">
      <h4 class="title">查询</h4>
      <div class="ctrl">
        <a class="btn"><i id="jlTouzi-infoSearchIcon" class="icon-chevron-up"></i></a>
      </div>
    </header>
    <div id="jlTouzi-infoSearch" class="content content-inner">

      <form name="jlTouzi-infoForm" method="post" action="jlTouzi-info-list.do" class="form-inline">
        <label for="jlTouzi-info_name"><spring:message code='jlTouzi-info.jlTouzi-info.list.search.name' text='名称'/>:</label>
        <input type="text" id="jlTouzi-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
        <button class="btn btn-small a-search" onclick="document.jlTouzi-infoForm.submit()">查询</button>&nbsp;
      </form>

    </div>
  </article>
--%>
        <article class="m-blank">
            <div class="pull-left">
                <region:region-permission permission="jlTouzi-info:create">
                    <button class="btn btn-small a-insert"
                            onclick="location.href='jlTouzi-info-input.do?ftype='+${param.ftype}">新建
                    </button>
                </region:region-permission>
                <region:region-permission permission="jlTouzi-info:delete">
                    <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
                </region:region-permission>
                <%--<button class="btn btn-small a-export"
                    onclick="table.exportExcel()">导出</button>--%>
            </div>
            <div class="pull-right">
                每页显示 <select class="m-page-size">
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="50">50</option>
            </select> 条
            </div>
            <div class="m-clear"></div>
        </article>
        <article class="m-widget">
            <header class="header">
                <h4 class="title">
                    <spring:message code="jlTouzi-info.jlTouzi-info.list.title"
                                    text="列表"/>
                </h4>
            </header>
            <div class="content">
                <form id="jlTouzi-infoGridForm" name="jlTouzi-infoGridForm"
                      method='post' action="jlTouzi-info-remove.do?ftype=${param.ftype}" class="m-form-blank">
                    <table id="jlTouzi-infoGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check"><input
                                    type="checkbox" name="checkAll"
                                    onchange="toggleSelectedItems(this.checked)"></th>
                            <th class="sorting" id="ftype">类型</th>
                            <th class="sorting" id="fdwname">单位</th>
                            <th class="sorting" id="fjine">金额</th>
                            <th class="sorting" id="fdate">时间</th>
                            <th class="sorting" id="fmemo">备注</th>
                            <th width="80">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.result}" var="item">
                            <tr>
                                <td><input type="checkbox" class="selectedItem a-check"
                                           name="selectedItem" value="${item.fid}"></td>
                                <td><c:if test="${item.ftype=='1'}"> 概算投资额</c:if> <c:if
                                        test="${item.ftype=='2'}">合同价款</c:if> <c:if
                                        test="${item.ftype=='3'}"> 工程支付款</c:if> <c:if
                                        test="${item.ftype=='4'}">设计变更</c:if> <c:if
                                        test="${item.ftype=='5'}">现场签证</c:if> <c:if
                                        test="${item.ftype=='6'}">结算价</c:if></td>
                                <td>${item.fdwname}</td>
                                <td>${item.fjine}</td>
                                <td><fmt:formatDate value="${item.fdate}"
                                                    pattern="yyyy-MM-dd"/></td>
                                <td>${item.fmemo}</td>
                                <td><a href="jlTouzi-info-input.do?id=${item.fid}&ftype=${param.ftype}"
                                       class="a-update"><spring:message code="core.list.edit"
                                                                        text="编辑"/></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </article>
        <article>
            <div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>
            <div class="btn-group m-pagination pull-right">
                <button class="btn btn-small">&lt;</button>
                <button class="btn btn-small">1</button>
                <button class="btn btn-small">&gt;</button>
            </div>
            <div class="m-clear"></div>
        </article>
        <button class="btn btn-primary a-insert"
                onclick="location.href='jlTouzi-info-list2.do'">返回投资控制页
        </button>
        <div class="m-spacer"></div>
    </section>
    <!-- end of main -->
</div>
</body>
</html>
