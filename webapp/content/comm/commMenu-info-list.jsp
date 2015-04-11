<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sysconf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "auth");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.commMenu-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<link rel="stylesheet" href="${scopePrefix}/s/ztree/css/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="${scopePrefix}/s/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${scopePrefix}/s/ztree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/ztree/js/jquery.ztree.exedit-3.5.js"></script>
<SCRIPT type="text/javascript">
	var setting = {
		view : {
			addHoverDom : addHoverDom,
			removeHoverDom : removeHoverDom,
			selectedMulti : false
		},
		edit : {
			enable : true,
			editNameSelectAll : true,
			//showRemoveBtn: showRemoveBtn,
			//showRenameBtn: showRenameBtn,
			removeTitle : "删除节点",
			renameTitle : "编辑子节点",
		},
		data : {
			keep : {
				parent : true,
			//leaf:true
			},
			key : {
				name : "fname",
			},
			simpleData : {
				enable : true,
				idKey : "fid",
				pIdKey : "fpid",
			// rootPid:null
			}
		},
		callback : {
			beforeDrag : beforeDrag,
			beforeDrop : beforeDrop,
			onDrop : zTreeOnDrop,
			onClick : zTreeOnCheck,
			beforeRemove : beforeRemove,
			onRemove : onRemove
		}
	};
	function showRemoveBtn(treeId, treeNode) {
		return !treeNode.isFirstNode;
	}
/* 	function showRenameBtn(treeId, treeNode) {
		return !treeNode.isLastNode;
	} */

	var newCount = 1;
	function addHoverDom(treeId, treeNode) {
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
			return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_" + treeNode.tId);
		if (btn)
			btn.bind("click", function() {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.addNodes(treeNode, {
					id : (100 + newCount),
					pId : treeNode.id,
					name : "new node" + (newCount++),
					forder : (parseInt(treeNode.children == null ? 0
							: treeNode.children.length) + 1),
				});
				return false;
			});
	};
	function beforeRemove(treeId, treeNode) {
		return confirm("确认删除 节点 -- " + treeNode.fname + " 吗？");
	}
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.tId).unbind().remove();
		//window.location.href = "commMenu-info-remove.do?id="+treeNode.fid+"";

		//alert("a");
		/**
		ajax  处理删除截点
		 **/
	};
	function onRemove(event, treeId, treeNode) {
		$.ajax({
			url : "commMenu-info-remove.do",
			data : {
				id : treeNode.fid
			},
			dataType : 'json',
			success : function(data) {
			}
		});
	}

	function save() {
		alert($("#commMenu-info_id").val());
		$.ajax({
			url : "commMenu-info-save.do",
			data : {
				fid : $("#commMenu-info_id").val(),
				fname : $("#commMenu-info_fname").val(),
				furl : $("#commMenu-info_furl").val(),
				fmenucode : $("#commMenu-info_fmenucode").val(),
				fmemo : $("#commMenu-info_fmemo").val(),
				forder : $("#commMenu-info_forder").val(),
				fpid : $("#commMenu-info_fpid").val(),
			},
			dataType : 'json',
			success : function(data) {
				alert("success");
			}
		});
	}

	function selectAll() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
	}
	function beforeDrag(treeId, treeNodes) {
		for (var i = 0, l = treeNodes.length; i < l; i++) {
			if (treeNodes[i].drag === false) {
				return false;
			}
		}
		return true;
	}
	function beforeDrop(treeId, treeNodes, targetNode, moveType) {
		return targetNode ? targetNode.drop !== false : true;
	}

	function zTreeOnDrop(event, treeId, treeNodes, targetNode, moveType) {
		if (moveType == 'prev') {
			var i = targetNode.forder;
			treeNodes[0].forder = i;
			i++;
			targetNode.forder = i;
		} else if (moveType == 'next' || moveType == 'inner') {
			var j = targetNode.forder;
			j++;
			treeNodes[0].forder = j;
		}
	};

	//var model;
	//右侧显示内容
	function zTreeOnCheck(event, treeId, treeNode) {
		//model = treeNode;
		$("#commMenu-info_id").val(treeNode.fid);
		$("#commMenu-info_fname").val(treeNode.fname);
		$("#commMenu-info_furl").val(treeNode.furl);
		$("#commMenu-info_fmenucode").val(treeNode.fmenucode);
		$("#commMenu-info_fmemo").val(treeNode.fmemo);
		$("#commMenu-info_forder").val(treeNode.forder);
		$("#commMenu-info_fpid").val(treeNode.fpid);
	};
	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, ${page});
	});
//-->
</SCRIPT>
</HEAD>
<BODY>
	<h1>拖拽节点基本控制</h1>
	<h6>[ 文件路径: exedit/drag.html ]</h6>
	<div class="content_wrap">
		<div class="zTreeDemoBackground left">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="right">
			<form id="commMenu-infoForm" method="post" action="commMenu-info-save.do" class="form-horizontal">
				<input id="commMenu-info_id" type="hidden" name="fid"
					value="${model.fid}">
				<div class="control-group">
					<label class="control-label" for="commMenu-info_fname"><spring:message
							code="commMenu-info.commMenu-info.input.fname" text="菜单名称" /></label>
					<div class="controls">
						<input id="commMenu-info_fname" type="text" name="fname"
							value="${model.fname}" size="" class="text required" minlength=""
							maxlength="">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="commMenu-info_furl"><spring:message
							code="commMenu-info.commMenu-info.input.furl" text="菜单url" /></label>
					<div class="controls">
						<textarea id="commMenu-info_furl" name="furl" class="form-control"
							rows="6" style="width: 560px" class="text  " minlength=""
							maxlength="512">${model.furl}</textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="commMenu-info_fmenucode"><spring:message
							code="commMenu-info.commMenu-info.input.fmenucode" text="菜单代码" /></label>
					<div class="controls">
						<textarea id="commMenu-info_fmenucode" name="fmenucode"
							class="form-control" rows="6" style="width: 560px" class="text  "
							minlength="" maxlength="512">${model.fmenucode}</textarea>
					</div>
				</div>
				<%-- 	<div class="control-group">
					<label class="control-label" for="commMenu-info_fpid"><spring:message
							code="commMenu-info.commMenu-info.input.fpid" text="父级菜单" /></label>
					<div class="controls"> --%>
				<input id="commMenu-info_fpid" type="hidden" name="fpid"
					value="${model.fpid}" size="" class="number " minlength=""
					maxlength="">
				<!-- 	</div>
				</div> -->
				<div class="control-group">
					<label class="control-label" for="commMenu-info_fmemo"><spring:message
							code="commMenu-info.commMenu-info.input.fmemo" text="备注" /></label>
					<div class="controls">
						<input id="commMenu-info_fmemo" type="text" name="fmemo"
							value="${model.fmemo}" size="" class="text " minlength=""
							maxlength="">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="commMenu-info_forder"><spring:message
							code="commMenu-info.commMenu-info.input.forder" text="排序" /></label>
					<div class="controls">
						<input id="commMenu-info_forder" type="text" name="forder"
							value="${model.forder}" size="" class="text " minlength=""
							maxlength="">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
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
</BODY>
</html>
