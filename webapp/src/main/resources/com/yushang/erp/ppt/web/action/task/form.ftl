[@b.head/]
  [@b.toolbar title="任务环节完成信息"]
    bar.addBack();
  [/@]
  [@b.form name="taskForm" action=b.rest.save(task) theme="list"]
    [#assign p=task.product/] 
    [@b.field label="内部编号"]${p.code}[/@]
    [@b.field label="客户号"]${p.customCode}[/@]
    [@b.field label="产品"]${p.name}[/@]
    [@b.field label="规格"]${p.specification}[/@]
    [@b.field label="任务环节"]${task.category.name}[/@]
    [@b.datepicker label="完成时间" name="task.finishedOn" value=task.finishedOn required="false" /]
    [@b.textfield label="完成人" name="task.finishedBy" value=(task.finishedBy?html)! required="false" /]
    [@b.formfoot]
      [@b.submit value="提交"/]
    [/@]
  [/@]
[@b.foot/]
