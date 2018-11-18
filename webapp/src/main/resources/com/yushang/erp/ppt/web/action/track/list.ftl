[@b.head/]

<div class="container" style="margin-top:20px">
   <div class="row">
     <div class="col-md-2">产品生产计划跟踪系统</div>
     <form name="searchform" action="${base}/track/search" method="post">
     <input type="hidden" name="_params" value="q=${Parameters['q']!}"/>  
	 <div class="input-group col-md-8" style="margin-top:0px positon:relative">  
	       <input type="text" name="q" class="form-control" placeholder="产品 名称 型号 客户号" value="${Parameters['q']!}"/>  
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
      <th>序号</th><th>内部编号</th><th>品名</th><th>机型规格</th><th>数量</th><th>预计出货</th>
      <th>生 产状态[#list 1..120 as i]&nbsp;[/#list]</th> 
    </tr>
  </thead>
  <tbody>
  [#list products as product]
    <tr>
      <td>${product_index+1}</td>
      <td><span title="客户号:${product.customCode}">${product.code}</span></td>
      <td>${product.name}</td>
      <td>${product.specification!}</td>
      <td>${product.amount}</td>
      <td>${product.planShippedOn}</td>
      <td>
      <div class="btn-group btn-group-sm" role="group">
      [#list product.tasks?sort_by(['category','code']) as t]
      [#if t.finished]
      <a class="btn" style="background-color:#4caf50" title="${t.finishedBy} 完成于 ${t.finishedOn}">${t.category.name?html}</a>
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