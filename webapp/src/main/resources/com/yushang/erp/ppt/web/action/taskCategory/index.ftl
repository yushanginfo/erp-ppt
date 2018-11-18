[@b.head/]
[@b.toolbar title="产品环节分类管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="taskCategorys" theme="search"]
          [@b.textfields names="taskCategory.name;名称,taskCategory.code;编号"/]
          <input type="hidden" name="orderBy" value="taskCategory.code asc">
        [/@]
      </td>
      <td class="index_content">[@b.div id="taskCategorys"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "taskCategorys");
      });
    });
  </script>

[@b.foot/]