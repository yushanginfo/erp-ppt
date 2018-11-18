[@b.head/]
[@b.toolbar title="产品管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="products" theme="search"]
          [@b.textfields names="product.name;名称,product.code;内部编号,product.customCode;客户编号,product.specification;规格"/]
          [@b.datepicker label="预计出货" name="product.planShippedOn"/]
          [@b.datepicker label="实际出货" name="product.shippedOn"/]
          [@b.radios label="是否完结" name="product.finished" value=false/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="products"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "products");
      });
    });
  </script>

[@b.foot/]