<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-xmtb");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="dev.xzZjOrder-info.list.title" text="列表"/></title>
    <%@include file="/common/s.jsp" %>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
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
            gridFormId: 'xzZjOrder-infoGridForm',
            exportUrl: 'xzZjOrder-info-export.do'
        };

        var table;


        createryPicker({
            modalId: 'ryPicker',
            url: '${scopePrefix}/hr/commRy-simple-list.do'
        });

        $(function () {
            table = new Table(config);
            table.configPagination('.m-pagination');
            table.configPageInfo('.m-page-info');
            table.configPageSize('.m-page-size');
        });


        function searchitem() {
            $.ajax({
                url: '${scopePrefix}/sckf/xzZjOrder-info-listsearch.do',
                type: 'POST',
                data: {
                        filter_LIKES_fname: $('#ryBxRecord-info_userName').val()
                    //filter_LIKES_fcardno: $('#filter_LIKES_fcardno').val()
                },
                dataType: 'json',
                success: function (data) {
                    //$('#xzZjOrder-infoGridForm').load('xzZjOrder-info-list.do');

                    //window.location.href="xzZjOrder-info-list.do";
                    //$('#xzZjOrder-infoGridForm').submit();
                    // window.location.href = "xzZjOrder-info-list.do";
                    //alert("abc");
                    var html = '';
                    for (var i = 0; i < data.result.length;i++) {
                        var item = data.result[i];

                        html += '<table id="xzZjOrder-infoGrid" class="m-table table-hover table-bordered">'
                        +'<th class="sorting" name="fstatus">状态</th>'
                        +'<th class="sorting" name="fcreatetime">创建时间</th>'
                        +'<th class="sorting" name="fstarttime">开始使用时间</th>'
                        +'<th class="sorting" name="fendtime">使用截止时间</th>'

//                        <th class="sorting" name="fxmid">项目</th>
//                        <!-- 	<th class="sorting" name="fmemo">备注</th> -->
                        +'<th class="sorting" name="fbackdate">归还时间</th>'
                        +'<th class="sorting" name="flink">链接</th>'
//                        <th width="80">&nbsp;</th>
                       +'</tr>'
                        +

                        '<tr>'
//                                +'<td>'+'</td>'+
                       + '<td>'+item.fstatus+'</td>'
                       +'<td>'+item.fcreatetime+'</td>'
                        +'<td>'+item.fstarttime+'</td>'
                        +'<td>'+item.fendtime+'</td>'
                        //+'<td>'+{item.fmemo}</td>
                        //+'<td>'+ryMap[item.ffzrid].fname}</td>
                        //+'<td>'+xmMap[item.fxmid].fname}</td>
                        <%-- <td>${item.fmemo}</td> --%>
                        +'<td>'+item.fbackdate+'</td>'

                        +  '<td>'+
                        '<a href="xzZjOrder-info-input.do?id='+item.fid+'"'+'class="a-update">'
                        +'<spring:message code="core.list.edit" text="编辑"/></a>'
                        +'</td>'


//                        +'<td>'+'<a href="xzZjOrder-info-input.do?id="'+item.fid+'编辑</a>'
//
//                        +'</td>'
                        +'</tr>'

                    }
                    $('#xzZjOrder-infoGridForm').html(html);
                }
            });
        }

        function loadRyList() {
            $.ajax({
                url: '${scopePrefix}/hr/commRy-simple-list.do',
                type: 'POST',
                data: {
//					  fxmid:$('#xzChufa-info_fdcxm').val()
                    filter_LIKES_fryno: $('#ry_ryname').val()
                },
                dataType: 'json',
                success: function (data) {
                    var html = '';
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        html +=
                                '<tr>'
                                + '<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
                                + item.fid + '" title="' + item.fname + '"></td>'
                                + '<td><label for="selectedItem' + i + '">' + item.fcardno + '</label></td>'
                                + '<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
                                + '<td><label for="selectedItem' + i + '">' + item.fsex + '</label></td>'
                                + '</tr>';
                    }
                    $('#ryPickerBody').html(html);
                }
            });
        }


        function showPjrypicker() {
            $('#pjrydiv').modal();
            $('#ryPickerBody').html("");
            // loadRyList();
        }

        function selectry() {
            $('#pjrydiv').modal('hide');
            var ryPickerElement = $('.ryPicker');
            var selectBoy = $('#ryPickerBody');
            var checkedEl = selectBoy.find('.selectedItem:checked');
            ryPickerElement.children('input[type=hidden]').val(checkedEl.val());
            ryPickerElement.children('input[type=text]').val(checkedEl.attr('title'));
        }

    </script>
</head>

<body>
<%@include file="/header.jsp" %>


