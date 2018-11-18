[@b.head/]
  [@b.grid items=taskCategories var="taskCategory"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="编号" width="15%" property="code"/]
      [@b.col title="名称" width="80%" property="name"/]
    [/@]
  [/@]
[@b.foot/]
