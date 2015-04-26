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
    <title><spring:message code="cwBzj-info.cwBzj-info.input.title"
                           text="编辑"/></title>
    <%@include file="/common/s.jsp" %>
    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.css">
    <script type="text/javascript"
            src="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.js"></script>

    <script type="text/javascript">
        $(
                function () {
                    $("#cwBzj-infoForm")
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
                    createjyxmPicker({
                        modalId: 'jyxmPicker',
                        url: '${scopePrefix}/sckf/jyXm-toubiao-simple-list.do'
                    });
                    createryPicker({
                        modalId: 'ryPicker',
                        url: '${scopePrefix}/hr/commRy-simple-list.do'
                    });
                })
    </script>


    <script type="text/javascript">
        $(
                function () {
                    $("#cwBzj-info_fjnbksmoney").change(function () {
                        var Value = (parseFloat($("#cwBzj-info_fjnbksmoney").val()) + parseFloat($("#cwBzj-info_fjnyismoney").val()) + parseFloat($("#cwBzj-info_fjnyingsmoney").val())).toFixed(4);
                        $("#cwBzj-info_fsum_money").html(Value);
                        $("#cwBzj-info_fjnmoney").val(Value);
                    });
                })
        $(
                function () {
                    $("#cwBzj-info_fjnyismoney").change(function () {
                        var Value = (parseFloat($("#cwBzj-info_fjnbksmoney").val()) + parseFloat($("#cwBzj-info_fjnyismoney").val()) + parseFloat($("#cwBzj-info_fjnyingsmoney").val())).toFixed(4);
                        $("#cwBzj-info_fsum_money").html(Value);
                        $("#cwBzj-info_fjnmoney").val(Value);
                    });
                })

        $(
                function () {
                    $("#cwBzj-info_fjnyingsmoney").change(function () {
                        var Value = (parseFloat($("#cwBzj-info_fjnbksmoney").val()) + parseFloat($("#cwBzj-info_fjnyismoney").val()) + parseFloat($("#cwBzj-info_fjnyingsmoney").val())).toFixed(4);
                        $("#cwBzj-info_fsum_money").html(Value);
                        $("#cwBzj-info_fjnmoney").val(Value);
                    });
                })
    </script>


    <style type="text/css">
        * {
            /*font-size:15px;*/
            margin: 0;
            padding: 0;
        }

        fieldset {
            padding: 0 0 0 100px;
            margin: 0 0 0 100px;
            /*width:10px;*/
            color: #333;
            border: #06c dashed 1px;
        }

        legend {
            /*color:#06c;*/
            font-size: 16px;
            font-weight: 500;
            /*background:#fff;*/
        }

        ul {
            list-style-type: none;
            margin: 8px 0 4px 0;
        }

        li {
            margin-top: 4px;
        }
    </style>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="row-fluid">
    <%@include file="/menu/cw-workspace.jsp" %>
    <!-- start of main -->
    <section id="m-main" class="span10">
        <article class="m-widget">
            <header class="header">
                <h4 class="title">
                    <spring:message code="cwBzj-info.cwBzj-info.input.title"
                                    text="编辑"/>
                </h4>
            </header>
            <div class="content content-inner">
                <form id="cwBzj-infoForm" method="post" action="cwBzj-info-tbsave.do"
                     class="form-horizontal">
                    <c:if test="${model != null}">
                        <input id="cwBzj-info_id" type="hidden" name="fid"
                               value="${model.fid}">
                    </c:if>
                    <div class="control-group">
                        <%-- 	<div class="span5">
                    <label class="control-label" for="cwBzj-info_fyzname"><spring:message code="cwBzj-info.cwBzj-info.input.fyzname" text="业主名称"/></label>
                    <div class="controls">
                               <input id="cwBzj-info_fyzname" type="text" name="fyzname" value="${model.fyzname}" size="" class="text " minlength="" maxlength="">
                    </div>
                  </div> --%>
                        <label class="control-label" for="cwBzj-info_fxmid"><spring:message
                                code="cwBzj-info.cwBzj-info.input.fxmid" text="项目名称"/></label>

                        <div class="controls">
                            <div class="input-append jyxmPicker">
                                <input id="cwBzj-info_fxmid" type="hidden" name="fxmid"
                                       value="${model.fxmid}"> <input id="cwBzj-info_xmmc"
                                                                      type="text" value="${xmMap[model.fxmid].fname}"
                                                                      class=" required" style="width: 400px;" value="">
									<span class="add-on"
                                          style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-th-list"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fskdw"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fskdw" text="收款单位"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fskdw" type="text" name="fskdw"
                                       value="${model.fskdw}" size="" class="text " minlength=""
                                       maxlength="">
                            </div>
                        </div>
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fzh"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fzh" text="帐号"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fzh" type="text" name="fzh"
                                       value="${model.fzh}" size="" class="text "
                                       minlength="" maxlength="">
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fkhh"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fkhh" text="开户行"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fkhh" type="text" name="fkhh"
                                       value="${model.fkhh}" size="" class="text " minlength=""
                                       maxlength="">
                            </div>
                        </div>
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fjnmethod"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fjnmethod" text="交纳方式"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fjnmethod" type="text" name="fjnmethod"
                                       value="${model.fjnmethod}" size="" class="text "
                                       maxlength="">
                            </div>
                        </div>
                    </div>
                    <div class="control-group">


                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fjndate"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fjndate" text="最迟交纳日期"/></label>

                            <div class="controls">
                                <!-- datepicker date  -->
                                <div class="input-append " style="padding-left: 0px;">
                                    <input id="cwBzj-info_fjndate" type="text" name="fjndate"
                                           value="${model.fjndate}" size="40" class="text "
                                           style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
                                              style="padding-top: 2px; padding-bottom: 2px;"><i
                                                class="icon-calendar "></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_foprator"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.foprator" text="申请人"/></label>

                            <div class="controls">
                                <div class="input-append ryPicker">
                                    <input id="cwBzj-info_foprator" type="hidden" name="foprator"
                                           value="${model.foprator}"> <input
                                        id="cwBzj-info_userName" type="text"
                                        value="${ryMap[model.foprator].fname}" disabled
                                        class=" required" style="width: 175px;" value=""> <span
                                        class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                        class="icon-user"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fmemo"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fmemo" text="备注"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fmemo" type="text" name="fmemo"
                                       value="${model.fmemo}" size="" class="text " minlength=""
                                       maxlength="">
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fcontentc"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fcontentc" text="代理单位"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fcontentc" type="text" name="fcontentc"
                                       value="${model.fcontentc}" size="" class="text " minlength=""
                                       maxlength="">
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fcontact"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fcontact" text="联系人"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fcontact" type="text" name="fcontact"
                                       value="${model.fcontact}" size="" class="text " minlength=""
                                       maxlength="">
                            </div>
                        </div>
                    </div>


                    <div class="control-group">
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fcontacttel"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fcontacttel" text="联系方式"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fcontacttel" type="text" name="fcontacttel"
                                       value="${model.fcontacttel}" size="" class="text " minlength=""
                                       maxlength="">
                            </div>
                        </div>

                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fissj"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fissj" text="是否有收据"/></label>

                            <div class="controls">
                                <select class="form-control" id="jyXm-info_fissj"
                                        name="fissj" value="${model.fissj}" class=" ">
                                    <option value=""
                                            ></option>
                                    <option value="是"
                                            <c:if test="${model.fissj=='是'}"> selected="selected" </c:if>>是
                                    </option>
                                    <option value="否"
                                            <c:if test="${model.fissj=='否'}"> selected="selected" </c:if>>否
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="span5">
                            <fieldset style="width:200px;">
                                <legend style=" margin-left: -85px; width: 70px;">金额统计</legend>


                                <label class="control-label" for="cwBzj-info_fjnbksmoney" style=" margin-left: -180px;
									   padding-left: -105px;margin-top: -30px">
                                    <spring:message text="不可收金额(元)"/>
                                </label>

                                <div class="controls">
                                    <input id="cwBzj-info_fjnbksmoney" type="number" name="fjnbksmoney"
                                           value="${model.fjnbksmoney}" size="" class="number"
                                           minlength="" maxlength="" style=" margin-left: -180px;margin-bottom: 5px;
									   padding-left: -105px; margin-top: -40px; width: 150px;">
                                </div>

                                <label class="control-label" for="cwBzj-info_fjnyingsmoney" style=" margin-left: -180px;
									   padding-left: -105px; margin-top: -15px;"><spring:message
                                        text="应收金额(元)"/>
                                </label>


                                <div class="controls">
                                    <input id="cwBzj-info_fjnyingsmoney" type="number" name="fjnyingsmoney"
                                           value="${model.fjnyingsmoney}" size="" class="number"
                                           minlength="" maxlength="" style=" margin-left: -180px; margin-bottom: 5px;
									   padding-left: -105px; width: 150px;margin-top: -10px;">
                                </div>

                                <label class="control-label" for="cwBzj-info_fjnyismoney" style=" margin-left: -180px;
									   padding-left: -105px; margin-bottom: 2px;"><spring:message
                                        text="已收金额(元)"/>
                                </label>

                                <div class="controls">
                                    <input id="cwBzj-info_fjnyismoney" type="number" name="fjnyismoney"
                                           value="${model.fjnyismoney}" size="" class="number"
                                           minlength="" maxlength="" style=" margin-left: -180px;
									   padding-left: -5px;
									   padding-left: -100px;width: 150px;margin-top: 3px;">
                                </div>

                                <label class="control-label" for="cwBzj-info_fsum_money" style=" margin-left: -180px;
									padding-left: -105px; margin-top: 0px">
                                    <spring:message text="交纳总和(元)"></spring:message>

                                    <div class="controls">
                                        <label id="cwBzj-info_fsum_money" type="number" name="fsummoney" style=" margin-left: -100px;
									 margin-top: -25px; width: 150px"
                                               ;> ${model.fjnyismoney + model.fjnyingsmoney+ model.fjnbksmoney} </label>
                                    </div>

                            </fieldset>

                            <input id="cwBzj-info_fjnmoney" type="number" name="fjnmoney"
                                   value="${model.fjnyismoney + model.fjnyingsmoney+ model.fjnbksmoney}"
                                   style="display: none">


                        </div>


                        <div class="control-group">
                            <div class="span5 ">
                                <label class="control-label" for="cwBzj-info_fmoneydate"
                                       style="margin-left:30px"><spring:message
                                        code="cwBzj-info.cwBzj-info.input.fmoneydate" text="归还经办人"/></label>

                                <div class="controls">
                                    <div class="input-append ryPicker">
                                        <input id="cwBzj-info_foprator" type="hidden" name="fbackoprator"
                                               value="${model.fbackoprator}" style="margin-left:25px">

                                        <input
                                                id="cwBzj-info_userName" type="text"
                                                value="${ryMap[model.fbackoprator].fname}" disabled
                                                class=" required" style="width: 175px; margin-left:23px" value=""> <span
                                            class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-user"></i></span>
                                    </div>
                                </div>
                            </div>

                            <div class="span5 ">
                                <label class="control-label" for="cwBzj-info_fbzjtype"
                                       style="margin-top: 15px"><spring:message
                                        code="cwBzj-info.cwBzj-info.input.fbzjtype" text="归还到账日期"/></label>

                                <div class="controls">
                                    <div class="input-append datepicker date"
                                         style="padding-left: 0px; margin-top: 15px">
                                        <input id="cwBzj-info_fmoneydate" type="text" name="fbackdate"
                                               value="${model.fbackdate}" size="40" class="text "
                                               style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
                                                  style="padding-top: 2px; padding-bottom: 2px;"><i
                                                    class="icon-calendar"></i></span> <label
                                            style="font-size: 10px;color: red; ">财务部填写</label>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="control-groups">
                        <div class="span5">
                            <label class="control-label" for="cwBzj-info_fmemo4"
                                   style="margin-top: 30px; margin-left: -15px;"><spring:message
                                    code="cwBzj-info.cwBzj-info.input.fmemo4" text="领导意见"/></label>

                            <div class="controls">
                                <input id="cwBzj-info_fmemo4" type="text" name="fmemo4"
                                       value="${model.fmemo4}" size="" class="text " minlength="" readonly
                                       maxlength="" style="margin-top: 30px; margin-left: -20px;">
                            </div>
                        </div>

                        <div class="span5">
                            <div class="control-group" style="margin-top: 15px; margine-right:20px">
                                <label class="control-label" for="cwBzj-info_fmoneydate"
                                       style="padding-left:0px; padding-top:20px"><spring:message
                                        code="cwBzj-info.cwBzj-info.input.fmoneydate" text="交纳日期"/></label>

                                <div class="controls" style="  margin-left: 180px;
                                        margin-top: 10px; width:10px" ;>
                                    <div class="input-append datepicker date"
                                         style="padding-left: -100px;">
                                        <input id="cwBzj-info_fmoneydate" type="text" name="fmoneydate"
                                               value="${model.fmoneydate}" size="40" class="text "
                                               style="background-color:white;cursor:default;  width: 175px;">
									<span class="add-on"
                                          style="padding-top: 2px; padding-bottom: 2px;"><i
                                            class="icon-calendar"></i></span> <label
                                            style="font-size: 10px;color: red; ">财务部填写</label>
                                    </div>
                                </div>
                                <div class="span5 hidden">
                                    <label class="control-label" for="cwBzj-info_fbzjtype"><spring:message
                                            code="cwBzj-info.cwBzj-info.input.fbzjtype" text="保证金类型"/></label>

                                    <div class="controls">
                                        <input id="cwBzj-info_fbzjtype" type="text" name="fbzjtype"
                                               <c:if test="${model!=null }">value="${model.fbzjtype}"</c:if>
                                               value="${type }" size="" class="text required" maxlength="">
                                    </div>
                                </div>
                            </div>
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

                </form>
            </div>

        </article>
    </section>
    <!-- end of main -->
</div>
</body>
</html>
