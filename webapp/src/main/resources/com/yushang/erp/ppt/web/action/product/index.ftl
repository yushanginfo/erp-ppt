[@b.head/]
[@b.toolbar title="产品管理"/]
<div class="search-container">
   <div class="search-panel">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="products" theme="search"]
          [@b.textfields names="product.name;名称,product.code;内部编号,product.customCode;客户编号,product.specification;规格"/]
          [@b.datepicker label="预计出货" name="product.planShippedOn"/]
          [@b.datepicker label="实际出货" name="product.shippedOn"/]
          [@b.radios label="是否完结" name="product.finished" value=false/]
        [/@]
   </div>
   <div class="search-list">
     [@b.div id="products"/]
   </div>
</div>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "products");
      });
    });
  </script>

[@b.foot/]
