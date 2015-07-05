<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

<head>
    <%@include file="/common/meta.jsp" %>
    <title><spring:message code="jlDept-info.jlDept-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp" %>

    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>

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
            gridFormId: 'pjRy-infoGridForm',
            exportUrl: 'pjRy-info-export.do'
        };

        var table;


        $(function () {

            table = new Table(config);
            table.configPagination('.m-pagination');
            table.configPageInfo('.m-page-info');
            table.configPageSize('.m-page-size');

            $("#jlDept-infoForm").validate({
                submitHandler: function (form) {
                    bootbox.animate(false);
                    var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
                    form.submit();
                },
                errorClass: 'validate-error'
            });

            createxmPicker({
                modalId: 'xmPicker',
                url: '${scopePrefix}/gcgl/pjXm-simple-list.do'
            });

            createryPicker({
                modalId: 'ryPicker',
                url: '${scopePrefix}/hr/commRy-simple-list.do'
            });
        })


        function createNew() {
            if ($('#xzChufa-info_fxmid').val() == '') {
                alert('请先选择项目!');
                return;
            }
            window.location.href = "pjRy-info-input.do?fxmid=" + $('#xzChufa-info_fxmid').val();
        }
    </script>
</head>

<body>
<%@include file="/header.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/gcgl-workspace.jsp" %>

    <!-- start of main -->
    <section id="m-main" class="span10">
        <!--   <div class="container-fluid">
                      <div class="row-fluid">
                          <div class="span12">
                              <ul class="breadcrumb">
                                  <li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
                                  </li>
                                  <li>项目管理<span class="divider">/</span>
                                  </li>
                                  <li class="active">组建项目监理部</li>
                              </ul>
                          </div>
                      </div>
                  </div> -->
        <article class="m-widget">
            <header class="header">
                <h4 class="title"><spring:message code="jlDept-info.jlDept-info.input.title" text="编辑"/></h4>
            </header>

            <div class="content content-inner">

                <form id="jlDept-infoForm" method="post" action="jlDept-info-save.do" class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="jlDept-info_id" type="hidden" name="fid" value="${model.fid}">
                    </c:if>
                    <div class="control-group">
                        <label class="control-label" for="jlDept-info_fxmid"><spring:message
                                code="jlDept-info.jlDept-info.input.fxmid" text="项目"/></label>

                        <div class="controls">
                            <div class="input-append xmPicker">
                                <input id="xzChufa-info_fxmid" type="hidden" name="fxmid"
                                       value="${model.fxmid}"> <input
                                    id="xmBxRecord-info_xmmc" type="text" value="${xmMap[model.fxmid].fxmname}" disabled
                                    class=" required" style="width: 175px;" value=""> <span
                                    class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-th-list"></i></span>
                            </div>
                        </div>
                    </div>

                    <%-- <div class="control-group">
                        <label class="control-label" for="jlDept-info_fname"><spring:message code="jlDept-info.jlDept-info.input.fname" text="监理部名称"/></label>
                        <div class="controls">
                               <input id="jlDept-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">
                        </div>
                      </div> --%>

                    <div class="control-group">
                        <label class="control-label" for="jlDept-info_floginname"><spring:message
                                code="jlDept-info.jlDept-info.input.floginname" text="登录名"/></label>

                        <div class="controls">
                            <input id="jlDept-info_floginname" type="text" name="floginname" value="${model.floginname}"
                                   size="" class="text required" minlength="" maxlength="">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="jlDept-info_floginpass"><spring:message
                                code="jlDept-info.jlDept-info.input.floginpass" text="登录密码"/></label>

                        <div class="controls">
                            <input id="jlDept-info_floginpass" type="password" name="floginpass"
                                   value="${model.floginpass}" size="" class="text required" minlength="" maxlength="">
                        </div>
                    </div>

                    <%--  	<div class="control-group">
                         <label class="control-label" for="jlDept-info_fstatus"><spring:message code="jlDept-info.jlDept-info.input.fstatus" text="状态"/></label>
                         <div class="controls">
                                <input id="jlDept-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text " minlength="" maxlength="">
                         </div>
                       </div>
                         <div class="control-group">
                         <label class="control-label" for="jlDept-info_fmemo"><spring:message code="jlDept-info.jlDept-info.input.fmemo" text="备注"/></label>
                         <div class="controls">
                                <input id="jlDept-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " minlength="" maxlength="">
                         </div>
                       </div>
                         <div class="control-group">
                         <label class="control-label" for="jlDept-info_fmemo1"><spring:message code="jlDept-info.jlDept-info.input.fmemo1" text="备注1"/></label>
                         <div class="controls">
                                <input id="jlDept-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text " minlength="" maxlength="">
                         </div>
                       </div> --%>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn a-submit"><spring:message code='core.input.save'
                                                                                       text='保存'/></button>
                            &nbsp;
                            <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message
                                    code='core.input.back' text='返回'/></button>
                        </div>
                    </div>
                </form>
            </div>
        </article>

    </section>

    <section id="m-main" class="span10">

        <article class="m-blank">
            <div class="pull-left">
                <region:region-permission permission="pjRy-info:create">
                    <button class="btn btn-small a-insert" onclick="createNew()">新建</button>
                </region:region-permission>
                <region:region-permission permission="pjRy-info:delete">
                    <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
                </region:region-permission>
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
                <h4 class="title"><spring:message code="pjRy-info.pjRy-info.list.title" text="列表"/></h4>
            </header>
            <div class="content">
                <form id="pjRy-infoGridForm" name="pjRy-infoGridForm" method='post' action="pjRy-info-remove.do"
                      class="m-form-blank">
                    <table id="pjRy-infoGrid" class="m-table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th width="10" class="m-table-check"><input type="checkbox" name="checkAll"
                                                                        onchange="toggleSelectedItems(this.checked)">
                            </th>
                            <th class="sorting" name="fxmid">项目</th>
                            <th class="sorting" name="fryid">人员</th>
                            <th class="sorting" name="fgangwei">岗位</th>
                            <th class="sorting" name="fstartdate">进入项目时间</th>
                            <th class="sorting" name="fenddate">离开项目时间</th>
                            <th class="sorting" name="ftel">联系方式</th>
                            <th class="sorting" name="fstatus">状态</th>
                            <th width="80">&nbsp;</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${page.result}" var="item">
                            <tr>
                                <td><input type="checkbox" class="selectedItem a-check" name="selectedItem"
                                           value="${item.fid}"></td>
                                <td>${xmMap[item.fxmid].fxmname}</td>
                                <td>${ryMap[item.fryid].fname}</td>
                                <td>${item.fgangwei}</td>
                                <td>${item.fstartdate}</td>
                                <td>${item.fenddate}</td>
                                <td>${item.ftel}</td>
                                <td>${item.fstatus}</td>
                                <td>
                                    <a href="pjRy-info-input.do?id=${item.fid}" class="a-update"><spring:message
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
