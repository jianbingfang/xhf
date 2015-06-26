<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
    pageContext.setAttribute("currentMenu", "bpm-process");
%>
<!doctype html>
<html lang="en">
<head>
    <%@include file="/common/meta.jsp" %>
    <title>流程列表</title>
    <%@include file="/common/s.jsp" %>
</head>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">


    $(function () {
        $('.carousel-inner div:first-child').addClass("active");
    });

    $(function () {
        $("#confirmBtn").click(function () {
            getFiles();
        });
    });

    function getFiles() {
        $.each($('.files').children(),
                function (index, node) {
                    $('#pjXmImg-info_fname').val($(node).data("fileName") + "." + $(node).data("fileType"));
                    $('#pjXmImg-info_fimgurl').val($(node).data("fileUrl"));
                });
        $(".uploadModal").modal('hide');
        $(".editModal").css("top", "0");
        $(".editModal").modal();
    }

    function doSubmit() {
        $("#pjXmImg-infoForm").submit();
    }

    function deleteImg(imgId) {
        if (confirm("确认删除？")) {
            $.post('pjXmImg-info-delete.do', {id: imgId}, function () {
                location.reload();
            }).error(function (err) {
                alert('删除失败\n' + err);
            });
        }
    }
</script>
<body>
<%@include file="/header/bpm-workspace.jsp" %>
<div class="row-fluid">
    <%@include file="/menu/jl-workspace.jsp" %>
    <!-- start of main -->
    <section id="m-main" class="span10" style="float:right">
        <%@include file="../comm/comm-upload.jsp" %>
        <!-- <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li style="width: 100%">
                            <div style="float: left;">
                                <a href="jl-home.do">郑东新区商务会展中心项目监理部</a>
                            </div>
                            <div style="float: right;font-size: 13;color: blue;">
                                <a class="bnt" href="#">监理月报下载</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div> -->

        <div class="modal fade editModal" style="width: 800px;top: -100%;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
                        <h4 class="modal-title">添加图片描述</h4>
                    </div>
                    <div class="container">
                        <form id="pjXmImg-infoForm" method="post"
                              action="pjXmImg-info-save.do" class="form-horizontal">
                            <input id="pjXmImg-info_fname" type="hidden" name="fname">
                            <input id="pjXmImg-info_fimgurl" type="hidden" name="fimgurl">

                            <div class="control-group">
                                <label class="control-label" for="pjXmImg-info_fdescribe"><spring:message
                                        code="pjXmImg-info.pjXmImg-info.input.fdescribe" text="图片描述"/></label>

                                <div class="controls">
										<textarea id="pjXmImg-info_fdescribe" name="fdescribe"
                                                  class="form-control" rows="6" style="width: 560px"
                                                  class="text" minlength=""
                                                  maxlength="500">${model.fdescribe}</textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="doSubmit()"
                            id="confirmBtn">确定
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->

        <div class="row-fluid">
            <div class="span12">
                <article class="m-widget">
                    <header class="header">
                        <h4 class="title">项目概况</h4>
                    </header>
                    <table style="font-size: 14px;" cellpadding="8px">
                        <tr style="">
                            <td style="font-weight: bold; float: right; white-space: nowrap;">项目概况:</td>
                            <td style="text-overflow:ellipsis;">
                                ${xmgaikuang}
                            </td>
                        </tr>
                        <tr class="hidden">
                            <td style="font-weight: bold; float: right; white-space: nowrap;">工程进度:</td>
                            <td>
                                <div class="progress progress-success" style="width: 500px; margin-bottom: 0;">
                                    <div class="bar" style="width: 60%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold; float: right; white-space: nowrap;">监理费回收情况:</td>
                            <td>
                                <fmt:formatNumber value="${jlf}" type="currency"/>
                                /
                                <fmt:formatNumber value="${(empty htek) ? 0 : htek}" type="currency"/>
                                &nbsp;&nbsp;-&nbsp;&nbsp;
                                (<fmt:formatNumber value="${(empty htek) ? 0 : (jlf/htek)}" type="percent"/>)
                            </td>
                        </tr>
                    </table>
                </article>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span6">
                <article class="m-widget">
                    <header class="header">
                        <h4 class="title">项目近况图</h4>
                        <input type="button" class="btn btn-primary btn-xs" value="上传" onclick="showUpload()"
                               style="float: right;margin: -2px 0 0 0; padding: 1px 5px;font-size: 10px;">
                    </header>
                    <c:choose>
                        <c:when test="${empty xmImgs}">
                            <h4 style="text-align: center; line-height: 400px; height: 400px;">暂无图片</h4>
                        </c:when>
                        <c:otherwise>
                            <div class="carousel slide" id="carousel-169351">
                                <ol class="carousel-indicators">
                                    <c:forEach items="${xmImgs}" var="item" varStatus="status">
                                        <c:choose>
                                            <c:when test="${status.first}">
                                                <li data-target="#carousel-169351" data-slide-to="${status.index}"
                                                    class="active"></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li data-target="#carousel-169351" data-slide-to="${status.index}"></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ol>
                                <div class="carousel-inner" style="max-height: 410px;">
                                    <c:forEach items="${xmImgs}" var="item" varStatus="status">
                                        <c:choose>
                                            <c:when test="${status.first}">
                                                <div class="item active" style="height: 410px;">
                                                    <img alt="图片获取失败..." src="${item.fimgurl}" width="100%"
                                                         height="100%"
                                                         style="margin: auto 0;"/>

                                                    <div class="carousel-caption">
                                                        <p>${item.fdescribe}<a href="javascript:deleteImg(${item.fid});"
                                                                               style="float: right;">删除</a></p>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="item" style="height: 410px;">
                                                    <img alt="图片获取失败..." src="${item.fimgurl}" width="100%"
                                                         height="100%"
                                                         style="margin: auto 0"/>

                                                    <div class="carousel-caption">
                                                        <p>${item.fdescribe}<a href="javascript:deleteImg(${item.fid});"
                                                                               style="float: right;">删除</a></p>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                                <a class="left carousel-control" href="#carousel-169351"
                                   data-slide="prev"><h5><</h5></a>
                                <a class="right carousel-control" href="#carousel-169351"
                                   data-slide="next"><h5>></h5></a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </article>
            </div>
            <div class="span6">
                <article class="m-widget">
                    <header class="header">
                        <h4 class="title">项目实况 (效果图)</h4>
                    </header>
                    <div id="video-area">
                        <video width="100%" height="100%" controls>
                            <%--<source src="http://www.w3cschool.cc/try/demo_source/movie.mp4" type="video/mp4">--%>

                            <source src="/xhf/s/upload/soho.mp4" type="video/mp4">
                            <%--<source src="http://www.w3cschool.cc/try/demo_source/movie.ogg" type="video/ogg">--%>
                            <%--<source src="http://www.w3cschool.cc/try/demo_source/movie.webm" type="video/webm">--%>
                            <%--<object data="http://www.w3cschool.cc/try/demo_source/movie.mp4" width="100%" height="100%">--%>
                            <%--<embed src="http://www.w3cschool.cc/try/demo_source/movie.swf" width="100%"--%>
                            <%--height="100%">--%>
                            <%--</object>--%>
                        </video>
                    </div>
                </article>
            </div>

            <script>
                function understands_video() {
                    return !!document.createElement('video').canPlayType; // boolean
                }

                if (!understands_video()) {
                    // Must be older browser or IE.
                    // Maybe do something like hide custom
                    // HTML5 controls. Or whatever...
                    $('#video-area').html('<span>您的浏览器不支持视频播放</span><br/>' +
                    '<span>请使用Chrome、Firefox、IE9(或以上)进行观看</span>')
                }

            </script>
            <!-- 	<div class="span6">
                    <article class="m-widget">
                        <header class="header"  style="height:30px;">
                            <h4 class="title">项目进度分析图</h4>
                        </header>
                        <div id="chartdiv" style="width: 100%; height: 400px;"></div>
                    </article>
                </div> -->
        </div>

        <div class="row-fluid">
            <div class="span12">
                <div class="well">
                    <table style="font-size: 14px;" cellpadding="4px">
                        <tr style="">
                            <td style="font-weight: bold; float: right; white-space: nowrap;">总监:</td>
                            <c:forEach items="${zjList}" var="item">
                                <td style="text-overflow:ellipsis;">${item}</td>
                            </c:forEach>
                        </tr>
                        <tr>
                            <td style="font-weight: bold; float: right; white-space: nowrap;">其他监理人员:</td>
                            <c:forEach items="${qtList}" var="item">
                                <td style="text-overflow:ellipsis;">${item}</td>
                            </c:forEach>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </section>
    <!-- end of main -->
</div>
</body>
</html>
