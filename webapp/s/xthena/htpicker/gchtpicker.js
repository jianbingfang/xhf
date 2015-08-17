var createhtPicker = function (conf) {
    if (!conf) {
        conf = {
            modalId: 'htPicker',
            multiple: false,
            url: '/xthena-web-ht/default/rs/ht/search'
        };
    }
    if ($('#' + conf.modalId).length == 0) {
        $(document.body).append(
            '<div id="' + conf.modalId + '" class="modal hide fade">'
            + '  <div class="modal-header">'
            + '    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
            + '    <h3>选择合同</h3>'
            + '  </div>'
            + '  <div class="modal-body">'
            + '	  <article class="m-blank">'
            + '	    <div class="pull-left">'
            + '		  <form name="htForm" method="post" action="javascript:void(0);return false;" class="form-inline m-form-bottom">'
            + '    	    <label for="ht_htname">名称:</label>'
            + '			<input type="text" style="width:100px;" id="filter_LIKES_fhtname" name="filter_LIKES_fhtname" value="">'
            + '    	    <label for="ht_htname">编号:</label>'
            + '			<input type="text" style="width:100px;" id="filter_LIKES_fhetongno" name="filter_LIKES_fhetongno" value="">'
            + '			<button id="search" class="btn btn-small">查询</button>'
            + '		  </form>'
            + '		</div>'
            + '	    <div class="m-clear"></div>'
            + '	  </article>'
            + '      <article class="m-widget">'
            + '        <header class="header">'
            + '		  <h4 class="title">合同列表</h4>'
            + '		</header>'
            + '		<div class="content">'
            + '<form id="htPickerForm" name="htPickerForm" method="post" action="#" class="m-form-blank">'
            + '  <table id="htPickerGrid" class="m-table table-hover">'
            + '    <thead>'
            + '      <tr>'
            + '        <th width="10" class="m-table-check">&nbsp;</th>'
            + '        <th>编号</th>'
            + '        <th>名称</th>'
                /*+'        <th>类别</th>'*/
            + '      </tr>'
            + '    </thead>'
            + '    <tbody id="htPickerBody">'
            + '    </tbody>'
            + '  </table>'
            + '</form>'
            + '        </div>'
            + '      </article>'
            + '  </div>'
            + '  <div class="modal-footer">'
            + '    <span id="htPickerResult"></span>'
            + '    <a id="htPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>'
            + '    <a id="htPickerBtnSelect" href="#" class="btn btn-primary">选择</a>'
            + '  </div>'
            + '</div>');
    }

    $(document).delegate('.htPicker .add-on', 'click', function (e) {
        $('#' + conf.modalId).data('htPicker', $(this).parent());
        $('#' + conf.modalId).modal();
        $.ajax({
            url: conf.url,
            data: {
                filter_LIKES_fhtname: $('#fhtname').val()
            },
            dataType: 'json',
            success: function (data) {
                var html = '';
                for (var i = 0; i < data.result.length; i++) {
                    var item = data.result[i];
                    html +=
                        '<tr>'
                        + '<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
                        + item.fid + '" title="' + item.fhtname + '" htno="' + item.fhetongno + '"></td>'
                        + '<td><label for="selectedItem' + i + '">' + item.fhetongno + '</label></td>'
                        + '<td><label for="selectedItem' + i + '">' + item.fhtname + '</label></td>'
                            /*+'<td><label for="selectedItem' + i + '">' + item.fhttype + '</label></td>'*/
                        + '</tr>';
                }
                $('#' + conf.modalId + 'Body').html(html);
            }
        });
    });

    $(document).delegate('#' + conf.modalId + 'BtnSelect', 'click', function (e) {
        $('#' + conf.modalId).modal('hide');
        var htPickerElement = $('#' + conf.modalId).data('htPicker');
        var selectBoy = $('#' + conf.modalId + 'Body');
        var checkedEl = selectBoy.find('.selectedItem:checked');
        htPickerElement.children('input[type=hidden]').val(checkedEl.val());
        htPickerElement.children('input[type=text]').val(checkedEl.attr('title'));
        $('#xmBxRecord-info_fxmno').val(checkedEl.attr('htno'));
    });

    $(document).delegate('#search', 'click', function (e) {
        $.ajax({
            url: conf.url,
            type: 'POST',
            data: {
                filter_LIKES_fhtname: $('#filter_LIKES_fhtname').val(),
                filter_LIKES_fhetongno: $('#filter_LIKES_fhetongno').val()
            },
            dataType: 'json',
            success: function (data) {
                var html = '';
                for (var i = 0; i < data.result.length; i++) {
                    var item = data.result[i];
                    html +=
                        '<tr>'
                        + '<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
                        + item.fid + '" title="' + item.fhtname + '"></td>'
                        + '<td><label for="selectedItem' + i + '">' + item.fhetongno + '</label></td>'
                        + '<td><label for="selectedItem' + i + '">' + item.fhtname + '</label></td>'
                            /*	+'<td><label for="selectedItem' + i + '">' + item.fhttype + '</label></td>'*/
                        + '</tr>';
                }
                $('#' + conf.modalId + 'Body').html(html);
            }
        });
    });
};
