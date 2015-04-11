var createxmPicker = function(conf) {
	if (!conf) {
		conf = {
			modalId: 'xmPicker',
			multiple: false,
			url: '/xthena-web-xm/default/rs/xm/search'
		};
	}
	if ($('#' + conf.modalId).length == 0) {
		$(document.body).append(
'<div id="jyxmDiv" class="modal hide fade">'
+'  <div class="modal-header">'
+'    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
+'    <h3>选择项目</h3>'
+'  </div>'
+'  <div class="modal-body">'
+'	  <article class="m-blank">'
+'	    <div class="pull-left">'
+'		  <form name="ryForm" method="post" action="javascript:void(0);return false;" class="form-inline m-form-bottom">'
+'    	    <label for="ry_ryname">名称:</label>'
+'			<input type="text" style="width:100px;" id="filter_LIKES_fxmname" name="filter_LIKES_fxmname" value="">'
+'			<button id="search" class="btn btn-small">查询</button>'
+'		  </form>'
+'		</div>'
+'	    <div class="m-clear"></div>'
+'	  </article>'
+'      <article class="m-widget">'
+'        <header class="header">'
+'		  <h4 class="title">项目列表</h4>'
+'		</header>'
+'		<div class="content">'
+'<form id="xmPickerForm" name="xmPickerForm" method="post" action="#" class="m-form-blank">'
+'  <table id="xmPickerGrid" class="m-table table-hover">'
+'    <thead>'
+'      <tr>'
+'        <th width="10" class="m-table-check">&nbsp;</th>'

+'        <th>名称</th>'
+'        <th>类别</th>'
+'      </tr>'
+'    </thead>'
+'    <tbody id="jyxmDivBody">'
+'    </tbody>'
+'  </table>'
+'</form>'
+'        </div>'
+'      </article>'
+'  </div>'
+'  <div class="modal-footer">'
+'    <span id="xmPickerResult"></span>'
+'    <a id="xmPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>'
+'    <a id="xmPickerBtnSelect" href="#" class="btn btn-primary">选择</a>'
+'  </div>'
+'</div>');
	}


	$(document).delegate('#' + conf.modalId + 'BtnSelect', 'click', function(e) {
		$('#jyxmDiv').modal('hide');
		var selectBoy=$('#jyxmDivBody');
		var checkedEl=selectBoy.find('.selectedItem:checked');
		window.location.href=conf.redUrl+"?xmid="+checkedEl.val();
	});
	
	$(document).delegate('#search', 'click', function(e) {
		$.ajax({
			url: 'jyXm-toubiao-simple-list.do',
			type:'POST',
			data: {
				filter_LIKES_fname: $('#filter_LIKES_fxmname').val()
			},
			dataType:'json',
			success: function(data) {
				var html = '';
				for (var i = 0; i < data.result.length;i++) {
					var item = data.result[i];
					html +=
					  '<tr>'
						+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
						+ item.fid + '" title="' + item.fname + '"></td>'
						/*+'<td><label for="selectedItem' + i + '">' + item.fxmno + '</label></td>'*/
						+'<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.ftype + '</label></td>'
					  +'</tr>';
				}
				$('#jyxmDivBody').html(html);
			}
		});
	});
}

function loadJyXm() {
	//$('#jyxmDiv').data('xmPicker', $(this).parent());
	$('#jyxmDiv').modal();
	$.ajax({
		url: 'jyXm-toubiao-simple-list.do.do',
		data: {
			filter_LIKES_fname: $('#fxmname').val()
		},
		dataType:'json',
		success: function(data) {
			var html = '';
			for (var i = 0; i < data.result.length;i++) {
				var item = data.result[i];
				html +=
				  '<tr>'
					+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
					+ item.fid + '" title="' + item.fname + '"></td>'
					/*+'<td><label for="selectedItem' + i + '">' + item.fxmno + '</label></td>'*/
					+'<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
					+'<td><label for="selectedItem' + i + '">' + item.ftype + '</label></td>'
				  +'</tr>';
			}
			$('#jyxmDivBody').html(html);
		}
	});
}

