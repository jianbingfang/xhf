<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
    pageContext.setAttribute("currentMenu", "xz-da");
%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message
            code="xzZbtzs-info.xzZbtzs-info.input.title" text="中标通知书 - 公司档案管理 - 行政管理"/></title>
    <%@include file="/common/s.jsp" %>
    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <script type="text/javascript">
        $(
                function () {
                    $("#xzZbtzs-infoForm")
                            .validate(
                            {
                                submitHandler: function (form) {
                                    bootbox.animate(false);
                                    var box = bootbox
                                            .dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
                                    form.submit();
                                },
                                errorClass: 'validate-error'
                            });
                    createryPicker({
                        modalId: 'ryPicker',
                        url: '${scopePrefix}/hr/commRy-simple-list.do'
                    });

                    $("#confirmBtn").click(function () {
                        saveFile();
                    });

                    loadFujian($('#xzZbtzs-info_id').val());

                });
        function addScanFile() {
            if (!$('#xzZbtzs-info_id').val()) {
                alert("请先保存证件信息！");
                return;
            }
            showUpload();
        }

        var table;

        function saveFile() {
            var fujianFiles = new Array();
            $.each($('.files').children(), function (index, node) {
                var file = {
                    fname: $(node).data("fileName") + "."
                    + $(node).data("fileType"),
                    furl: $(node).data("fileUrl")
                };
                fujianFiles.push(file);
            });

            $.ajax({
                url: '${scopePrefix}/xz/saveZjScan.do',
                contentType: 'application/x-www-form-urlencoded; charset=utf-8',
                type: 'POST',
                data: {
                    zjId: $('#xzZbtzs-info_id').val(),
                    jlFujians: JSON.stringify(fujianFiles),
                    tableName: 't_xz_zbtzs'
                },

                async: false,
                success: function (data) {
                    if (data = 'ok') {
                        loadScanFile($('#xzZbtzs-info_id').val());
                    }
                }
            });
            $(".uploadModal").modal('hide');
        }

        function deleteImg(id) {
            $.ajax({
                url: '${scopePrefix}/xz/deleteImg.do',
                contentType: 'application/x-www-form-urlencoded; charset=utf-8',
                type: 'POST',
                data: {
                    fjId: id,
                },
                async: false,
                success: function (data) {
                    if (data = 'ok') {
                        loadScanFile($('#xzZbtzs-info_id').val());
                    }
                }
            });
        }

        function rowClick() {
            $('#ryzjtid').css("background-color", "red");
            $(this).css("background-color", "green");
        }

        function loadFujian(zjid) {
            $('#ryzjtid tr').css("background-color", "white");
            $('[trid=' + zjid + ']').css("background-color", "yellow");
            loadScanFile(zjid);
        }

        function showImg(url) {
            $('#scanFileid').attr('src', url);
        }
        function loadScanFile(zjid) {
            editZjid = zjid;

            $('#zjids').append('<tr>aa</tr>');
            $
                    .ajax({
                        url: '${scopePrefix}/comm/fujianlist.do',
                        data: {
                            fmainid: zjid,
                            fmaintable: 't_xz_zbtzs'
                        },
                        dataType: 'json',
                        async: false,
                        success: function (data) {
                            $('#zjids').empty();
                            for (var i = 0; i < data.length; i++) {
                                $('#zjids')
                                        .append(
                                        '<tr>'
                                        + '<td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="' + data[i].fid + '"></td>'
                                        + '<td><a href="javascript:void(0);" class="a-update" onclick="showImg(\''
                                        + data[i].furl
                                        + '\')"> '
                                        + data[i].fname
                                        + ' </a></td>'
                                        + '<td><a href="javascript:void(0);" class="a-update" onclick="deleteImg(\''
                                        + data[i].fid + '\')"> 删除'
                                        + ' </a></td>' + '</tr>');
                            }
                        }
                    });
            $('#zjids')
                    .append(
                    '<tr id="addFujian">'
                    + '<td><input type="button" class="btn btn-link"  onclick="addScanFile()" value="添加扫描件..."></td>'
                    + '</tr>');
        }
    </script>
</head>

