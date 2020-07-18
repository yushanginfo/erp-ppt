[@b.head/]

<div class="container" style="margin-top:20px">
   <div class="row"  style="justify-content: center;">
     <form name="searchform" action="${base}/track/search" method="post">
     <input type="hidden" name="_params" value="q=${Parameters['q']!}"/>
      <div class="input-group">
         <input type="text" style="width:400px" name="q" class="form-control" placeholder="产品 名称 型号 客户号" value="${Parameters['q']!}"/>
              <span class="input-group-btn">
                 <button class="btn btn-info btn-search" >查找</button>
              </span>
     </div>
     </form>
  </div>
</div>

<div class="table-responsive">
 <table class="table table-striped">
  <thead>
    <tr>
      <th>序号</th><th>内部编号</th><th>品名</th><th>机型规格</th><th>数量</th><th>下单时间</th><th>预计出货</th>
      <th>生 产状态[#list 1..120 as i]&nbsp;[/#list]</th>
    </tr>
  </thead>
  <tbody>
  [#list products?sort_by("planShippedOn") as product]
    <tr [#if product.nearShippedOn] style="background-color:pink"[#elseif product.postponed] style="background-color:red"[/#if]>
      <td>${product_index+1}</td>
      <td><span title="客户号:${product.customCode}">${product.code}</span></td>
      <td>${product.name}</td>
      <td>${product.specification!}</td>
      <td>${product.amount}</td>
      <td>${product.createdAt?string("yyyy-MM-dd HH:mm")}</td>
      <td>${product.planShippedOn}</td>
      <td>
      <div class="btn-group btn-group-sm" role="group">
      [#list product.tasks?sort_by(['category','code']) as t]
      [#if t.finished]
      <a class="btn" style="background-color:#4caf50" title="${t.finishedBy} 完成于 ${t.finishedAt}">${t.category.name?html}</a>
      [#else]
      <a class="btn btn-secondary" title="点击填写完成进度" onclick="editTask(${t.id})">${t.category.name?html}</a>
      [/#if]
      [/#list]
       </div>
      </td>
    </tr>
  [/#list]
  </tbody>
</table>
</div>

<script>
  function editTask(taskId){
     var form=document.searchform;
     form.action="${base}/track/updateTask?task.id="+taskId;
     bg.form.submit(form);
  }
</script>
[@b.foot/]
