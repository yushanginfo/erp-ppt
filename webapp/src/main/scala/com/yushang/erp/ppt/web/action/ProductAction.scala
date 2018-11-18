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