<body>
<%@include file="/header.jsp" %>
<%@include file="../comm/comm-upload.jsp" %>
<div class="row-fluid">
    <%@include file="/menu/xz-workspace.jsp" %>

    <!-- start of main -->
    <section id="m-main" class="span10">
        <!-- <div class="container-fluid">
                        <div class="row-fluid">
                            <div class="span12">
                                <ul class="breadcrumb">
                                    <li><a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
                                    </li>
                                    <li>公司档案管理<span class="divider">/</span>
                                    </li>
                                    <li class="active">中标通知书</li>
                                </ul>
                            </div>
                        </div>
                    </div> -->
        <article class="m-widget">
            <header class="header">
                <h4 class="title">
                    <spring:message code="xzZbtzs-info.xzZbtzs-info.input.title"
                                    text="编辑"/>
                </h4>
            </header>

            <div class="content content-inner">

                <form id="xzZbtzs-infoForm" method="post"
                      action="xzZbtzs-info-save.do" class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="xzZbtzs-info_id" type="hidden" name="fid"
                               value="${model.fid}">
                    </c:if>
                    <div class="control-group">
                        <div class="span6">
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_fcode"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fcode" text="编号"/></label>

                                <div class="controls">
                                    <input id="xzZbtzs-info_fcode" type="text" name="fcode" style="width: 300px"
                                           value="${model.fcode}" size="" class="text required"
                                            >
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_fxmname"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fxmname" text="项目名称"/></label>

                                <div class="controls">
                                    <input id="xzZbtzs-info_fxmname" type="text" name="fxmname" style="width: 300px"
                                           value="${model.fxmname}" size="" class="text required"
                                            >
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_ffzdw"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.ffzdw" text="发证单位"/></label>

                                <div class="controls">
                                    <input id="xzZbtzs-info_ffzdw" name="ffzdw" style="width: 300px" type="text"
                                           class="text  required" maxlength="200" value="${model.ffzdw}">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_fzongjian"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fzongjian" text="总监"/></label>

                                <div class="controls">
                                    <div class="input-append ryPicker">
                                        <input id="xzZbtzs-info_fzongjian" type="hidden" name="fzongjian"
                                               value="${model.fzongjian}"> <input
                                            id="xzZbtzs-info_username" type="text"
                                            value="${ryMap[model.fzongjian].fname}"
                                            disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
                                          style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-user"></i></span>
                                    </div>

                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_ffzrq"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.ffzrq" text="发证日期"/></label>

                                <div class="controls">
                                    <div class="input-append datepicker date"
                                         style="padding-left: 0px;">
                                        <input id="xzZbtzs-info_ffzrq" type="text" name="ffzrq"
                                               value="${model.ffzrq}" size="40" class="text required"
                                               style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
                                          style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-calendar"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_fzbje"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fzbje" text="中标金额（元）"/></label>

                                <div class="controls">
                                    <input id="xzZbtzs-info_fzbje" type="number" name="fzbje"
									value="${model.fzbje}"  class="number   "
                                           maxlength="">
                                </div>
                            </div>

                            <div class="control-group">
							<label class="control-label" for="xzZbtzs-info_fzbje"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fzbje" text="中标费率"/></label>

                                <div class="controls">
                                    <input id="xzZbtzs-info_fzbfl" type="text" name="fzbfl"
												   value="${model.fzbfl}"  class="text"
                                           maxlength="">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_fjdjg"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fjdjg" text="监督机构"/></label>

                                <div class="controls">
                                    <input id="xzZbtzs-info_fjdjg" type="text" name="fjdjg"
                                           value="${model.fjdjg}" size="" class="text "/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_fzkstate"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fzkstate" text="在库状态"/></label>

                                <div class="controls">
                                    <select class="form-control" id="xzZbtzs-info_fzkstate" name="fzkstate">
                                        <option value="在库"  <c:if
                                                test="${model.fzkstate=='在库'}"> selected="selected" </c:if>>在库
                                        </option>
                                        <option value="未在库"  <c:if
                                                test="${model.fzkstate=='未在库'}"> selected="selected" </c:if>>未在库
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_ffzwz"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.ffzwz" text="放置位置"/></label>

                                <div class="controls">
                                    <input id="xzZbtzs-info_ffzwz" type="text" name="ffzwz"
                                           value="${model.ffzwz}" size="" class="text required"
                                           maxlength="">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xzZbtzs-info_fmemo"><spring:message
                                        code="xzZbtzs-info.xzZbtzs-info.input.fmemo" text="备注"/></label>

                                <div class="controls">
								<textarea id="xzZbtzs-info_fmemo" name="fmemo"
                                          class="form-control" rows="6"
                                          class="text  " maxlength="200">${model.fmemo}</textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn a-submit">
                                        <spring:message code='core.input.save' text='保存'/>
                                    </button>
                                    &nbsp;
                                    <button type="button" class="btn a-cancel"
                                            onclick="history.back();">
                                        <spring:message code='core.input.back' text='返回'/>
                                    </button>
                                </div>
                            </div>
                        </div>
                </form>
                <div class="span6">
                    <div class="control-group">
                        <article class="m-widget">
                            <header class="header">
                                <h4 class="title">
                                    <spring:message code="hrRyZj-info.hrRyZj-info.list.title"
                                                    text="扫描件列表"/>
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
                                                    onchange="toggleSelectedItems(this.checked)"></th>
                                            <th class="sorting" name="xmjmc">扫描件名称</th>
                                            <th width="80">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody id="zjids">
                                        <%-- 	<c:forEach items="${page.result}" var="item">
                                                <tr>
                                                    <td><input type="checkbox"
                                                        class="selectedItem a-check" name="selectedItem"
                                                        value="${item.fid}"></td>
                                                    <td><a href="hrRyZj-info-input.do?id=${item.fid}"
                                                        class="a-update"> ${item.fzhuanye} </a></td>
                                                </tr>
                                            </c:forEach> --%>
                                        <tr id="addFujian">
                                            <td></td>
                                            <td><input type="button" class="btn btn-link"
                                                       onclick="addScanFile()" value="添加扫描件..."></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </article>
                    </div>
                    <div class="control-group">
                        <article class="m-widget">
                            <header class="header">
                                <h4 class="title">
                                    <spring:message code="hrRyZj-info.hrRyZj-info.list.title"
                                                    text="扫描件缩略图"/>
                                </h4>
                            </header>
                            <div class="content">
                                <img id="scanFileid" alt="140x140"
                                     src="../s/xthena/img/photo.png"/>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </article>

    </section>
    <!-- end of main -->
</div>

</body>

</html>
