package com.yushang.erp.ppt.web.action

import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.entity.action.RestfulAction

import com.yushang.erp.ppt.model.Product
import com.yushang.erp.ppt.model.Task
import com.yushang.erp.ppt.model.TaskCategory

class ProductAction extends RestfulAction[Product] {

  override def editSetting(product: Product): Unit = {
    val taskCategories = entityDao.getAll(classOf[TaskCategory])
    put("taskCategories", taskCategories)
    if (!product.persisted) {
      taskCategories foreach { c =>
        product.tasks += new Task(product, c)
      }
    }
  }

  override def saveAndRedirect(product: Product): View = {
    val categories = entityDao.find(classOf[TaskCategory], getAll("taskCategoryId", classOf[Int])).toSet
    val exists = product.tasks.map(_.category).toSet
    val removed = product.tasks filter (x => !categories.contains(x.category))
    product.tasks --= removed
    val added = categories -- exists
    added foreach { x =>
      product.tasks += new Task(product, x)
    }

    super.saveAndRedirect(product)
  }
}