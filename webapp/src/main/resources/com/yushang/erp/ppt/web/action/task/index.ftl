[@b.head/]
[@b.toolbar title="生产任务管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="tasks" theme="search"]
          [@b.textfields names="task.product.name;名称,task.product.code;内部编号,task.product.customCode;客户编号,task.product.specification;规格,task.finishedBy;完成人"/]
          [@b.datepicker label="完成日期" name="task.finishedOn"/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="tasks"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "tasks");
      });
    });
  </script>

[@b.foot/]
