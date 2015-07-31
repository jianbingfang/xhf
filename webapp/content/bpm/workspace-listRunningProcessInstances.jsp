<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%pageContext.setAttribute("currentHeader", "bpm-workspace");%>
<%pageContext.setAttribute("currentMenu", "bpm-process");%>
<!doctype html>
<html lang="en">

<head>
    <%@include file="/common/meta.jsp" %>
    <title>流程列表</title>
    <%@include file="/common/s.jsp" %>
</head>

<body>
<%@include file="/header/bpm-workspace.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/bpm-workspace.jsp" %>

    <!-- start of main -->
    <section id="m-main" class="span10" style="float:right">

        <article class="m-widget">
            <header class="header">
                <h4 class="title">列表</h4>
            </header>
            <div class="content">

                <table id="demoGrid" class="m-table table-hover table-bordered">
                    <thead>
                    <tr>
                        <th class="sorting" name="id">编号</th>
                        <th class="sorting" name="name">流程定义</th>
                        <th class="sorting" name="createTime">创建时间</th>
                        <th class="sorting" name="endTime">结束时间</th>
                        <th class="sorting" name="assignee">负责人</th>
                        <th width="170">&nbsp;</th>
                    </tr>
                    </thead>
                    <script>
                        function endProcessInstance(processInstanceId) {
                            if (confirm('确认终止该流程？')) {
                                $.post('${scopePrefix}/bpm/workspace-endProcessInstance.do?processInstanceId=' + processInstanceId,
                                        function (status) {
                                            if (status === 1) {
                                                $('#process-' + processInstanceId).remove();
                                            } else {
                                                alert('删除失败！');
                                            }
                                        }
                                );
                            }
                        }
                    </script>
                    <tbody>
                    <c:forEach items="${historicProcessInstances}" var="item">
                        <tr id="process-${item.id}">
                            <td>${item.id}</td>
                            <td>${item.processDefinitionId}</td>
                            <td><fmt:formatDate value="${item.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${item.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><tags:user userId="${item.startUserId}"/></td>
                            <td>
                                <a href="workspace-viewHistory.do?processInstanceId=${item.id}">历史</a>
                                <a href="#" onclick="endProcessInstance(${item.id})">终止</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </article>

    </section>
    <!-- end of main -->
</div>

</body>

</html>
