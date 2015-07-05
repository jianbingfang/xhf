<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="dev.pjKq-info.list.title" text="列表"/></title>
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
                'filter_LIKES_fyearmonth': '${param.filter_LIKES_name}'
            },
            selectedItemClass: 'selectedItem',
            gridFormId: 'pjKq-infoGridForm',
            exportUrl: 'pjKq-info-export.do'
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
    <%@include file="/menu/gcgl-workspace.jsp" %>

    <!-- start of main -->
    <section id="m-main" class="span10">
        <div class="row-fluid">
            <div class="span12">
                <ul class="breadcrumb">
                    <li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
                    </li>
                    <li>项目人员管理<span class="divider">/</span>
                    </li>
                    <li class="active">项目人员考勤</li>
                </ul>
            </div>
        </div>
        <article class="m-widget">
            <header class="header">
                <h4 class="title">查询</h4>

                <div class="ctrl">
                    <a class="btn"><i id="pjKq-infoSearchIcon" class="icon-chevron-up"></i></a>
                </div>
            </header>
            <div id="pjKq-infoSearch" class="content content-inner">

                <form name="pjKq-infoForm" method="post" action="pjKq-info-list.do" class="form-inline">
                    <label for="pjKq-info_name"><spring:message code='pjKq-info.pjKq-info.list.search.name'
                                                                text='年月'/>:</label>
                    <input type="text" id="pjKq-info_name" name="filter_LIKES_fyearmonth"
                           value="${param.filter_LIKES_name}">
                    <button class="btn btn-small a-search" onclick="document.pjKq-infoForm.submit()">查询</button>
                    &nbsp;
                </form>

            </div>
        </article>

        <article class="m-blank">
            <div class="pull-left">
                <region:region-permission permission="pjKq-info:create">
                    <button class="btn btn-small a-insert" onclick="location.href='pjKq-info-input.do'">新建</button>
                </region:region-permission>
                <region:region-permission permission="pjKq-info:delete">
                    <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
                </region:region-permission>
                <%--<button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>--%>
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
                <h4 class="title"><spring:message code="pjKq-info.pjKq-info.list.title" text="列表"/></h4>
            </header>
            <div class="content">
                <form id="pjKq-infoGridForm" name="pjKq-infoGridForm" method='post' action="pjKq-info-remove.do"
                      class="m-form-blank">
                    <table id="pjKq-infoGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check"><input type="checkbox" name="checkAll"
                                                                        onchange="toggleSelectedItems(this.checked)">
                            </th>
                            <th class="sorting" name="fkqno">序号</th>
                            <th class="sorting" name="fxmid">项目</th>
                            <th class="sorting" name="fyearmonth">年月</th>
                            <!-- <th class="sorting" name="fuploaddate">上传时间</th>
                            <th class="sorting" name="fuploadid">上传人</th> -->
                            <!-- <th class="sorting" name="fkqname">考勤表名称</th> -->
                            <th width="80">&nbsp;</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${page.result}" var="item">
                            <tr>
                                <td><input type="checkbox" class="selectedItem a-check" name="selectedItem"
                                           value="${item.fid}"></td>
                                <td>${item.fid}</td>
                                <td>${xmMap[item.fxmid].fxmname}</td>
                                <td>${item.fyearmonth}</td>
                                    <%--  <td>${item.fuploaddate}</td>
                                     <td>${ryMap[item.fuploadid].fname}</td> --%>
                                    <%-- 	 <td><a href="${item.fkqurl}"  class="a-link">${item.fkqname}</a>< /td>--%>
                                <td>
                                    <a href="pjKq-kq-input.do?id=${item.fid}" class="a-update"><spring:message
                                            code="core.list.edit" text="编辑"/></a>
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
