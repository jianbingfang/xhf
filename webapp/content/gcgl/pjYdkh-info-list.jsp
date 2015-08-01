<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="dev.pjYdkh-info.list.title" text="列表"/></title>
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
                'filter_LIKES_fyearmonth': '${param.filter_LIKES_fyearmonth}',
                'filter_LIKES_fxmname': '${param.filter_LIKES_fxmname}'
            },
            selectedItemClass: 'selectedItem',
            gridFormId: 'pjYdkh-infoGridForm',
            exportUrl: 'pjYdkh-info-export.do'
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
                    <li class="active">项目人员月度考核</li>
                </ul>
            </div>
        </div>
        <article class="m-widget">
            <header class="header">
                <h4 class="title">查询</h4>

                <div class="ctrl">
                    <a class="btn"><i id="pjYdkh-infoSearchIcon" class="icon-chevron-up"></i></a>
                </div>
            </header>
            <div id="pjYdkh-infoSearch" class="content content-inner">

                <form name="pjYdkh-infoForm" method="post" action="pjYdkh-info-list.do" class="form-inline">
                    <label for="pjYdkh-info_name"><spring:message code='pjYdkh-info.pjYdkh-info.list.search.name'
                                                                  text='项目名称'/>:</label>
                    <input type="text" id="pjYdkh-info_fxmname" name="filter_LIKES_fxmname"
                           value="${param.filter_LIKES_fxmname}">
                    <label for="pjYdkh-info_name"><spring:message code='pjYdkh-info.pjYdkh-info.list.search.name'
                                                                  text='年月'/>:</label>
                    <input type="text" id="pjYdkh-info_name" name="filter_LIKES_fyearmonth"
                           value="${param.filter_LIKES_fyearmonth}">
                    <button class="btn btn-small a-search" onclick="document.pjYdkh-infoForm.submit()">查询</button>
                    &nbsp;
                </form>

            </div>
        </article>

        <article class="m-blank">
            <div class="pull-left">
                <region:region-permission permission="pjYdkh-info:create">
                    <button class="btn btn-small a-insert" onclick="location.href='pjYdkh-info-input.do'">新建</button>
                </region:region-permission>
                <region:region-permission permission="pjYdkh-info:delete">
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
                <h4 class="title"><spring:message code="pjYdkh-info.pjYdkh-info.list.title" text="列表"/></h4>
            </header>
            <div class="content">
                <form id="pjYdkh-infoGridForm" name="pjYdkh-infoGridForm" method='post' action="pjYdkh-info-remove.do"
                      class="m-form-blank">
                    <table id="pjYdkh-infoGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check"><input type="checkbox" name="checkAll"
                                                                        onchange="toggleSelectedItems(this.checked)">
                            </th>
                            <th class="sorting" name="fkhno">序号</th>
                            <th class="sorting" name="fxmid">考核项目</th>
                            <th class="sorting" name="fyearmonth">年月</th>
                            <th class="sorting" name="fuploaddate">上传时间</th>
                            <th class="sorting" name="fryid">上传人</th>
                            <th class="sorting" name="ffilename">附件下载</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${page.result}" var="item">
                            <tr>
                                <td><input type="checkbox" class="selectedItem a-check" name="selectedItem"
                                           value="${item.fid}"></td>
                                <td>${item.fid}</td>
                                <td>${item.fxmname}</td>
                                <td>${item.fyearmonth}</td>
                                <td>${item.fuploaddate}</td>
                                <td>${item.fry}</td>
                                <td><a href="${item.ffileurl}">${item.ffilename}</a></td>
                                    <%--  <td>
                                       <a href="pjYdkh-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
                                     </td> --%>
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
