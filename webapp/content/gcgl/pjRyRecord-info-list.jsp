<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="dev.pjRyRecord-info.list.title" text="列表"/></title>
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
                'filter_LIKES_fryname': '${param.filter_LIKES_fryname}'
            },
            selectedItemClass: 'selectedItem',
            gridFormId: 'pjRyRecord-infoGridForm',
            exportUrl: 'pjRyRecord-info-export.do'
        };

        var table;

        $(function () {
            table = new Table(config);
            table.configPagination('.m-pagination');
            table.configPageInfo('.m-page-info');
            table.configPageSize('.m-page-size');
        });


        function pjRyAdd() {
            window.location.href = "pjRy-info-add.do";
        }

        function pjRySub() {
            window.location.href = "pjRy-info-sub.do";
        }


        function pjRyMove() {
            window.location.href = "pjRyRecord-info-input.do";
        }

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
                    <li class="active">人员调配记录</li>
                </ul>
            </div>
        </div>
        <article class="m-widget">
            <header class="header">
                <h4 class="title">查询</h4>

                <div class="ctrl">
                    <a class="btn"><i id="pjRyRecord-infoSearchIcon" class="icon-chevron-up"></i></a>
                </div>
            </header>
            <div id="pjRyRecord-infoSearch" class="content content-inner">

                <form name="pjRyRecord-infoForm" method="post" action="pjRyRecord-info-list.do" class="form-inline">
                    <label for="pjRyRecord-info_name"><spring:message
                            code='pjRyRecord-info.pjRyRecord-info.list.search.name' text='姓名'/>:</label>
                    <input type="text" id="pjRyRecord-info_name" name="filter_LIKES_fryname"
                           value="${param.filter_LIKES_fryname}">
                    <button class="btn btn-small a-search" onclick="document.pjRyRecord-infoForm.submit()">查询</button>
                    &nbsp;
                </form>

            </div>
        </article>

        <article class="m-blank">
            <%--<div class="pull-left">

              <region:region-permission >
                      <button class="btn btn-small" onclick="pjRyAdd()">新近人员</button>
              </region:region-permission>

              <region:region-permission >
                      <button class="btn btn-small" onclick="pjRySub()">人员离职</button>
              </region:region-permission>

              <region:region-permission >
                      <button class="btn btn-small" onclick="pjRyMove()">人员调配</button>
              </region:region-permission>

                <region:region-permission permission="pjRyRecord-info:delete">
                    <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
                </region:region-permission>
            </div>--%>

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
                <h4 class="title"><spring:message code="pjRyRecord-info.pjRyRecord-info.list.title" text="列表"/></h4>
            </header>
            <div class="content">
                <form id="pjRyRecord-infoGridForm" name="pjRyRecord-infoGridForm" method='post'
                      action="pjRyRecord-info-remove.do" class="m-form-blank">
                    <table id="pjRyRecord-infoGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check"><input type="checkbox" name="checkAll"
                                                                        onchange="toggleSelectedItems(this.checked)">
                            </th>
                            <th class="sorting" name="fdbdate">日期</th>
                            <th class="sorting" name="fry">姓名</th>
                            <th class="sorting" name="fdrgw">岗位</th>
                            <th class="sorting" name="fdcxm">调出项目</th>
                            <th class="sorting" name="fdrxm">调入项目</th>
                            <!-- <th class="sorting" name="fjingbanren">经办人</th> -->

                            <%--<th width="80">&nbsp;</th>--%>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${page.result}" var="item">
                            <tr>
                                <td><input type="checkbox" class="selectedItem a-check" name="selectedItem"
                                           value="${item.fid}"></td>
                                <td>${item.fdbdate}</td>
                                <td>${item.fryname}</td>
                                <td>${item.fdrgw}</td>
                                <td>${item.fdcxmname}</td>
                                <td>${item.fdrxmname}</td>
                                    <%-- <td>${ryMap[item.fjingbanrenid].fname}</td> --%>

                                    <%-- <td>
                                             <a href="pjRyRecord-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
                                </td>--%>
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
