<%@ page language="java" pageEncoding="UTF-8" import="com.xthena.security.util.*"%>

	  <script type="text/javascript">
			$(function() {
				var currentHeader="${currentHeader}";
				$.ajax({
					url : '${scopePrefix}/sysconf/listUserMenu.do',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					type:'POST',
					async : false,
					dataType:'json',
					success : function(data) {
						//var firstli=$('#heardul');
						var lis="";
						for(var i in data.menus){
                            if(data.menus[i].fname){
							    lis+='<li code ="'+data.menus[i].fmenucode+'"><a href="${scopePrefix}/'+data.menus[i].furl+'">'+data.menus[i].fname+'</a></li>';
						    }
                        }
						$(lis).prependTo('#heardul');
						$('[code='+currentHeader+']').addClass('active');
					}
				});			   
			});
			
			function testBpm(){
				$.ajax({
					url : '${scopePrefix}/sckf/fenzhitest.do',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					type:'POST',
					async : false,
					dataType:'json',
					success : function(data) {
						
					}
				});			   
			}
			
			
			function testqryBpm(){
				$.ajax({
					url : '${scopePrefix}/sckf/fenzhitest1.do',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					type:'POST',
					data:{taskId:1,paramvalue:1},
					async : false,
					dataType:'json',
					success : function(data) {
						
					}
				});			   
			}
    </script>

    <c:if test="${not empty flashMessages}">
	<div id="m-success-message" style="display:none;">
	  <ul>
	  <c:forEach items="${flashMessages}" var="item">
	    <li>${item}</li>
	  </c:forEach>
	  </ul>
	</div>
	</c:if>

    <!-- start of header bar -->
    <div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
         	 <a href="${scopePrefix}/" class="brand" style="float:none; padding-bottom:10px;"><img  alt="新恒丰企业信息化管理系统"  src="${scopePrefix}/s/xthena/img/logo.png"> </a>
          <div class="nav-collapse collapse navbar-responsive-collapse">
            <ul id="heardul" class="nav">
            
              <!-- <li class="divider-vertical"></li> -->
             <%--  <li class="${currentHeader == 'dashboard' ? 'active' : ''}"><a href="${scopePrefix}/comm/xhfindex.do">首页</a></li> --%>
             <%--  <li class="${currentHeader == 'bpm-workspace' ? 'active' : ''}"><a href="${scopePrefix}/bpm/workspace-home.do">个人事务</a></li> --%>
     		 <%--  <li class="${currentHeader == 'gh-home' ? 'active' : ''}"><a href="${scopePrefix}/gh/gh-home.do">工会</a></li>
             <li class="${currentHeader == 'dzb-home' ? 'active' : ''}"><a href="${scopePrefix}/dzb/dzb-home.do">党支部</a></li>--%>
           <%--   <li class="${currentHeader == 'hr-home' ? 'active' : ''}"><a href="${scopePrefix}/hr/hr-home.do">人力资源</a></li>
             <li class="${currentHeader == 'xz-home' ? 'active' : ''}"><a href="${scopePrefix}/xz/xz-home.do">行政管理</a></li>
             <li class="${currentHeader == 'cw-home' ? 'active' : ''}"><a href="${scopePrefix}/cw/cw-home.do">财务管理</a></li>
       		<li class="${currentHeader == 'jsgl-home' ? 'active' : ''}"><a href="${scopePrefix}/jsgl/jsgl-home.do">技术管理</a></li>
             <li class="${currentHeader == 'sckf-home' ? 'active' : ''}"><a href="${scopePrefix}/sckf/sckf-home.do">市场开发</a></li>
             <li class="${currentHeader == 'gcgl-home' ? 'active' : ''}"><a href="${scopePrefix}/gcgl/gcgl-home.do">工程管理</a></li>
             <li class="${currentHeader == 'jl-home' ? 'active' : ''}"><a href="${scopePrefix}/jl/jl-home.do">监理部</a></li> --%>
            <%-- <li class="${currentHeader == 'kh-home' ? 'active' : ''}"><a href="${scopePrefix}/kh/kh-home.do">考核委</a></li>
             <li class="${currentHeader == 'zj-home' ? 'active' : ''}"><a href="${scopePrefix}/zj/zj-home.do">专家委</a></li>
             <li class="${currentHeader == 'fgs-home' ? 'active' : ''}"><a href="${scopePrefix}/fgs/fgs-home.do">分公司</a></li>
             <li class="${currentHeader == 'zbdl-home' ? 'active' : ''}"><a href="${scopePrefix}/zbdl/zbdl-home.do">招标代理</a></li>
             <li class="${currentHeader == 'xgfw-home' ? 'active' : ''}"><a href="${scopePrefix}/xgfw/xgfw-home.do">相关服务</a></li>
             <li class="${currentHeader == 'zjzx-home' ? 'active' : ''}"><a href="${scopePrefix}/zjzx/zjzx-home.do">造价咨询</a></li>
             <li class="${currentHeader == 'das-home' ? 'active' : ''}"><a href="${scopePrefix}/das/das-home.do">档案室</a></li> --%>
            <%--   <li class="${currentHeader == 'report' ? 'active' : ''}"><a href="${scopePrefix}/report/chart-mostActiveProcess.do">统计报表</a></li> --%>
            <c:if test="<%= SpringSecurityUtils.getRoles().contains(\"超级管理员\") %>">
              <li class="dropdown ${currentHeader == 'scope' ? 'active' : ''}" style="font-size:12px;">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#"> 系统管理 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="${scopePrefix}/user/user-base-list.do"><i class="icon-user"></i> 用户管理</a></li>
                  <li><a href="${scopePrefix}/group/org-users.do"><i class="icon-list"></i> 组织机构</a></li>
                  <li class="divider"></li>
                  <li><a href="${scopePrefix}/auth/user-connector-list.do"><i class="icon-lock"></i> 权限管理</a></li>
                  <li class="divider"></li>
				  <li><a href="${scopePrefix}/bpm/bpm-process-list.do"><i class="icon-flag"></i> 流程管理</a></li>
				  <li><a href="${scopePrefix}/form/form-template-list.do"><i class="icon-list-alt"></i> 表单管理</a></li>
                  <li class="divider"></li>
                  <li><a href="${scopePrefix}/cms/cms-article-list.do"><i class="icon-volume-up"></i> 公告管理</a></li>
                  <li><a href="${scopePrefix}/party/tree-list.do"><i class="icon-cog"></i> 系统配置</a></li>
                </ul>
              </li>
              </c:if>
              
              <!--  <li><a href="javascript:void(0)" onclick="testBpm()"><i class="icon-user"></i> 流程测试</a></li>
              <li><a href="javascript:void(0)" onclick="testqryBpm()"><i class="icon-user"></i> 查询</a></li>  -->
            </ul>

            <ul class="nav pull-right">
              <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                  <sec:authentication property="principal.displayName" />
                  <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                  <li><a href="${scopePrefix}/user/change-password-input.do"><i class="icon-lock"></i> 修改密码</a></li>
                  <li><a href="${scopePrefix}/user/profile-list.do"><i class="icon-user"></i> 个人信息</a></li>
                  <li class="divider"></li>
                   <li><a href="${scopePrefix}/dashboard/dashboard.do"><i class="icon-user"></i>个人工作台</a></li>
                  <li class="divider"></li>
                  <li><a href="${scopePrefix}/j_spring_security_logout"><i class="icon-off"></i> 退出</a></li>
                </ul>
              </li>
            </ul>
          </div><!-- /.nav-collapse -->
        </div>
      </div><!-- /navbar-inner -->
    </div>
    <!-- end of header bar -->