<div id="pjrydiv" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>选择用户</h3>
    </div>
    <div class="modal-body">
        <article class="m-blank">
            <div class="pull-left">
                <form name="ryForm" method="post" action="javascript:void(0);return false;"
                      class="form-inline m-form-bottom">
                    <label for="ry_ryname">姓名:</label>
                    <input type="text" style="width:100px;" id="filter_LIKES_fname1" name="filter_LIKES_fname"
                           value="">
                    <label for="ry_rycard">工号:</label>
                    <input type="text" style="width:100px;" id="filter_LIKES_fcardno" name="filter_LIKES_fcardno"
                           value="">
                    <%--<button id="search" class="btn btn-small" onclick="document.xzZjOrder-infoForm.submit()">查询</button>--%>

                    <button id="search" class="btn btn-small">查询</button>
                </form>
            </div>
            <div class="m-clear"></div>
        </article>
        <article class="m-widget">
            <header class="header">
                <h4 class="title">人员列表</h4>
            </header>
            <div class="content">
                <form id="ryPickerForm" name="ryPickerForm" method="post" action="#" class="m-form-blank">

                    <table id="ryPickerGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check">&nbsp;</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>性别</th>
                        </tr>
                        </thead>
                        <tbody id="ryPickerBody">
                        </tbody>
                    </table>
                </form>
            </div>
        </article>
    </div>
    <div class="modal-footer">
        <span id="ryPickerResult"></span>
        <a id="ryPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>
        <a id="ryPickerBtnSelect" href="#" onclick="selectry()" class="btn btn-primary">选择</a>
    </div>
</div>


<div class="row-fluid">
    <%@include file="/menu/sckf-workspace.jsp" %>

    <!-- start of main -->
    <section id="m-main" class="span10">

        <article class="m-widget">
            <header class="header">
                <h4 class="title">查询</h4>

                <div class="ctrl">
                    <a class="btn"><i id="xzZjOrder-infoSearchIcon" class="icon-chevron-up"></i></a>
                </div>
            </header>
            <div id="xzZjOrder-infoSearch" class="content content-inner">

                <div class="controls">
                    <div class="input-append ryPicker">
                        <input id="ryBxRecord-info_fryid" type="hidden" name="fry" value="${model.fry}">
                        <input id="ryBxRecord-info_userName" type="text" value="${userName}" disabled="disabled"
                               style="width: 175px;" value="">
					<span class="add-on" onclick="showPjrypicker()"
                          style="padding-top: 2px;   padding-bottom: 2px;"><i class="icon-user"></i></span>
                        <button class="btn btn-small a-search" onclick="searchitem()">查询
                        </button>
                        &nbsp;
                    </div>

                </div>


                <%--<div class="controls">--%>


                <%--</div>--%>


                <%--<form name="xzZjOrder-infoForm" method="post" action="xzZjOrder-info-list.do" class="form-inline">--%>
                <%--<label for="xzZjOrder-info_name"><spring:message code='xzZjOrder-info.xzZjOrder-info.list.search.name' text='名称'/>:</label>--%>
                <%--<input type="text" id="xzZjOrder-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">--%>
                <%--<button class="btn btn-small a-search" onclick="document.xzZjOrder-infoGridForm.submit()">查询</button>&nbsp;--%>
                <%--</form>--%>

            </div>
        </article>

        <article class="m-blank">
            <div class="pull-left">
                <region:region-permission permission="xzZjOrder-info:create">
                    <button class="btn btn-small a-insert" onclick="location.href='xzZjOrder-info-input.do'">新建</button>
                </region:region-permission>

                <region:region-permission permission="xzZjOrder-info：delete">
                    <button class="btn btn-small a-remove" onclick="table.removeAll()"">删除</button>
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
                <h4 class="title"><spring:message code="xzZjOrder-info.xzZjOrder-info.list.title" text="列表"/></h4>
            </header>
            <div class="content">
                <form id="xzZjOrder-infoGridForm" name="xzZjOrder-infoGridForm" method='post'
                      action="xzZjOrder-info-remove.do" class="m-form-blank">
                    <table id="xzZjOrder-infoGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check"><input type="checkbox" name="checkAll"
                                                                        onchange="toggleSelectedItems(this.checked)">
                            </th>
                            <!-- <th class="sorting" name="forderno">订单编号</th> -->
                            <th class="sorting" name="fstatus">状态</th>
                            <th class="sorting" name="fcreatetime">创建时间</th>
                            <th class="sorting" name="fstarttime">开始使用时间</th>
                            <th class="sorting" name="fendtime">使用截止时间</th>
                            <th class="sorting" name="ffzrid">申请人</th>
                            <th class="sorting" name="fxmid">项目</th>
                            <!-- 	<th class="sorting" name="fmemo">备注</th> -->
                            <th class="sorting" name="fbackdate">归还时间</th>
                            <th width="80">&nbsp;</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${page.result}" var="item">
                            <tr>
                                <td><input type="checkbox" class="selectedItem a-check" name="selectedItem"
                                           value="${item.fid}"></td>
                                    <%--  <td>${item.forderno}</td> --%>
                                <td>${item.fstatus}</td>
                                <td>${item.fcreatetime}</td>
                                <td>${item.fstarttime}</td>
                                <td>${item.fendtime}</td>
                                <td>${ryMap[item.ffzrid].fname}</td>
                                <td>${xmMap[item.fxmid].fname}</td>
                                    <%-- <td>${item.fmemo}</td> --%>
                                <td>${item.fbackdate}</td>
                                <td>
                                    <a href="xzZjOrder-info-input.do?id=${item.fid}" class="a-update"><spring:message
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
