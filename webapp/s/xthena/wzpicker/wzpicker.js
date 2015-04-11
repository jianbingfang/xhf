var createwzPicker = function(conf) {
	if (!conf) {
		conf = {
			modalId: 'wzPicker',
			multiple: false,
			url: '/xthena-web-wz/default/rs/wz/search'
		};
	}
	if ($('#' + conf.modalId).length == 0) {
		$(document.body).append(
'<div id="' + conf.modalId + '" class="modal hide fade">'
+'  <div class="modal-header">'
+'    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
+'    <h3>选择物资</h3>'
+'  </div>'
+'  <div class="modal-body">'
+'	  <article class="m-blank">'
+'	    <div class="pull-left">'
+'		  <form name="wzForm" method="post" action="javascript:void(0);return false;" class="form-inline m-form-bottom">'
+'    	    <label for="wz_wzname">物资名称:</label>'
+'			<input type="text" style="width:100px;" id="filter_LIKES_fname" name="filter_LIKES_fname" value="">'
+'			<button id="search" class="btn btn-small">查询</button>'
+'		  </form>'
+'		</div>'
+'	    <div class="m-clear"></div>'
+'	  </article>'
+'      <article class="m-widget">'
+'        <header class="header">'
+'		  <h4 class="title">物资列表</h4>'
+'		</header>'
+'		<div class="content">'
+'<form id="wzPickerForm" name="wzPickerForm" method="post" action="#" class="m-form-blank">'
+'  <table id="wzPickerGrid" class="m-table table-hover">'
+'    <thead>'
+'      <tr>'
+'        <th width="10" class="m-table-check">&nbsp;</th>'
+'        <th>物资编号</th>'
+'        <th>名称</th>'
+'        <th>规格</th>'
+'      </tr>'
+'    </thead>'
+'    <tbody id="wzPickerBody">'
+'    </tbody>'
+'  </table>'
+'</form>'
+'        </div>'
+'      </article>'
+'  </div>'
+'  <div class="modal-footer">'
+'    <span id="wzPickerResult"></span>'
+'    <a id="wzPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>'
+'    <a id="wzPickerBtnSelect" href="#" class="btn btn-primary">选择</a>'
+'  </div>'
+'</div>');
	}

	$(document).delegate('.wzPicker .add-on', 'click', function(e) {
		$('#' + conf.modalId).data('wzPicker', $(this).parent());
		$('#' + conf.modalId).modal();
		$.ajax({
			url: conf.url,
			data: {
				filter_LIKES_fwzno: $('#wz_wzname').val()
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
						+'<td><label for="selectedItem' + i + '">' + item.fcode + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fgg + '</label></td>'
					  +'</tr>';
				}
				$('#' + conf.modalId + 'Body').html(html);
			}
		});
	});

	$(document).delegate('#' + conf.modalId + 'BtnSelect', 'click', function(e) {
		$('#' + conf.modalId).modal('hide');
		var wzPickerElement = $('#' + conf.modalId).data('wzPicker');
		var selectBoy=$('#'+ conf.modalId + 'Body');
		var checkedEl=selectBoy.find('.selectedItem:checked');
		wzPickerElement.children('input[type=hidden]').val(checkedEl.val());
		wzPickerElement.children('input[type=text]').val(checkedEl.attr('title'));
	});
	
	$(document).delegate('#search', 'click', function(e) {
		$.ajax({
			url: conf.url,
			type:'POST',
			data: {
				filter_LIKES_fname: $('#filter_LIKES_fname').val(),
				filter_LIKES_fcode: $('#filter_LIKES_fcode').val()
			},
			dataType:'json',
			success: function(data) {
				var html = '';
				for (var i = 0; i < data.result.length;i++) {
					var item = data.result[i];
					html +=
					  '<tr>'
						+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
						+ item.fid + '" title="' + item.fcardno + '"></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fcode + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fgg + '</label></td>'
					  +'</tr>';
				}
				$('#' + conf.modalId + 'Body').html(html);
			}
		});
	});
};
