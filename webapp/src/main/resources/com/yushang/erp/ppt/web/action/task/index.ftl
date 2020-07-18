[@b.head/]
[@b.toolbar title="生产任务管理"/]
<div class="search-container">
   <div class="search-panel">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="tasks" theme="search"]
          [@b.textfields names="task.product.name;名称,task.product.code;内部编号,task.product.customCode;客户编号,task.product.specification;规格,task.finishedBy;完成人"/]
          [@b.datepicker label="完成日期" name="finishedOn"/]
        [/@]
      </div>
   <div class="search-list">
    [@b.div id="tasks"/]
   </div>
</div>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "tasks");
      });
    });
  </script>

[@b.foot/]
