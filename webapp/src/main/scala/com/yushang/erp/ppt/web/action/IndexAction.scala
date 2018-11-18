package com.yushang.erp.ppt.web.action

import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.view.View
import com.yushang.erp.ppt.model.Enterprise
import org.beangle.data.dao.EntityDao

class IndexAction extends ActionSupport {

  var entityDao: EntityDao = _

  def index: View = {
    val enterprises = entityDao.getAll(classOf[Enterprise])
    put("enterprise", enterprises.head)
    forward()
  }

}