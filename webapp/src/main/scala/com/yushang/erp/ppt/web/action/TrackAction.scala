/*
 * OpenURP, Agile University Resource Planning Solution.
 *
 * Copyright © 2014, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.yushang.erp.ppt.web.action

import org.beangle.data.dao.EntityDao
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.entity.helper.QueryHelper

import com.yushang.erp.ppt.model.Product
import com.yushang.erp.ppt.model.Task
import org.beangle.webmvc.entity.helper.PopulateHelper
import com.yushang.erp.ppt.model.Enterprise

class TrackAction extends ActionSupport {

  var entityDao: EntityDao = _

  def index: View = {
    val builder = OqlBuilder.from(classOf[Product], "product").where("product.finished=false")
    builder.select("count(*)")
    put("productCount", entityDao.search(builder).head)
    forward()
  }

  def search: View = {
    val builder = OqlBuilder.from(classOf[Product], "product").where("product.finished=false")
    QueryHelper.populateConditions(builder)
    get("q") foreach { q =>
      val c = "%" + q + "%"
      builder.where("product.name like :q or product.customCode like :q or product.specification like :q or product.code like :q", c)
    }
    put("products", entityDao.search(builder))
    forward()
  }

  def updateTask(): View = {
    val taskId = get("task.id", 0L)
    val task = entityDao.get(classOf[Task], taskId)
    put("task", task)
    if (task.finished) forward("taskInfo")
    else forward()
  }

  def saveTask(): View = {
    val taskId = get("task.id", 0L)
    val task = entityDao.get(classOf[Task], taskId)
    if (task.finished) {
      put("task", task)
      forward("taskInfo")
    } else {
      PopulateHelper.populate(task, classOf[Task].getName, "task")
      task.finished = true
      entityDao.saveOrUpdate(task)
      redirect("search", "info.save.success")
    }
  }
}
