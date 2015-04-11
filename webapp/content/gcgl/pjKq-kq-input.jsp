<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlShiqian-info.jlShiqian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
    
var config = {
	    id: 'pjKq-infoGrid',
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
		gridFormId: 'pjKq-infoGridForm',
		exportUrl: 'pjKq-info-export.do'
	};

var table;
    	
$(function() {
    $("#jlShiqian-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
    
    initKqTable();
    
    $('p[d]').parent().click(
    	function (){
    		saveKq($(this).parent().attr("id"),$(this).parent().attr("banci"),$(this).children('p').attr("d"),$(this).children('p'));
    	}		
    );
    $('td').css("text-align","center");
    
    $("#confirmBtn").click(function() {
		getFiles();
	});
});

//在页面定义怎么使用 缓存数据
function getFiles() {
	$.each($('.files').children(),function(index, node) {
		$.ajax({
			url: 'jl-kq-fujian-save-ajax.do',
			data: {
				'fileName': $(node).data("fileName")+ "."+ $(node).data("fileType"),
				'fileUrl':$(node).data("fileUrl"),
				'kqId': '${kqid}',
			},
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			async:false,
			success: function(data) {
				if(data){
					window.location.reload();
				}
			}
		}); 
	});
	$(".uploadModal").modal('hide');
}

/* function saveKq(ryid,banci,day,elm){
	$.ajax({
		url: 'jl-kq-save.do',
		data: {
			'kqryid': ryid,
			'banci':banci,
			'day':day
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:'json',
		async:false,
		success: function(data) {
			$(this).html("");
			if(data.currentDay==1){
				$(elm).css('color',"#49E03E");
				$(elm).html('√');
			}else if(data.currentDay==2){
				$(elm).css('color',"red");
				$(elm).html('Ø');
			}else if(data.currentDay==3){
				$(elm).css('color',"blue");
				$(elm).html('/');
			}else if(data.currentDay==4){
				$(elm).css('color',"black");
				$(elm).html('×');
			}
			$('#result'+ryid).html('到岗：'+data.r1+'<br>矿工：'+data.r2+'<br>公休：'+data.r3+'<br>事假：'+data.r4);
		}
	}); 
} */

var daysHtml='<td style="height:20px; width:24px"><p d="1">&nbsp;</p></td><td style="height:20px; width:24px"><p d="2">&nbsp;</p></td><td style="height:20px; width:24px"><p d="3">&nbsp;</p></td><td style="height:20px; width:24px"><p  d="4">&nbsp;</p></td><td style="height:20px; width:24px"><p d="5">&nbsp;</p></td><td style="height:20px; width:24px"><p d="6">&nbsp;</p></td><td style="height:20px; width:24px"><p d="7">&nbsp;</p></td><td style="height:20px; width:24px"><p d="8">&nbsp;</p></td><td style="height:20px; width:24px"><p d="9">&nbsp;</p></td><td style="height:20px; width:24px"><p d="10">&nbsp;</p></td><td style="height:20px; width:24px"><p d="11">&nbsp;</p></td><td style="height:20px; width:24px"><p d="12">&nbsp;</p></td><td style="height:20px; width:24px"><p d="13">&nbsp;</p></td><td style="height:20px; width:24px"><p d="14">&nbsp;</p></td><td style="height:20px; width:24px"><p d="15">&nbsp;</p></td><td style="height:20px; width:24px"><p d="16">&nbsp;</p></td><td style="height:20px; width:24px"><p d="17">&nbsp;</p></td><td style="height:20px; width:24px"><p d="18">&nbsp;</p></td><td style="height:20px; width:24px"><p d="19">&nbsp;</p></td><td style="height:20px; width:24px"><p d="20">&nbsp;</p></td><td style="height:20px; width:24px"><p d="21">&nbsp;</p></td><td style="height:20px; width:24px"><p d="22">&nbsp;</p></td><td style="height:20px; width:24px"><p d="23">&nbsp;</p></td><td style="height:20px; width:24px"><p d="24">&nbsp;</p></td><td style="height:20px; width:24px"><p d="25">&nbsp;</p></td><td style="height:20px; width:24px"><p d="26">&nbsp;</p></td><td style="height:20px; width:24px"><p d="27">&nbsp;</p></td><td style="height:20px; width:24px"><p d="28">&nbsp;</p></td><td style="height:20px; width:24px"><p d="29">&nbsp;</p></td><td style="height:20px; width:24px"><p d="30">&nbsp;</p></td><td style="height:20px; width:24px"><p d="31">&nbsp;</p></td>';
var ryMap;
function initKqTable(){
	var kqid="${kqid}";
	$.ajax({
		url:'../jl/gc-kq-list.do',
		data: {
			kqid:kqid,
			fxmid:"${kq.fxmid}"
		},
		dataType:'json',
		async:false,
		success: function(data) {
			ryMap=data.ryMap;
			for(var i in data.fkqry){
				$('#kqtb').append(
						'<tr id="'+data.fkqry[i].fid+'" banci="1">'
						+'<td rowspan="2" style="height:20px; width:60px"><p>'+data.ryMap["ry"+data.fkqry[i].fryid]+'</p></td>'
						+'<td style="height:20px; width:36px"><p>上午</p></td>'
						+ daysHtml
						+'<td rowspan="2" style="height:20px; width:72px"><p id="result'+data.fkqry[i].fid+'"></p></td>'
						+'<td rowspan="2" style="height:20px; width:108px" id="fmemo'+data.fkqry[i].fid+'" onclick="updateMemo('+data.fkqry[i].fid+','+data.fkqry[i].fryid+')">'
						+'<p >&nbsp;</p>'
						+'</td>'
						+'</tr>'
						+'<tr id="'+data.fkqry[i].fid+'" banci="2">'
						+	'<td style="height:20px; width:36px"><p>下午</p></td>'
						+ daysHtml
						+'</tr>'
				);
				
				$('#result'+data.fkqry[i].fid).html(
						'到岗：'+data.ryResultMap["ry"+data.fkqry[i].fid].r1+'<br>矿工：'+data.ryResultMap["ry"+data.fkqry[i].fid].r2
						+'<br>公休：'+data.ryResultMap["ry"+data.fkqry[i].fid].r3+'<br>事假：'+data.ryResultMap["ry"+data.fkqry[i].fid].r4);
				
				$('#fmemo'+data.fkqry[i].fid).html('<p>'+data.fkqry[i].fmemo+'</p>');
			}
			
			for(var i in data.kqDetail){
				//获取到这行的td
				var elm='tr[id='+data.kqDetail[i].frykqid+'][banci='+data.kqDetail[i].fbanci+'] td';
				//根据天过滤到本天
				elm=$(elm).filter(('td:has(p[d="'+data.kqDetail[i].fday+'"])'));
				
				//赋值
				if(data.kqDetail[i].fkq==1){
					elm.css('color',"#49E03E");
					elm.html('√');
				}else if(data.kqDetail[i].fkq==2){
					elm.css('color',"red");
					elm.html('Ø');
				}else if(data.kqDetail[i].fkq==3){
					elm.css('color',"blue");
					elm.html('/');
				}else if(data.kqDetail[i].fkq==4){
					elm.css('color',"black");
					elm.html('×');
				} 
			}
		}
	}); 
}

function updateMemo(kqryid,ryid){
	$('#updateMemoDiv').modal();
	$('#fryName').html(ryMap["ry"+ryid]);
	$('#fmemeedit').val($('#fmemo'+kqryid).children('p').html());
	$('#fkqryid').val(kqryid);
}


function saveFmemo(){
	$.ajax({
		url: 'jl-kq-saveFmemo.do',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'fkqryid': $('#fkqryid').val(),
			'fmemo':$('#fmemeedit').val()
		},
		dataType:'json',
		type:'POST',
		async:false,
		success: function(data) {
			if(data=='1'){
				var id=$('#fkqryid').val();
				var memoval=$('#fmemeedit').val();
				$('#fmemo'+id).html('<p>'+memoval+'</p>');
			}else{
				alert("备注失败");
			}
			$('#updateMemoDiv').modal('hide');
		},
		error: function(data) {
			alert("备注失败");
			$('#updateMemoDiv').modal('hide');
		}
	}); 
}


