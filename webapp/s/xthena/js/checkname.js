
function createajax(){ //创建ajax对象
	if(window.ActiveXObject){ 
		ajax=new ActiveXObject('Microsoft.XMLHTTP');
	}else if(window.XMLHttpRequest){
		ajax=new XMLHttpRequest(); 
	} 
} 

function checkname(input,url,field,value){ //失去焦点时调用，检测用户名是否存在
	var username=input.value;
	var tip=document.getElementById('tip');
	if(username==""){
		tip.className='bad';
		tip.innerHTML='用户名不能为空';
		return;
	}
	if(null==ajax) 
		createajax(); 
	ajax.open("GET","?id="+username,true);
	ajax.onreadystatechange=change_tip;
	ajax.send(null); 
} 

function change_tip(){ //状态改变时调用
	if(ajax.readyState == 4){
		if(ajax.status == 200){ 
			eval("var obj="+ajax.responseText);
			if(obj.status===1){
				tip.className='ok';
				tip.innerHTML=obj.text;
			}else{
				tip.className='bad';
				tip.innerHTML=obj.text;
			}
		} 
	} 
} 

function show_tip(){//获得焦点时调用，提示用户输入规则
	var tip=document.getElementById('tip');
	tip.className='info';
	tip.innerHTML="用户名,4-20位字母或数字,非数字开头";
}
