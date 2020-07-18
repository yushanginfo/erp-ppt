<style>
@media (min-width: 768px) {
  body:not(.sidebar-mini-md) .content-wrapper,
  body:not(.sidebar-mini-md) .main-footer,
  body:not(.sidebar-mini-md) .main-header {
    transition: margin-left 0.3s ease-in-out;
    margin-left: 171px;
  }
}
.main-sidebar, .main-sidebar::before {
  transition: margin-left 0.3s ease-in-out, width 0.3s ease-in-out;
  width: 171px;
}
@media (max-width: 767.98px) {
  .main-sidebar, .main-sidebar::before {
    box-shadow: none !important;
    margin-left: -171px;
  }
  .sidebar-open .main-sidebar, .sidebar-open .main-sidebar::before {
    margin-left: 0;
  }
}
.layout-fixed .brand-link {
    width: 171px;
}
.layout-navbar-fixed .wrapper.sidebar-collapse .main-sidebar:hover .brand-link {
  transition: width 0.3s ease-in-out;
  width: 171px;
}

.sidebar-mini.sidebar-collapse .main-sidebar:hover, .sidebar-mini.sidebar-collapse .main-sidebar.sidebar-focused {
  width: 171px;
}
.nav-legacy {
    line-height:1.4;
    background-color:rgb(34, 45, 50);
    width:171px;
}
.nav-legacy.nav-sidebar .nav-item > .nav-link{
  border-radius: 0;
  margin-bottom: 0;
  padding-left:0;
}
.nav-sidebar > .nav-item .nav-icon.fa, .nav-sidebar > .nav-item .nav-icon.fab, .nav-sidebar > .nav-item .nav-icon.far, .nav-sidebar > .nav-item .nav-icon.fas, .nav-sidebar > .nav-item .nav-icon.glyphicon, .nav-sidebar > .nav-item .nav-icon.ion{
  font-size: 0.9rem;
}
</style>
[#macro displayFrame org appName mainHref="" fixed=true]
<nav role="navigation" class="main-header navbar navbar-expand navbar-dark navbar-lightblue sticky-top border-bottom-0">
    <ul class="nav navbar-nav">
       <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" title="隐藏/显示菜单" href="#" role="button"><i class="fas fa-bars"></i></a>
       </li>
    </ul>
   <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a href="#" class="nav-link" data-toggle="dropdown">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge" id="newly-message-count">0</span>
        </a>
        <div id="newly-message" class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;min-width:280px">
        </div>
      </li>

      <li class="nav-item dropdown notifications-menu">
        <a href="#" class="nav-link" data-toggle="dropdown">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">0</span>
        </a>
        <ul class="dropdown-menu">
          <li class="nav-header">You have 0 notifications</li>
          <li>
            <ul class="menu">
            </ul>
          </li>
          <li class="footer"><a href="#">View all</a></li>
        </ul>
      </li>

      <li class="nav-item dropdown tasks-menu">
        <a href="#" class="nav-link" data-toggle="dropdown">
          <i class="far fa-flag"></i>
          <span class="badge badge-warning navbar-badge">0</span>
        </a>
        <ul class="dropdown-menu">
          <li class="nav-header">You have 0 tasks</li>
          <li>
            <ul class="menu">
            </ul>
          </li>
          <li class="footer">
            <a href="#">View all tasks</a>
          </li>
        </ul>
      </li>
      <li class="nav-item dropdown user user-menu">
        <a href="#" class="nav-link" data-toggle="dropdown" title="管理员" style="padding:.35rem 0.35rem">
          <img src="https://test.ecupl.edu.cn/api/platform/user/avatars/63a9f0ea7bb98050796b649e85481845" class="user-image">
        </a>
        <ul class="dropdown-menu">
          <li class="user-header">
            <img src="https://test.ecupl.edu.cn/api/platform/user/avatars/63a9f0ea7bb98050796b649e85481845" class="img-circle" alt="User Image">
            <p>
              管理员
            </p>
          </li>
          <li class="user-footer">
            <div class="float-sm-left">
              <a href="/cas/edit" class="btn btn-default btn-flat"><i class="nav-icon far fa-user"></i>修改密码</a>
            </div>
            <div class="float-sm-right">
              <a href="/cas/logout" class="btn btn-default btn-flat" target="_top">
                <i class="nav-icon fa fa-door-open"></i>退出&nbsp;&nbsp;
              </a>
            </div>
          </li>
        </ul>
      </li>
    </ul>
</nav>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="${base}/index" class="brand-link navbar-lightblue" title="${enterprise.name}">
      <img src="http://www.ecupl.edu.cn/_upload/article/8b/63/7f9740464af79be0df1c3ea67979/8d55a0cb-cbb0-49bb-8bf1-4d958631ad9b.jpg" class="brand-image">
      <span class="brand-text font-weight-light" id="appName">计划跟踪</span>
    </a>
    <div class="sidebar" style="background-color:#222d32">
      <nav class="mt-2">
        <ul id="menu_ul" class="nav nav-pills nav-sidebar flex-column nav-legacy nav-child-indent sidebar-menu" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item has-treeview menu-open">
            <a class="nav-link active" href="javascript:void(0)">
            <i class="nav-icon fa fa-list"></i><p>生产任务<i class="nav-icon fa fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview" id="menu13">
               <li class="nav-item"><a class="nav-link" onclick="return bg.Go(this,'main')" href="${base}/product" target="main"><i class="nav-icon far fa-circle"></i><p>产品管理</p></a></li>
               <li class="nav-item"><a class="nav-link" onclick="return bg.Go(this,'main')" href="${base}/task" target="main"><i class="nav-icon far fa-circle"></i><p>生产任务</p></a></li>
               <li class="nav-item"><a class="nav-link active" onclick="return bg.Go(this,'main')" href="${base}/task-category" target="main"><i class="nav-icon far fa-circle"></i><p>任务类型</p></a></li>
               <li class="nav-item"><a class="nav-link" onclick="return bg.Go(this,'_blank')" href="${base}/track/search" target="main"><i class="nav-icon far fa-circle"></i><p>任务跟踪</p></a></li>
            </ul>
      </nav>
    </div>
  </aside>
[@b.div id="main" class="ajax_container content-wrapper" style="min-height: 1235px;" href="track!index"/]
[/#macro]
