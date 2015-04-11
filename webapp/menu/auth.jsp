<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" data-spy="affix" data-offset-top="100">

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-auth">
              <i class="icon-lock "></i>
              <span class="title">权限配置</span>
            </a>
          </div>
          <div id="collapse-auth" class="accordion-body collapse ${currentMenu == 'auth' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/auth/user-connector-list.do"><i class="icon-user"></i><spring:message code="layout.leftmenu.usermanage" text="用户管理"/></a></li>
			  <li><a href="${scopePrefix}/auth/role-def-list.do"><i class="icon-adjust"></i>角色模板</a></li>
			  <li><a href="${scopePrefix}/auth/role-list.do"><i class="icon-tag"></i><spring:message code="layout.leftmenu.rolemanage" text="角色管理"/></a></li>
			  <li><a href="${scopePrefix}/auth/perm-type-list.do"><i class="icon-ok"></i>授权分类</a></li>
			  <li><a href="${scopePrefix}/auth/perm-list.do"><i class="icon-ok-sign"></i><spring:message code="layout.leftmenu.permmanage" text="授权管理"/></a></li>
			  <li><a href="${scopePrefix}/auth/access-list.do"><i class="icon-globe"></i><spring:message code="layout.leftmenu.accessmanage" text="访问权限"/></a></li>
			  <li><a href="${scopePrefix}/sysconf/commMenu-info-list.do"><i class="icon-globe"></i><spring:message code="layout.leftmenu.accessmanage" text="菜单管理"/></a></li>
			  <li><a href="${scopePrefix}/sysconf/commMenuRole-info-list.do"><i class="icon-globe"></i><spring:message code="layout.leftmenu.accessmanage" text="菜单角色"/></a></li>
		    </ul>
          </div>
        </div>

		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
