<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" data-spy="affix" data-offset-top="100">

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-form">
              <i class="icon-th-list "></i>
              <span class="title">表单管理</span>
            </a>
          </div>
          <div id="collapse-form" class="accordion-body collapse ${currentMenu == 'form' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/form/form-template-list.do"><i class="icon-list"></i>表单列表</a></li>
			  <li><a href="${scopePrefix}/form/form-template-input.do"><i class="icon-file"></i>新建表单</a></li>
            </ul>
          </div>
        </div>

		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
