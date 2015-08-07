<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
    pageContext.setAttribute("currentMenu", "commRy");
%>
<!doctype html>
<html lang="zh">
<head>
    <%@include file="/common/meta.jsp" %>
    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <title><spring:message code="dev.hrRyZj-info.list.title"
                           text="证件台账 - 员工管理 - 人力资源"/></title>
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
                'filter_LIKES_name': '${param.filter_LIKES_name}',
                'filter_LIKES_fzhengjianno': '${param.filter_LIKES_fzhengjianno}',
                'filter_LIKES_fzhuanye': '${param.filter_LIKES_fzhuanye}',
                'filter_LIKES_fname': '${param.filter_LIKES_fname}',
                'filter_GTD_fyxjs': '${param.filter_GTD_fyxjs}',
                'filter_LTD_fyxjs': '${param.filter_LTD_fyxjs}',
                'filter_GTD_fyxqks': '${param.filter_GTD_fyxqks}',
                'filter_LTD_fyxqks': '${param.filter_LTD_fyxqks}'
            },
            selectedItemClass: 'selectedItem',
            gridFormId: 'hrRyZj-infoGridForm',
            exportUrl: 'hrRyZj-info-export.do'
        };

        var table;
        var selecteditem;
        $(function () {
            table = new Table(config);
            table.configPagination('.m-pagination');
            table.configPageInfo('.m-page-info');
            table.configPageSize('.m-page-size');
        });


        function getcheckeditem() {
            var inputs = document.getElementsByTagName("input");//获取所有的input标签对象
            var checkboxArray = [];//初始化空数组，用来存放checkbox对象。

            for (var i = 0; i < inputs.length; i++) {
                var obj = inputs[i];
                if (obj.type == 'checkbox') {
                    if (inputs[i].checked) {
                        //这个地方是获取你选定了的的checkbox的Value
                        var valuetext = inputs[i].value;
                        checkboxArray.push(valuetext);
                    }
                }
            }
            return checkboxArray.join('@');
        }
        ;

        function removeflow() {
            var checkboxs = getcheckeditem();

            removeitem(checkboxs);
        }

        function removeitem(checkboxs) {
            $.ajax({
                url: "${scopePrefix}/hr/hrRyZj-info-remove.do",
                type: 'POST',
                traditional: true,
                dataType: 'json',
                data: {
                    'selecteditems': checkboxs
                },
                async: false,
                success: function (data) {

                    window.location.href = "hrRyZj-treelist.do";

                }
            });
        }


        function selectZj(ry) {
            if (ry.id.indexOf("a") > 0) {
                var a = ry.nextSibling;
                while (a.id && a.id.indexOf("child") >= 0) {
                    if (a.hidden == null || a.hidden == "")
                        a.hidden = "hidden";
                    else {
                        a.hidden = "";
                    }
                    a = a.nextSibling;
                }
            } else {
                $.ajax({
                    url: "${scopePrefix}/hr/hrRyZj-info-list.do",
                    type: 'POST',
                    data: {
                        ryid: ry.id
                    },
                    dataType: 'json',
                    success: function (data) {
                        var html = '';
                        for (var i = 0; i < data.length; i++) {
                            var item = data[i];
                            if (item.fyxqks == null) {
                                item.fyxqks = "";
                            }
                            if (item.fyxjs == null) {
                                item.fyxjs = "";
                            }


                            html += "<tr id='child" + item.fid + "' ondblclick='openZj(" + item.fid + ")' >"
                            + '<td><input type="checkbox" id="childselected" class="selectedItem a-check" name="selectedItems"  value="' + item.fid + '"></td>'
                            + '</td>'
                            + '<td>' + '</td>'
                            + "<td>" + item.fname + "</td>"
                            + "<td>"
                            + item.fzhengjianno + "</td>" + "<td>"
                            + item.fzcno + "</td>" + "<td>" + item.fzhuanye
                            + "</td>" + "<td>" + item.fyxqks + "</td>"
                            + "<td>" + item.fyxjs + "</td>" + "<td>"
                            + item.fwz + "</td>" + "<td>";

                            if (item.fstatus == '在库') {
                                html += '<font color="green">在库</font>';
                            } else {
                                html += '<font color="red">未在库</font>';
                            }

                            html += "</td>" + "</tr>";
                        }
                        $('#' + ry.id).after(html);
                    }
                });
                ry.id = ry.id + "a";
            }

        }

        function openZj(id) {
            window.location.href = "hrRyZj-info-input.do?id=" + id;
        }
    </script>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="row-fluid">
    <%@include file="/menu/hr-workspace.jsp" %>
    <!-- start of main -->
    <section id="m-main" class="span10">
        <!-- <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
                        </li>
                        <li>员工管理<span class="divider">/</span>
                        </li>
                        <li class="active">证件台账</li>
                    </ul>
                </div>
            </div>
        </div> -->
        <article class="m-widget">
            <header class="header">
                <h4 class="title">查询</h4>

                <div class="ctrl">
                    <a class="btn"><i id="hrRyZj-infoSearchIcon"
                                      class="icon-chevron-up"></i></a>
                </div>
            </header>
            <div id="hrRyZj-infoSearch" class="content content-inner">
                <form name="hrRyZj-infoForm" method="post"
                      action="hrRyZj-treelist.do" class="form-inline">
                    <label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='人员姓名'/>:</label>
                    <input id="hrRyZj-info_name"
                           name="filter_LIKES_name" type="text"
                           value="${param.filter_LIKES_name}"
                           style="width: 120px;">
                    <%--<label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='编号'/>:</label>
                    <input type="text" style="width: 120px" id="hrRyZj-info_name"
                           name="filter_LIKES_fzhengjianno"
                           value="${param.filter_LIKES_fzhengjianno}"/>--%>
                    <label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='专业'/>:</label>
                    <input type="text" style="width: 120px" id="hrRyZj-info_fzhuanye"
                           name="filter_LIKES_fzhuanye"
                           value="${param.filter_LIKES_fzhuanye}"/>
                    <label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='证书名称'/>:</label>
                    <select class="form-control" id="hrRyZj-info_name"
                            name="filter_LIKES_fname" class="">

                        <option value="">不限</option>
                        <c:forEach items="${zjInfos}" var="item">
                            <option value="${item.fname}" ${item.fname==param.filter_LIKES_fname? 'selected' : ''}>${item.fname}</option>
                        </c:forEach>

                    </select>

                    <br/><br/>

                    <label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='发证日期'/>:</label>

                    <div class="input-append input-prepend"
                         style="padding-left: 0px;">
                        <input id="hrRyZj-info_fyxqks" type="text" class="add-on datepicker date"
                               name="filter_GTD_fyxqks" value="${param.filter_GTD_fyxqks}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 100px;">
                        <span class="add-on"><i class="icon-resize-horizontal"></i></span>
                        <input id="hrRyZj-info_fyxqks" type="text" class="add-on datepicker date"
                               name="filter_LTD_fyxqks" value="${param.filter_LTD_fyxqks}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 100px;">
                    </div>

                    <label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='到期日期'/>:</label>

                    <div class="input-append input-prepend"
                         style="padding-left: 0px;">
                        <input id="hrRyZj-info_fyxjs" type="text" class="add-on datepicker date"
                               name="filter_GTD_fyxjs" value="${param.filter_GTD_fyxjs}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 100px;">
                        <span class="add-on"><i class="icon-resize-horizontal"></i></span>
                        <input id="hrRyZj-info_fyxjs" type="text" class="add-on datepicker date"
                               name="filter_LTD_fyxjs" value="${param.filter_LTD_fyxjs}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 100px;">
                    </div>
                    <button class="btn btn-small a-search"
                            onclick="document.hrRyZj-infoForm.submit()">查询
                    </button>
                    &nbsp;
                </form>
            </div>
        </article>
        <article class="m-blank">
            <div class="pull-left">
                <region:region-permission permission="hrRyZj-info:create">
                    <button class="btn btn-small a-insert"
                            onclick="location.href='hrRyZj-info-input.do'">新建
                    </button>
                </region:region-permission>
                <region:region-permission permission="hrRyZj-info:delete">
                    <button class="btn btn-small a-remove" onclick="removeflow()">删除</button>
                </region:region-permission>
                <%--<button class="btn btn-small a-export"--%>
                <%--onclick="table.exportExcel()">导出</button>--%>
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
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <article class="m-widget">
                            <header class="header">
                                <h4 class="title">
                                    <spring:message code="hrRyZj-info.hrRyZj-info.list.title"
                                                    text="证件列表"/>
                                </h4>
                            </header>
                            <div class="content">
                                <form id="hrRyZj-infoGridForm" name="hrRyZj-infoGridForm"
                                      method='post' action="hrRyZj-info-remove.do"
                                      class="m-form-blank">
                                    <table id="hrRyZj-infoGrid" class="m-table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th width="10" class="m-table-check"><input
                                                    type="checkbox" name="checkAll"
                                                    onchange="toggleSelectedItems(this.checked)" hidden="hidden"></th>
                                            <th class="sorting" id="userid">姓名</th>
                                            <th class="sorting" name="fname">证书名称</th>
                                            <th class="sorting" name="fzhengjianno">证书编号</th>
                                            <th class="sorting" name="fzcno">注册号</th>
                                            <th class="sorting" name="fzhuanye">证书专业</th>
                                            <th class="sorting" name="fyxqks">发证日期</th>
                                            <th class="sorting" name="fyxjs">到期日期</th>
                                            <th class="sorting" name="fwz">放置位置</th>
                                            <th class="sorting" name="fstatus">状态</th>
                                        </tr>
                                        </thead>
                                        <tbody id="ryzjtid">
                                        <c:forEach items="${page.result}" var="item">
                                            <tr id="${item.fid}" onclick=selectZj(this)
                                                style="background-color: #EEEEEE;" class='a'>
                                                    <%--<td></td> --%>
                                                <td><input type="checkbox"
                                                           class="selectedItem a-check" name="selectedItem"
                                                           id="child" hidden="hidden"
                                                           value="${item.fid}"></td>
                                                <td>${item.fname}</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </article>
                        <article>
                            <div class="m-page-info pull-left">无记录</div>
                            <div class="btn-group m-pagination pull-right">
                                <button class="btn btn-small">&lt;</button>
                                <button class="btn btn-small">1</button>
                                <button class="btn btn-small">&gt;</button>
                            </div>
                            <div class="m-clear"></div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
        <div class="m-spacer"></div>
    </section>
    <!-- end of main -->
</div>
</body>
</html>
