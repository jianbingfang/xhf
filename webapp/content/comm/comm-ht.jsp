<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="zh">
   <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <head>
	
  </head>
  
  <script type="text/javascript">
  function showht(){
	  $(":reset").click();
	  $(".uploadModal").modal();
  }
  </script>

 <div class="modal fade uploadModal" style="width: 800px" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
			<h4 class="modal-title">上传</h4>
		</div>
	 <div class="container">
	<div class="content content-inner">

					<form id="commHt-infoForm" method="post"
						action="commHt-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="commHt-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>


						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fprojectname"><spring:message
										code="commHt-info.commHt-info.input.fprojectname" text="项目名称" /></label>
								<div class="controls">
									<div class="input-append xmPicker">
										<input id="commHt-info_fprojectname" type="hidden"
											name="fprojectname" value="${model.fprojectname}"> <input
											id="xmBxRecord-info_xmmc" type="text"
											value="${xmMap[model.fprojectname].fxmname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-th-list"></i></span>
									</div>

								</div>
							</div>
                           <div class="span5">
								<label class="control-label" for="commHt-info_fhetongno"><spring:message
										code="commHt-info.commHt-info.input.fhetongno" text="合同编号" /></label>
								<div class="controls">
									<input id="commHt-info_fhetongno" type="text" name="fhetongno"
										value="${model.fhetongno}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fscale"><spring:message
										code="commHt-info.commHt-info.input.fscale" text="工程规模" /></label>
								<div class="controls">
									<input id="commHt-info_fprojecttype" type="text" name="fscale"
										value="${model.fscale}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
                            <div class="span5">
								<label class="control-label" for="commHt-info_fadrr"><spring:message
										code="commHt-info.commHt-info.input.fadrr" text="项目地址" /></label>
								<div class="controls">
									<input id="commHt-info_fadrr" type="text" name="fadrr"
										value="${model.fadrr}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							
						</div>

					

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fprojecttype"><spring:message
										code="commHt-info.commHt-info.input.fprojecttype" text="工程类别" /></label>
								<div class="controls">
										<select class="form-control" id="jyXm-info_fprojecttype"
												name="fprojecttype" value="${model.fprojecttype}" class=" required">
												
													<option value="房屋建筑工程"
											<c:if test="${model.fprojecttype=='房屋建筑工程'}"> selected="selected"  </c:if>>房屋建筑工程</option>
											<option value="市政公用工程"
											<c:if test="${model.fprojecttype=='市政公用工程'}"> selected="selected"  </c:if>>市政公用工程</option>
											<option value="电力工程"
											<c:if test="${model.fprojecttype=='电力工程'}"> selected="selected"  </c:if>>电力工程</option>
										<option value="冶炼工程"
											<c:if test="${model.fprojecttype=='冶炼工程'}"> selected="selected"  </c:if>>冶炼工程</option>
											<option value="公路工程"
											<c:if test="${model.fprojecttype=='公路工程'}"> selected="selected"  </c:if>>公路工程</option>
										<option value="矿山工程"
											<c:if test="${model.fprojecttype=='矿山工程'}"> selected="selected"  </c:if>>矿山工程</option>
										<option value="化工石油工程"
											<c:if test="${model.fprojecttype=='化工石油工程'}"> selected="selected"  </c:if>>化工石油工程</option>
										<option value="水利水电工程"	
											<c:if test="${model.fprojecttype=='水利水电工程'}"> selected="selected"  </c:if>>水利水电工程</option>
										<option value="农林工程"
											<c:if test="${model.fprojecttype=='农林工程'}"> selected="selected"  </c:if>>农林工程</option>
										<option value="铁路工程"
											<c:if test="${model.fprojecttype=='铁路工程'}"> selected="selected"  </c:if>>铁路工程</option>
										<option value="港口与航道工程"
											<c:if test="${model.fprojecttype=='港口与航道工程'}"> selected="selected"  </c:if>>港口与航道工程</option>
										<option value="航天航空工程"
											<c:if test="${model.fprojecttype=='航天航空工程'}"> selected="selected"  </c:if>>航天航空工程</option>
										<option value="通信工程"
											<c:if test="${model.fprojecttype=='通信工程'}"> selected="selected"  </c:if>>通信工程</option>
										<option value="机电安装工程"
											<c:if test="${model.fprojecttype=='机电安装工程'}"> selected="selected"  </c:if>>机电安装工程</option>
											</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fywtype"><spring:message
										code="commHt-info.commHt-info.input.fywtype" text="业务类型" /></label>
								<div class="controls">
									<select class="form-control" id="commHt-info_fywtype"
										name="fywtype" value="${model.fywtype}" class=" ">
										<option value="工程管理"
											<c:if test="${model.fywtype}=='工程管理'}"> selected="selected"  </c:if>>工程管理</option>
										<option value="项目管理"
											<c:if test="${model.fywtype}=='项目管理'}"> selected="selected"  </c:if>>项目管理</option>
									</select>
								</div>
							</div>
						</div>
						
	                 <div class="control-group">
						<div class="span5">
								<label class="control-label" for="commHt-info_fjiafang"><spring:message
										code="commHt-info.commHt-info.input.fjiafang" text="业主" /></label>
								<div class="controls">
									<input id="commHt-info_fjiafang" type="text" name="fjiafang"
										value="${model.fjiafang}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="commHt-info_ftotalMoney"><spring:message
										code="commHt-info.commHt-info.input.ftotalMoney" text="项目总投资" /></label>
								<div class="controls">
									<input id="commHt-info_ftotalMoney" type="text"
										name="ftotalMoney" value="${model.ftotalMoney}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
                            <div class="span5">
										<label class="control-label" for="jyXm-info_fcity"><spring:message
												code="jyXm-info.jyXm-info.input.fcity" text="所属城市" /></label>
										<div class="controls">
											<select id="jyXm-info_fprovince" type="text" name="fprovince"
												value="${model.fprovince}" style="width:100px;"></select>省 <select
												id="jyXm-info_fcity" type="text" name="fcity"
												value="${model.fcity}" style="width:100px;"></select>市
										</div>
									</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fgettype"><spring:message
										code="commHt-info.commHt-info.input.fgettype" text="获取方式" /></label>
								<div class="controls">
									<select class="form-control" id="commHt-info_fgettype"
										name="fgettype" value="${model.fgettype}" class=" ">
										<option value="公开投标"
											<c:if test="${model.fgettype}=='公开投标'}"> selected="selected"  </c:if>>公开投标</option>
										<option value="直接签订"
											<c:if test="${model.fgettype}=='直接签订'}"> selected="selected"  </c:if>>直接签订</option>
										<option value="竞争性谈判"
											<c:if test="${model.fgettype}=='竞争性谈判'}"> selected="selected"  </c:if>>竞争性谈判</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fstartdate"><spring:message
										code="commHt-info.commHt-info.input.fstartdate" text="合同开工时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commHt-info_fstartdate" type="text"
											name="fstartdate" value="${model.fstartdate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fenddate"><spring:message
										code="commHt-info.commHt-info.input.fenddate" text="合同竣工时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commHt-info_fenddate" type="text" name="fenddate"
											value="${model.fenddate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							</div>
							
						<div class="control-group">
	                       <div class="span5">
								<label class="control-label" for="commHt-info_fpaytype"><spring:message
										code="commHt-info.commHt-info.input.fpaytype" text="付款方式" /></label>
								<div class="controls">
									<textarea id="commHt-info_fpaytype"  name="fpaytype" rows="3" 
										value="${model.fpaytype}" size="" class="text " minlength=""
										maxlength=""></textarea>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fjianlifei"><spring:message
										code="commHt-info.commHt-info.input.fjianlifei" text="监理费(万元)" /></label>
								<div class="controls">
									<input id="commHt-info_fjiafang" type="text" name="fjianlifei"
										value="${model.fjianlifei}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fjianlifeilv"><spring:message
										code="commHt-info.commHt-info.input.fjianlifeilv" text="监理费率" /></label>
								<div class="controls">
									<input id="commHt-info_fjianlifeilv" type="text"
										name="fjianlifeilv" value="${model.fjianlifeilv}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
						<div class="span5">
								<label class="control-label" for="commHt-info_fqiandingstatus"><spring:message
										code="commHt-info.commHt-info.input.fqiandingstatus"
										text="签订状态" /></label>
								<div class="controls">
									<select class="form-control" id="commHt-info_fqiandingstatus"
										name="fqiandingstatus" value="${model.fqiandingstatus}"
										class=" ">
										<option value="未起草"
											<c:if test="${model.fqiandingstatus=='未起草'}"> selected="selected"  </c:if>>未起草</option>
										<option value="已经起草"
											<c:if test="${model.fqiandingstatus=='已经起草'}"> selected="selected"  </c:if>>已经起草</option>
										<option value="合同谈判"
											<c:if test="${model.fqiandingstatus=='合同谈判'}"> selected="selected"  </c:if>>合同谈判</option>
										<option value="会签通过"
											<c:if test="${model.fqiandingstatus=='会签通过'}"> selected="selected"  </c:if>>会签通过</option>
										<option value="业主签章"
											<c:if test="${model.fqiandingstatus=='业主签章'}"> selected="selected"  </c:if>>业主签章</option>
										<option value="返还归档"
											<c:if test="${model.fqiandingstatus=='返还归档'}"> selected="selected"  </c:if>>返还归档</option>
									</select>
								</div>
							</div>

						<div class="control-group">
						<div class="span5">
								<label class="control-label" for="commHt-info_fqicaoren"><spring:message
										code="commHt-info.commHt-info.input.fqicaoren" text="起草人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commHt-info_fqicaoren" type="hidden"
											name="fzhubanren" value="${model.fqicaoren}"> <input
											id="ryBxRecord-info_fqicaoren" type="text"
											value="${ryMap[model.fqicaoren].fname}" disabled
											class=" required" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fqicaodate"><spring:message
										code="commHt-info.commHt-info.input.fqicaodate" text="起草时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commHt-info_fqicaodate" type="text"
											name="fqicaodate" value="${model.fqicaodate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>

							
						</div>

						<div class="control-group">
						<div class="span5">
								<label class="control-label" for="commHt-info_fqiandingren"><spring:message
										code="commHt-info.commHt-info.input.fqiandingren" text="签订人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commHt-info_fqiandingren" type="hidden"
											name="fqiandingren" value="${model.fqiandingren}"> <input
											id="ryBxRecord-info_fqiandingren" type="text"
											value="${ryMap[model.fqiandingren].fname}" disabled
											class=" required" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fqiandingdate"><spring:message
										code="commHt-info.commHt-info.input.fqiandingdate" text="签订时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commHt-info_fqiandingdate" type="text"
											name="fqiandingdate" value="${model.fqiandingdate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>

							
						</div>


						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_ftanpanren"><spring:message
										code="commHt-info.commHt-info.input.ftanpanren" text="谈判人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commHt-info_ftanpanren" type="hidden"
											name="ftanpanren" value="${model.ftanpanren}"> <input
											id="ryBxRecord-info_fqiandingren" type="text"
											value="${ryMap[model.ftanpanren].fname}" disabled
											class=" required" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
	<div class="span5">
								<label class="control-label" for="commHt-info_fyezhuhetongno"><spring:message
										code="commHt-info.commHt-info.input.fyezhuhetongno"
										text="业主合同编号" /></label>
								<div class="controls">
									<input id="commHt-info_fyezhuhetongno" type="text"
										name="fyezhuhetongno" value="${model.fyezhuhetongno}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
						
						</div>



						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fzhubanren"><spring:message
										code="commHt-info.commHt-info.input.fzhubanren" text="负责人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commHt-info_fzhubanren" type="hidden"
											name="fzhubanren" value="${model.fzhubanren}"> <input
											id="ryBxRecord-info_fqiandingren" type="text"
											value="${ryMap[model.fzhubanren].fname}" disabled
											class=" required" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="commHt-info_fzongjian"><spring:message
										code="commHt-info.commHt-info.input.fzongjian" text="总监" /></label>
								<div class="controls">
								<div class="input-append ryPicker">
										<input id="commHt-info_fzongjian" type="hidden"
											name="fzongjian" value="${model.fzongjian}"> <input
											id="ryBxRecord-info_fzongjian" type="text"
											value="${ryMap[model.fzongjian].fname}" disabled
											class=" required" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn a-submit">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
						</div>
					</form>
				</div>
	</div>
	 <div class="modal-footer">
	 	<button type="button" class="btn btn-primary" id="confirmBtn">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
	 </div>
  </div>
</div>



  </body>

</html>