function saveShenHe(){
	$.ajax({
		url: 'gcgl-kq-save-fstatus-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'fid': '${kqid}',
			'fstatus':$('#kq_fstatus option:selected').val()
		},
		type:'POST',
		async:false,
		success: function(data) {
			if(data=="ok"){
				alert("审核成功！");
			}else{
				alert("审核失败！");
			}
		},
		error: function(data) {
			alert("审核失败！");
		}
	}); 
}
   
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>
    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      
     <div id="updateMemoDiv" class="modal hide fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title" id="fryName"></h4>
	      </div>
	      <div class="modal-body">
	      		<input type="hidden" id="fkqryid">
	      		备注：
	        	<textarea id="fmemeedit" ></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button id="uploadPickerBtnSelect" onclick="saveFmemo()" type="button" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	<%@include file="../comm/comm-upload.jsp"%>
	 <article class="m-widget">
	   <header class="header" style="height: 30px;">
		  <h4 class="title">在线考勤</h4>&nbsp;&nbsp;
		  <select id="kq_fstatus" style="width: 80px;">
		    <option value=""></option>
		  	<option value="通过"  <c:if test="${kq.fstatus=='通过'}"> selected="selected"  </c:if>>通过</option>
		  	<option value="不通过"  <c:if test="${kq.fstatus=='不通过'}"> selected="selected"  </c:if>>不通过</option>
		  </select>
		  <input type="button" class="btn" onclick="saveShenHe()" value="审核">
		</header>
	<p><a name="OLE_LINK2"></a><a name="OLE_LINK1">填报单位</a>： ${fxmName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年月: ${kq.fyearmonth}</p>
<table border="1" cellpadding="0" cellspacing="0" style="width:1020px">
	<tbody id="kqtb">
		<tr>
			<td rowspan="2" style="height:63px; width:60px">
			<p>&nbsp;</p>
			<p>姓</p>
			<p>&nbsp;</p>
			<p>名</p>
			</td>
			<td rowspan="2" style="height:63px; width:36px">
			<p>午别</p>
			</td>
			<td colspan="31" style="height:63px; width:744px">
			<p>&nbsp;</p>

			<p>出&nbsp; 缺&nbsp; 勤&nbsp; 情&nbsp; 况&nbsp; 统&nbsp; 计</p>
			</td>
			<td rowspan="2" style="height:63px; width:72px">
			<p>实际出勤天数</p>
			</td>
			<td rowspan="2" style="height:63px; width:108px">
			<p>备注</p>
			</td>
		</tr>
		<tr>
			<td style="height:42px; width:24px">
			<p>1</p>
			</td>
			<td style="height:42px; width:24px">
			<p>2</p>
			</td>
			<td style="height:42px; width:24px">
			<p>3</p>
			</td>
			<td style="height:42px; width:24px">
			<p>4</p>
			</td>
			<td style="height:42px; width:24px">
			<p>5</p>
			</td>
			<td style="height:42px; width:24px">
			<p>6</p>
			</td>
			<td style="height:42px; width:24px">
			<p>7</p>
			</td>
			<td style="height:42px; width:24px">
			<p>8</p>
			</td>
			<td style="height:42px; width:24px">
			<p>9</p>
			</td>
			<td style="height:42px; width:24px">
			<p>10</p>
			</td>
			<td style="height:42px; width:24px">
			<p>11</p>
			</td>
			<td style="height:42px; width:24px">
			<p>12</p>
			</td>
			<td style="height:42px; width:24px">
			<p>13</p>
			</td>
			<td style="height:42px; width:24px">
			<p>14</p>
			</td>
			<td style="height:42px; width:24px">
			<p>15</p>
			</td>
			<td style="height:42px; width:24px">
			<p>16</p>
			</td>
			<td style="height:42px; width:24px">
			<p>17</p>
			</td>
			<td style="height:42px; width:24px">
			<p>18</p>
			</td>
			<td style="height:42px; width:24px">
			<p>19</p>
			</td>
			<td style="height:42px; width:24px">
			<p>20</p>
			</td>
			<td style="height:42px; width:24px">
			<p>21</p>
			</td>
			<td style="height:42px; width:24px">
			<p>22</p>
			</td>
			<td style="height:42px; width:24px">
			<p>23</p>
			</td>
			<td style="height:42px; width:24px">
			<p>24</p>
			</td>
			<td style="height:42px; width:24px">
			<p>25</p>
			</td>
			<td style="height:42px; width:24px">
			<p>26</p>
			</td>
			<td style="height:42px; width:24px">
			<p>27</p>
			</td>
			<td style="height:42px; width:24px">
			<p>28</p>
			</td>
			<td style="height:42px; width:24px">
			<p>29</p>
			</td>
			<td style="height:42px; width:24px">
			<p>30</p>
			</td>
			<td style="height:42px; width:24px">
			<p>31</p>
			</td>
	</tbody>
</table>

<p><!-- 负责人：&nbsp; 总监理工程师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考勤员：&nbsp; 监理员 -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          注明：到工<font color="#49E03E">√</font>  &nbsp; 旷工<font color="red">Ø</font> &nbsp;公假<font color="blue">/</font>&nbsp; 病假×</p>

</article>

 <article class="m-blank">
	    <div class="pull-left">
		   <region:region-permission permission="pjKq-info:create">
		  <button class="btn btn-small a-insert" onclick="showUpload()">上传</button>
		  </region:region-permission>
		  <region:region-permission permission="pjKq-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
		  <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>
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
		  <h4 class="title"><spring:message code="pjKq-info.pjKq-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="pjKq-infoGridForm" name="pjKq-infoGridForm" method='post' action="jlKqFujian-info-remove.do?id=${kqid}" class="m-form-blank">
  <table id="pjKq-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fuploaddate">上传时间</th>
        	<th class="sorting" name="fkqname">考勤表名称</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${jlfujians}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fuploaddate}</td>
      	 	 <td><a href="${item.fkqurl}"  class="a-link">${item.fkqname}</a></td>
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

      </section>

	  <!-- end of main -->
	</div>

  </body>

</html>
