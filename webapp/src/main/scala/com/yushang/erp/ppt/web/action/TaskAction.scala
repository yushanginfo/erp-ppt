package com.yushang.erp.ppt.web.action

import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.entity.action.RestfulAction

import com.yushang.erp.ppt.model.Task

class TaskAction extends RestfulAction[Task] {

  override def saveAndRedirect(task: Task): View = {
    if (task.finishedOn != null && task.finishedOn != None) {
      task.finished = true
    } else {
      task.finished = false
    }
    entityDao.saveOrUpdate(task)
    super.saveAndRedirect(task)
  }
}