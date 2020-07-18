[@b.head/]
[@b.toolbar title="产品环节分类管理"/]
<div class="search-container">
   <div class="search-panel">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="taskCategorys" theme="search"]
          [@b.textfields names="taskCategory.name;名称,taskCategory.code;编号"/]
          <input type="hidden" name="orderBy" value="taskCategory.code asc">
        [/@]
      </div>
   <div class="search-list">
     [@b.div id="taskCategorys"/]
   </div>
 </div>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "taskCategorys");
      });
    });
  </script>

[@b.foot/]
