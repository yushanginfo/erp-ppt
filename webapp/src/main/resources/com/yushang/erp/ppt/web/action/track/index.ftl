[@b.head title="产品生产计划跟踪系统"/]

<div class="container" style="margin-top:100px">
   <div class="row">
      <div class="col-md-2"></div>
      <h4  class="col-md-8" style="text-align:center">产品生产计划跟踪系统</h4>
   </div>
   <div class="row" style="justify-content: center;">
     <form name="searchform" action="${base}/track/search" method="post">
      <div class="input-group">
         <input type="text" name="q" class="form-control"placeholder="产品 名称 型号 客户号"  style="width:400px"/ >
              <span class="input-group-btn">
                 <button class="btn btn-info btn-search" >查找</button>
              </span>
      </div>
     </form>
  </div>

  <div class="row">
      <div class="col-md-2"></div>
      <div class="col-md-8" style="text-align:center" ><span>从${productCount}条中查找</span></div>
   </div>
</div>


[@b.foot/]
