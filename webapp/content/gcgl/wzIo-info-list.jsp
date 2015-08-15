<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-yq");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="dev.wzIo-info.list.title" text="列表"/></title>
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
                'filter_LIKES_fname': '${param.filter_LIKES_fname}',
                'filter_LIKES_fcode': '${param.filter_LIKES_fcode}',
                'filter_GTD_fdate': '${param.filter_GTD_fdate}',
                'filter_LTD_fdate': '${param.filter_LTD_fdate}',
            },
            selectedItemClass: 'selectedItem',
            gridFormId: 'wzIo-infoGridForm',
            exportUrl: 'wzIo-info-export.do'
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

        <article class="m-widget">
            <header class="header">
                <h4 class="title">查询</h4>

                <div class="ctrl">
                    <a class="btn"><i id="wzIo-infoSearchIcon" class="icon-chevron-up"></i></a>
                </div>
            </header>
            <div id="wzIo-infoSearch" class="content content-inner">

                <form name="wzIo-infoForm" method="post" action="wzIo-info-list.do" class="form-inline">
                    <label for="wzIo-info_fwzbm"><spring:message code='wzIo-info.wzIo-info.list.search.fcode'
                                                                 text='物资编码'/>:</label>
                    <input type="text" id="wzIo-info_fcode" name="filter_LIKES_fcode"
                           value="${param.filter_LIKES_fcode}">
                    <label for="wzIo-info_fname"><spring:message code='wzIo-info.wzIo-info.list.search.fname'
                                                                 text='名称'/>:</label>
                    <input type="text" id="wzIo-info_fname" name="filter_LIKES_fname"
                           value="${param.filter_LIKES_fname}">
                    <label for="wzIo-info_fdate"><spring:message
                            code='wzIo-info.wzIo-info.list.search.fdate' text='调入时间'/>:</label>

                    <div class="input-append datepicker date"
                         style="padding-left: 0px;">
                        <input id="wzIo-info_fdate" type="text"
                               name="filter_GTD_fdate" value="${param.filter_GTD_fdate}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
                                  style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                    </div>
                    至
                    <div class="input-append datepicker date"
                         style="padding-left: 0px;">
                        <input id="wzIo-info_fdate" type="text"
                               name="filter_LTD_fdate" value="${param.filter_LTD_fdate}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
                                  style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                    </div>
                    &nbsp;&nbsp;
                    <button class="btn btn-small a-search" onclick="document.wzIo-infoForm.submit()">查询</button>
                    &nbsp;
                </form>

            </div>
        </article>

        <article class="m-blank">
            <div class="pull-left">
                <%--<region:region-permission permission="wzIo-info:create">
                <button class="btn btn-small a-insert" onclick="location.href='wzIo-info-input.do'">新建</button>
                </region:region-permission>--%>
                <region:region-permission permission="wzIo-info:delete">
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
                <h4 class="title"><spring:message code="wzIo-info.wzIo-info.list.title" text="列表"/></h4>
            </header>
            <div class="content">
                <form id="wzIo-infoGridForm" name="wzIo-infoGridForm" method='post' action="wzIo-info-remove.do"
                      class="m-form-blank">
                    <table id="wzIo-infoGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check"><input type="checkbox" name="checkAll"
                                                                        onchange="toggleSelectedItems(this.checked)">
                            </th>
                            <th class="sorting" name="fwzid">物资编码</th>
                            <th class="sorting" name="fwzname">名称</th>
                            <th class="sorting" name="fdcxm">调出项目</th>
                            <th class="sorting" name="fdrxm">调入项目</th>
                            <!-- 	<th class="sorting" name="fyy">原因</th> -->
                            <th class="sorting" name="fdate">时间</th>
                            <!-- <th class="sorting" name="fjbr">经办人</th> -->
                            <th class="sorting" name="fmemo1">领用人</th>
                            <th class="sorting" name="fwhqk">新旧程度</th>
                            <!--         	<th class="sorting" name="fmemo">备注</th>
                                        <th class="sorting" name="fmemo1">备注1</th>
                                        <th class="sorting" name="fmemo2">备注2</th> -->
                            <th width="80">&nbsp;</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${page.result}" var="item">
                            <tr>
                                <td><input type="checkbox" class="selectedItem a-check" name="selectedItem"
                                           value="${item.fid}"></td>
                                <td>${wzMap[item.fwzid].fcode}</td>
                                <td>${wzMap[item.fwzid].fname}</td>
                                <td>${xmMap[item.fdcxm].fxmname}</td>
                                <td>${xmMap[item.fdrxm].fxmname}</td>
                                    <%-- <td>${item.fyy}</td> --%>
                                <td>${item.fdate}</td>
                                    <%-- <td>${ryMap[item.fjbr].fname}</td> --%>
                                <td>${item.fmemo1}</td>
                                <td>${item.fwhqk}</td>
                                    <%--       	 	 <td>${item.fmemo}</td>
                                                    <td>${item.fmemo1}</td>
                                                    <td>${item.fmemo2}</td> --%>
                                <td>
                                    <a href="wzIo-info-input.do?id=${item.fid}" class="a-update"><spring:message
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
