<%@page language="java" pageEncoding="UTF-8" %>
    <!-- bootstrap -->
    <link type="text/css" rel="stylesheet" href="${ctx}/s/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/s/bootstrap/css/bootstrap-responsive.min.css">

    <!-- html5 -->
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="${ctx}/s/xthena/css/ie.css" media="screen" />
    <script type="text/javascript" src="${ctx}/s/html5/html5shiv.js"></script>
    <![endif]-->

    <!-- jquery -->
    <script type="text/javascript" src="${ctx}/s/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/s/jquery/jquery-migrate-1.2.1.min.js"></script>
	<!-- bootstrap -->
    <script type="text/javascript" src="${ctx}/s/bootstrap/js/bootstrap.min.js"></script>

    <!-- layout -->
    <script type="text/javascript" src="${ctx}/s/xthena/js/hideshow.js"></script>
    <script type="text/javascript" src="${ctx}/s/xthena/js/jquery.equalHeight.js"></script>
    <script type="text/javascript" src="${ctx}/s/xthena/js/table.js"></script>

    <!-- message -->
    <script type="text/javascript" src="${ctx}/s/jquery-sliding-message/jquery.slidingmessage.min.js"></script>

    <!-- uniform -->
    <link type="text/css" rel="stylesheet" href="${ctx}/s/uniform/css/uniform.default.css" media="screen" />
    <script type="text/javascript" src="${ctx}/s/uniform/js/jquery.uniform.min.js"></script>

    <!-- table and pager -->
    <script type="text/javascript" src="${ctx}/s/pagination/pagination.js"></script>
    <script type="text/javascript" src="${ctx}/s/table/table.js"></script>
    <script type="text/javascript" src="${ctx}/s/table/messages_${locale}.js"></script>

    <!-- validater -->
    <script type="text/javascript" src="${ctx}/s/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/s/jquery-validation/additional-methods.min.js"></script>
    <script type="text/javascript" src="${ctx}/s/jquery-validation/localization/messages_${locale}.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctx}/s/jquery-validation/jquery.validate.css" />

    <!-- datepicker -->
    <link type="text/css" rel="stylesheet" href="${ctx}/s/bootstrap-datepicker/datepicker.css">
    <script type="text/javascript" src="${ctx}/s/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${ctx}/s/bootstrap-datepicker/locales/bootstrap-datepicker.${locale}.js"></script>
    <link href="${ctx}/s/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/s/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${ctx}/s/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.${locale}.js"></script>

    <script type="text/javascript" src="${ctx}/s/util/moment.min.js"></script>

    <!-- tree -->
    <link rel="stylesheet" href="${ctx}/s/ztree/zTreeStyle/zTreeStyle.css" type="text/css" />
    <script type="text/javascript" src="${ctx}/s/ztree/jquery.ztree.all-3.5.min.js"></script>

	<!-- uniform -->
    <link rel="stylesheet" href="${ctx}/s/uniform/css/uniform.default.min.css" type="text/css" media="screen" />
    <script type="text/javascript" src="${ctx}/s/uniform/js/jquery.uniform.min.js"></script>

	<!-- chozen -->
    <link rel="stylesheet" href="${ctx}/s/chosen/chosen.css" type="text/css" media="screen" />
    <script type="text/javascript" src="${ctx}/s/chosen/chosen.jquery.min.js"></script>

	<!-- bootbox -->
    <script type="text/javascript" src="${ctx}/s/bootbox/bootbox.min.js"></script>

    <!-- ckeditor -->
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${ctx}/s/ckfinder/ckfinder.js"></script>

    <script type="text/javascript" src="${ctx}/s/jquery-tablednd/jquery.tablednd.min.js"></script>
	<!-- layout -->
    <link type="text/css" rel="stylesheet" href="${ctx}/s/xthena/css/layout3.css" media="screen" />
    <!-- xthena -->
    <script type="text/javascript" src="${ctx}/s/xthena/js/xthenaComm.js"></script>
    
    <!-- print -->
    <script type="text/javascript" src="${ctx}/s/xthena/js/jquery.PrintArea.js"></script>

    <script type="text/javascript">
$(function() {
    $.showMessage($('#m-success-message').html(), {
        position: 'top',
        size: '55',
        fontSize: '20px'
    });

    $("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform({
        fileDefaultHtml: '还未选择文件',
        fileButtonHtml: '选择文件'
    });

    $('.datepicker').datepicker({
		language: '${locale}',
		format: 'yyyy-mm-dd'
	});

    $('.datetimepicker').datetimepicker({
		language: '${locale}',
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left"//,
       // initialDate: ""
    });

    $(".chzn-select").chosen({
        no_results_text: '找不到',
        width: '220px'
    });

    $(".chzn-select-deselect").chosen({
        allow_single_deselect:true,
        no_results_text: '找不到',
        width: '220px'
    });

    function widgetToggleContent() {
        var self = $(this);
        self.toggleClass('icon-chevron-up');
        self.toggleClass('icon-chevron-down');
        var widget = self.parents('.m-widget');
        var content = widget.find('.content');
        content.toggle(200);
    }

    $(document).delegate('.m-widget .header .ctrl .icon-chevron-up', 'click', widgetToggleContent);
    $(document).delegate('.m-widget .header .ctrl .icon-chevron-down', 'click', widgetToggleContent);
    
    selectMemu();
});


function selectMemu(){
	var url=window.location.href;
	url=url.replace("http://"+"<%= request.getHeader("Host")%>","");
	$('a[href="'+url+'"]').parent('li').addClass('active');
}

var formatNum = function (num, n) {
    if (typeof num === 'string') {
        num = Number(num);
    }
    if (typeof num === 'number') {
        n = 2 | n;
        num = String(num.toFixed(n));
        var re = /(-?\d+)(\d{3})/;
        while (re.test(num)) num = num.replace(re, "$1,$2")
    }
    return num;
};

Array.prototype.sum = function () {
    for (var sum = i = 0; i < this.length; i++)
        sum += this[i];
    return sum;
};
    </script>
