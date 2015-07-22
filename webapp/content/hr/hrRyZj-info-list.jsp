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
                /* 		'filter_LIKES_fname' : '${param.filter_LIKES_fname}', */
                'filter_GTD_fyxjs': '${param.filter_GTD_fyxjs}',
                'filter_LTD_fyxjs': '${param.filter_LTD_fyxjs}'
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
            window.open("hrRyZj-info-input.do?id=" + id);
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
                    <!--  <input type="text" style="width: 120px" id="hrRyZj-info_name"
							name="filter_LIKES_name" value="${param.filter_LIKES_name}">-->
                    <input id="hrRyZj-info_name"
                           name="filter_LIKES_name" type="text"
                           value="${param.filter_LIKES_name}"
                           style="width: 120px;">
                    <label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='编号'/>:</label>
                    <input type="text" style="width: 120px" id="hrRyZj-info_name"
                           name="filter_LIKES_fzhengjianno"
                           value="${param.filter_LIKES_fzhengjianno}"/>
                    <label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='专业'/>:</label>
                    <input type="text" style="width: 120px" id="hrRyZj-info_fzhuanye"
                           name="filter_LIKES_fzhuanye"
                           value="${param.filter_LIKES_fzhuanye}"/>
                    <%--<label for="hrRyZj-info_name"><spring:message--%>
                    <%--code='hrRyZj-info.hrRyZj-info.list.search.name' text='证书名称'/>:</label>--%>
                    <%--<select class="form-control" id="hrRyZj-info_name"--%>
                    <%--name="filter_LIKES_fname" value="${param.filter_LIKES_fname}"--%>
                    <%--class=" " style="width: 120px">--%>
                    <%--<c:forEach items="${zjInfos}" var="item">--%>
                    <%--<option value="${item.fname}" selected>${item.fname}</option>--%>
                    <%--</c:forEach>--%>

                    <%--<option></option>--%>
                    <%--<option value="身份证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='身份证'}"> selected="selected"  </c:if>>身份证</option>--%>
                    <%--<option value="毕业证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='毕业证'}"> selected="selected"  </c:if>>毕业证</option>--%>
                    <%--<option value="监理工程师注册证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='监理工程师注册证'}"> selected="selected"  </c:if>>监理工程师注册证</option>--%>
                    <%--<option value="监理工程师资格证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='监理工程师资格证'}"> selected="selected" </c:if>>监理工程师资格证</option>--%>
                    <%--<option value="一级建造师注册证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='一级建造师注册证'}"> selected="selected"  </c:if>>一级建造师注册证</option>--%>
                    <%--<option value="一级建造师资格证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='一级建造师资格证'}"> selected="selected"  </c:if>>一级建造师资格证</option>--%>
                    <%--<option value="一级建造师继续教育证"--%>
                    <%--<c:if test="${param.fname=='一级建造师继续教育证'}"> selected="selected"  </c:if>>一级建造师继续教育证</option>--%>
                    <%--<option value="二级建造师注册证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='二级建造师注册证'}"> selected="selected"  </c:if>>二级建造师注册证</option>--%>
                    <%--<option value="二级建造师资格证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='二级建造师资格证'}"> selected="selected"  </c:if>>二级建造师资格证</option>--%>
                    <%--<option value="造价师注册证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='造价师注册证'}"> selected="selected" </c:if>>造价师注册证</option>--%>
                    <%--<option value="造价师资格证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='造价师资格证'}"> selected="selected"  </c:if>>造价师资格证</option>--%>
                    <%--<option value="造价师继续教育证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='造价师继续教育证'}"> selected="selected"  </c:if>>造价师继续教育证</option>--%>
                    <%--<option value="交通部监理工程师资格证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='交通部监理工程师资格证'}"> selected="selected"  </c:if>>交通部监理工程师资格证</option>--%>
                    <%--<option value="交通部监理工程师注册证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='交通部监理工程师注册证'}"> selected="selected"  </c:if>>交通部监理工程师注册证</option>--%>
                    <%--<option value="专业监理工程师证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='专业监理工程师证'}"> selected="selected" </c:if>>专业监理工程师证</option>--%>
                    <%--<option value="高级工程师职称证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='高级工程师职称证'}"> selected="selected"  </c:if>>高级工程师职称证</option>--%>
                    <%--<option value="中级工程师职称证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='中级工程师职称证'}"> selected="selected"  </c:if>>中级工程师职称证</option>--%>
                    <%--<option value="初级工程师职称证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='初级工程师职称证'}"> selected="selected"  </c:if>>初级工程师职称证</option>--%>
                    <%--<option value="监理员证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='监理员证'}"> selected="selected"  </c:if>>监理员证</option>--%>
                    <%--<option value="资料员证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='资料员证'}"> selected="selected" </c:if>>资料员证</option>--%>
                    <%--<option value="见证员证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='见证员证'}"> selected="selected"  </c:if>>见证员证</option>--%>
                    <%--<option value="安全员证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='安全员证'}"> selected="selected"  </c:if>>安全员证</option>--%>
                    <%--<option value="造价员证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='造价员证'}"> selected="selected"  </c:if>>造价员证</option>--%>
                    <%--<option value="试验员证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='试验员证'}"> selected="selected"  </c:if>>试验员证</option>--%>
                    <%--<option value="建筑节能培训证"--%>
                    <%--<c:if test="${param.filter_LIKES_fname=='建筑节能培训证'}"> selected="selected" </c:if>>建筑节能培训证</option>--%>
                    <%--</select>--%>


                    <%--<label for="hrRyZj-info_name"><spring:message
                            code='hrRyZj-info.hrRyZj-info.list.search.name' text='到期时间'/>:</label>

                    <div class="input-append datepicker date"
                         style="padding-left: 0px;">
                        <input id="hrRyZj-info_fyxjs" style="width: 120px" type="text"
                               name="filter_GTD_fyxjs" value="${param.filter_GTD_fyxjs}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
                                  style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                    </div>
                    <div class="input-append datepicker date"
                         style="padding-left: 0px;">
                        <input id="hrRyZj-info_fyxjs" style="width: 120px" type="text"
                               name="filter_LTD_fyxjs" value="${param.filter_LTD_fyxjs}"
                               size="40" class="text "
                               style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
                                  style="padding-top: 2px; padding-bottom: 2px;"><i
                                    class="icon-calendar"></i></span>
                    </div>--%>
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
                                                style="background-color: #EEEEEE" class='a'>
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
                            <div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>
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
