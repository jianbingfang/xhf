function initSelect(docId,url,queryParameter){
    $.ajax({
        type: "post",
        url: url,
        dataType: "json",
        async: false,
        data:queryParameter,
        contentType : "application/x-www-form-urlencoded;charset=utf-8",
        success: function (data) {
        	for(var i=0;i<data.length;i++){
        		  $('#'+docId).append('<option value="'+data[i].value+'">'+data[i].text+'</option>');
        	}
        },
        error: function () {
            alert("获取AJAX数据失败！");
        }
    });
    
	
}