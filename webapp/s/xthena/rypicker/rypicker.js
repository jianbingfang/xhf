var createryPicker = function(conf) {
	if (!conf) {
		conf = {
			modalId: 'ryPicker',
			multiple: false,
			url: '/xthena-web-ry/default/rs/ry/search'
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
+'		  <form name="ryForm" method="post" action="javascript:void(0);return false;" class="form-inline m-form-bottom">'
+'    	    <label for="ry_ryname">姓名:</label>'
+'			<input type="text" style="width:100px;" id="filter_LIKES_fname1" name="filter_LIKES_fname" value="">'
+'    	    <label for="ry_ryname">工号:</label>'
+'			<input type="text" style="width:100px;" id="filter_LIKES_fcardno" name="filter_LIKES_fcardno" value="">'
+'			<button id="search" class="btn btn-small">查询</button>'
+'		  </form>'
+'		</div>'
+'	    <div class="m-clear"></div>'
+'	  </article>'
+'      <article class="m-widget">'
+'        <header class="header">'
+'		  <h4 class="title">人员列表</h4>'
+'		</header>'
+'		<div class="content">'
+'<form id="ryPickerForm" name="ryPickerForm" method="post" action="#" class="m-form-blank">'
+'  <table id="ryPickerGrid" class="m-table table-hover">'
+'    <thead>'
+'      <tr>'
+'        <th width="10" class="m-table-check">&nbsp;</th>'
+'        <th>工号</th>'
+'        <th>姓名</th>'
+'        <th>性别</th>'
+'      </tr>'
+'    </thead>'
+'    <tbody id="ryPickerBody">'
+'    </tbody>'
+'  </table>'
+'</form>'
+'        </div>'
+'      </article>'
+'  </div>'
+'  <div class="modal-footer">'
+'    <span id="ryPickerResult"></span>'
+'    <a id="ryPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>'
+'    <a id="ryPickerBtnSelect" href="#" class="btn btn-primary">选择</a>'
+'  </div>'
+'</div>');
	}

	$(document).delegate('.ryPicker .add-on', 'click', function(e) {
		$('#' + conf.modalId).data('ryPicker', $(this).parent());
		$('#' + conf.modalId).modal();
		$.ajax({
			url: conf.url,
			data: {
				filter_LIKES_fryno: $('#ry_ryname').val()
			},
			dataType:'json',
			success: function(data) {
				var html = '';
				for (var i = 0; i < data.result.length;i++) {
					var item = data.result[i];
					var sexStr = "" ;
					if(item.fsex == 0){
						sexStr= "女";
					}else {
						sexStr = "男";
					}
					html +=
					  '<tr>'
						+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
						+ item.fid + '" title="' + item.fname + '"></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fcardno + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + sexStr + '</label></td>'
					  +'</tr>';
				}
				$('#' + conf.modalId + 'Body').html(html);
			}
		});
	});

	$(document).delegate('#' + conf.modalId + 'BtnSelect', 'click', function(e) {
		$('#' + conf.modalId).modal('hide');
		var ryPickerElement = $('#' + conf.modalId).data('ryPicker');
		var selectBoy=$('#'+ conf.modalId + 'Body');
		var checkedEl=selectBoy.find('.selectedItem:checked');
		if(checkedEl.val()==null||checkedEl.val()==""){
			ryPickerElement.children('input[type=hidden]').val(-1);	
		}else{
			ryPickerElement.children('input[type=hidden]').val(checkedEl.val());
		}
		ryPickerElement.children('input[type=text]').val(checkedEl.attr('title'));
		ryPickerElement.children('input[type=hidden]').change();
		ryPickerElement.children('input[type=text]').change();
	});
	
	$(document).delegate('#search', 'click', function(e) {
		$.ajax({
			url: conf.url,
			type:'POST',
			data: {
				filter_LIKES_fname: $('#filter_LIKES_fname1').val(),
				filter_LIKES_fcardno: $('#filter_LIKES_fcardno').val()
			},
			dataType:'json',
			success: function(data) {
				var html = '';
				for (var i = 0; i < data.result.length;i++) {
					var item = data.result[i];
					var sexStr = "" ;
					if(item.fsex == 0){
						sexStr= "女";
					}else {
						sexStr = "男";
					}
					html +=
					  '<tr>'
						+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
						+ item.fid + '" title="' + item.fname + '"></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fcardno + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
						+'<td><label for="selectedItem' + i + '">' + sexStr+ '</label></td>'
					  +'</tr>';
				}
				$('#' + conf.modalId + 'Body').html(html);
			}
		});
	});
}
