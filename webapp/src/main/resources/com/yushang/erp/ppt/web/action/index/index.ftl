[#assign title]${enterprise.name}[/#assign]
[@b.head title=title]
  <link href="${base}/static/nav/menu.css?v=default" rel="stylesheet" type="text/css" />
  <script src="${base}/static/nav/menu.js" type="text/javascript"></script>
[/@]

[#include "../nav.ftl"/]
[@displayFrame org =enterprise appName="erp-ppt" /]

<script type="text/javascript">
  bg.getContextPath=function(){return "${base}";}
  var menus = [{id:1,title:'产品管理',entry:'/product',code:'01'},
    {id:2,title:'生产任务',entry:'/task',code:'02'},
    {id:3,title:'任务类型',entry:'/task-category',code:'03'},
    {id:4,title:'任务跟踪',entry:'/track/search',code:'04'}]
  var webappBase='';
  thisAppName='erp-product'
  var apps = [{name:'erp-product',title:'生产计划跟踪系统',url:'${base}/index'}]
  displayAppAndMenus(apps,menus)
</script>
[@b.foot/]
