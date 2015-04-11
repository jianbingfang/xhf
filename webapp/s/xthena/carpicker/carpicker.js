var createcarPicker = function(conf) {
	if (!conf) {
		conf = {
			modalId: 'carPicker',
			multiple: false,
			url: '/xthena-web-car/default/rs/car/search'
		};
	}
	if ($('#' + conf.modalId).length == 0) {
		$(document.body).append(
'<div id="' + conf.modalId + '" class="modal hide fade">'
+'  <div class="modal-header">'
+'    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
+'    <h3>选择用户</h3>'
+'  </div>'
+'  <div class="modal-body">'
+'	  <article class="m-blank">'
+'	    <div class="pull-left">'
+'		  <form name="carForm" method="post" action="javascript:void(0);return false;" class="form-inline m-form-bottom">'
+'    	    <label for="car_carname">车牌号:</label>'
+'			<input type="text" id="car_carname" name="filter_LIKES_fcarno" value="">'
+'			<button id="search" class="btn btn-small">查询</button>'
+'		  </form>'
+'		</div>'
+'	    <div class="m-clear"></div>'
+'	  </article>'
+'      <article class="m-widget">'
+'        <header class="header">'
+'		  <h4 class="title">车辆列表</h4>'
+'		</header>'
+'		<div class="content">'
+'<form id="carPickerForm" name="carPickerForm" method="post" action="#" class="m-form-blank">'
+'  <table id="carPickerGrid" class="m-table table-hover">'
+'    <thead>'
+'      <tr>'
+'        <th width="10" class="m-table-check">&nbsp;</th>'
+'        <th>车牌号</th>'
+'        <th>品牌</th>'
+'        <th>型号</th>'
+'      </tr>'
+'    </thead>'
+'    <tbody id="carPickerBody">'
+'    </tbody>'
+'  </table>'
+'</form>'
+'        </div>'
+'      </article>'
+'  </div>'
+'  <div class="modal-footer">'
+'    <span id="carPickerResult"></span>'
+'    <a id="carPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>'
+'    <a id="carPickerBtnSelect" href="#" class="btn btn-primary">选择</a>'
+'  </div>'
+'</div>');
	}

	$(document).delegate('.carPicker .add-on', 'click', function(e) {
		$('#' + conf.modalId).data('carPicker', $(this).parent());
		$('#' + conf.modalId).modal();
		$.ajax({
			url: conf.url,
			data: {
				filter_LIKES_fcarno: $('#car_carname').val()
			},
			dataType:'json',
			success: function(data) {
				var html = '';
				for (var i = 0; i < data.result.length;i++) {
					var item = data.result[i];
					html +=
					  '<tr>'
						+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
						+ item.fid + '" title="' + item.fcarno + '"></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fcarno + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fbrand + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.ftype + '</label></td>'
					  +'</tr>';
				}
				$('#' + conf.modalId + 'Body').html(html);
			}
		});
	});

	$(document).delegate('#' + conf.modalId + 'BtnSelect', 'click', function(e) {
		$('#' + conf.modalId).modal('hide');
		var carPickerElement = $('#' + conf.modalId).data('carPicker');
		var selectBoy=$('#'+ conf.modalId + 'Body');
		var checkedEl=selectBoy.find('.selectedItem:checked');
		carPickerElement.children('input[type=hidden]').val(checkedEl.val());
		carPickerElement.children('input[type=text]').val(checkedEl.attr('title'));
	});
	
	$(document).delegate('#search', 'click', function(e) {
		$.ajax({
			url: conf.url,
			type:'POST',
			data: {
				filter_LIKES_fcarno: $('#car_carname').val()
			},
			dataType:'json',
			success: function(data) {
				var html = '';
				for (var i = 0; i < data.result.length;i++) {
					var item = data.result[i];
					html +=
					  '<tr>'
						+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
						+ item.fid + '" title="' + item.fcarno + '"></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fcarno + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fbrand + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.ftype + '</label></td>'
					  +'</tr>';
				}
				$('#' + conf.modalId + 'Body').html(html);
			}
		});
	});
};
