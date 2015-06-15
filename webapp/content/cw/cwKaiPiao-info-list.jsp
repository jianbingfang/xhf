<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
    pageContext.setAttribute("currentMenu", "cw-zk");
%>
<!doctype html>
<html lang="zh">
<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message
            code="cwYingShou-info.cwYingShou-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>
    <%@page contentType="text/html;charset=UTF-8" %>
    <%@include file="/taglibs.jsp" %>
        <%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
        <%
	pageContext.setAttribute("currentMenu", "cw-zk");
%>
    <!doctype html>
    <html lang="zh">
    <head>
        <%@include file="/common/meta.jsp" %>
        <title><spring:message code="dev.cwKaiPiao-info.list.title"
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
                    'filter_LIKES_fprojectname': '${param.filter_LIKES_fprojectname}',
                    'filter_LIKES_fmemo4': '${param.filter_LIKES_fmemo4}',
                    'filter_GTD_fdzdate': '${param.filter_GTD_fdzdate}',
                    'filter_LTD_fdzdate': '${param.filter_LTD_fdzdate}',
                    'filter_GTD_fdzdate': '${param.filter_GTD_fdzdate}',
                    'filter_LTD_fdzdate': '${param.filter_LTD_fdzdate}',
                    'filter_LIKES_finviocecode': '${param.filter_LIKES_finviocecode}',
                    'filter_LIKES_freceiptcode': '${param.filter_LIKES_freceiptcode}'
                },
                selectedItemClass: 'selectedItem',
                gridFormId: 'cwKaiPiao-infoGridForm',
                exportUrl: 'cwKaiPiao-info-export.do'
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
        <%@include file="/menu/cw-workspace.jsp" %>
        <!-- start of main -->
        <section id="m-main" class="span10">
            <article class="m-widget">
                <header class="header">
                    <h4 class="title">查询</h4>

                    <div class="ctrl">
                        <a class="btn"><i id="cwKaiPiao-infoSearchIcon"
                                          class="icon-chevron-up"></i></a>
                    </div>
                </header>
                <div id="cwKaiPiao-infoSearch" class="content content-inner">
                    <form name="cwKaiPiao-infoForm" method="post"
                          action="cwKaiPiao-info-list.do" class="form-inline">
                        <label for="cwYingShou-info_fprojectname"><spring:message
                                code='cwYingShou-info.cwYingShou-info.list.search.fprojectname'
                                text='合同名称'/>:</label> <input type="text"
                                                              id="cwYingShou-info_fprojectname"
                                                              name="filter_LIKES_fprojectname"
                                                              value="${param.filter_LIKES_fprojectname}">&nbsp;&nbsp;
                        <label for="cwYingShou-info_fdzdate"><spring:message
                                code='cwYingShou-info.cwYingShou-info.list.search.fdzdate' text='时间'/>:</label>

                        <div class="input-append datepicker date"
                             style="padding-left: 0px;">
                            <input id="cwYingShou-info_fdzdate" type="text"
                                   name="filter_GTD_fdzdate" value="${param.filter_GTD_fdzdate}"
                                   size="40" class="text "
                                   style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
                                  style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                        </div>
                        至
                        <div class="input-append datepicker date"
                             style="padding-left: 0px;">
                            <input id="cwYingShou-info_fdzdate" type="text"
                                   name="filter_LTD_fdzdate" value="${param.filter_LTD_fdzdate}"
                                   size="40" class="text "
                                   style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
                                  style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                        </div>
                        &nbsp;&nbsp;
                        <label for="cwYingShou-info_finviocecode"><spring:message
                                code='cwYingShou-info.cwYingShou-info.list.search.finviocecode' text='发票号'/>:</label>
                        <input type="text" id="cwYingShou-info_finviocecode" style="width: 150px"
                               name="filter_LIKES_finviocecode" value="${param.filter_LIKES_finviocecode}">&nbsp;&nbsp;
                        <label for="cwYingShou-info_freceiptcode"><spring:message
                                code='cwYingShou-info.cwYingShou-info.list.search.freceiptcode' text='收据号'/>:</label>
                        <input type="text" id="cwYingShou-info_freceiptcode" style="width: 150px"
                               name="filter_LIKES_freceiptcode" value="${param.filter_LIKES_freceiptcode}">&nbsp;&nbsp;
                        <label for="cwYingShou-info_fmemo4"><spring:message
                                code='cwYingShou-info.cwYingShou-info.list.search.fmemo4'
                                text='属性'/>:</label> <input type="text" id="cwYingShou-info_fmemo4" style="width: 100px"
                                                            name="filter_LIKES_fmemo4"
                                                            value="${param.filter_LIKES_fmemo4}">&nbsp;&nbsp;
                        <button class="btn btn-small a-search"
                                onclick="document.cwKaiPiao-infoForm.submit()">查询
                        </button>
                        &nbsp;
                    </form>
                </div>
            </article>
            <article class="m-blank">
                <div class="pull-left">
                    <region:region-permission permission="cwKaiPiao-info:create">
                        <button class="btn btn-small a-insert"
                                onclick="location.href='cwKaiPiao-info-input.do'">新建
                        </button>
                    </region:region-permission>
                    <region:region-permission permission="cwKaiPiao-info:delete">
                        <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
                    </region:region-permission>
                    <%--<button class="btn btn-small a-export"--%>
                    <%--onclick="table.exportExcel()">导出--%>
                    <%--</button>--%>
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
                        <spring:message code="cwKaiPiao-info.cwKaiPiao-info.list.title"
                                        text="票据开具明细"/>
                    </h4>
                </header>
                <div class="content">
                    <form id="cwKaiPiao-infoGridForm" name="cwKaiPiao-infoGridForm"
                          method='post' action="cwKaiPiao-info-remove.do"
                          class="m-form-blank">
                        <table id="cwKaiPiao-infoGrid" class="m-table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th width="10" class="m-table-check"><input
                                        type="checkbox" name="checkAll"
                                        onchange="toggleSelectedItems(this.checked)"></th>
                                <th class="sorting" name="fxmid">合同</th>
                                <th class="sorting" name="finviocecode">发票号</th>
                                <th class="sorting" name="freceiptcode">收据号</th>
                                <th class="sorting" name="fdzdate">开票时间</th>
                                <th class="sorting" name="fdebit">借方金额</th>
                                <th class="sorting" name="fopratorname">经办人</th>
                                <th class="sorting" name="fmemo">备注</th>
                                <th class="sorting" name="fhjjdfx">合计借贷方向</th>
                                <th class="sorting" name="fhjje">合计金额</th>
                                <th></th>
                                <th width="80">&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.result}" var="item">
                                <tr>
                                    <td><input type="checkbox" class="selectedItem a-check"
                                               name="selectedItem" value="${item.fid}"></td>
                                    <td>${htMap[item.fxmid].fhtname}</td>
                                    <td>${item.finviocecode}</td>
                                    <td>${item.freceiptcode}</td>
                                    <td>${item.fdzdate}</td>
                                    <td><fmt:formatNumber type="number" value="${item.fdebit}"
                                                          maxFractionDigits="2"/></td>
                                    <td>${item.fopratorname}</td>
                                    <td>${item.fmemo}</td>
                                    <td>${item.fhjjdfx}</td>
                                    <td>${item.fhjje}</td>
                                    <td>
                                        <a href="cwKaiPiao-info-input.do?id=${item.fid}"
                                           class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
                                    </td>
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
            <div class="m-spacer"></div>
        </section>
        <!-- end of main -->
    </div>
    </body>
    </html>
