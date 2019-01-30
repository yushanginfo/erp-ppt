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

import com.yushang.erp.ppt.model.Task
import org.beangle.data.dao.OqlBuilder
import org.beangle.commons.collection.Order

class TaskAction extends RestfulAction[Task] {

  override def saveAndRedirect(task: Task): View = {
    if (task.finishedAt != null && task.finishedAt != None) {
      task.finished = true
    } else {
      task.finished = false
    }
    entityDao.saveOrUpdate(task)
    super.saveAndRedirect(task)
  }

  protected override def getQueryBuilder(): OqlBuilder[Task] = {
    val builder = OqlBuilder.from(classOf[Task], "task")
    populateConditions(builder)
    builder.orderBy(get(Order.OrderStr).orNull).limit(getPageLimit)
    get("finishedOn") foreach { on =>
      if (!on.isEmpty())
        builder.where("to_char(task.finishedAt,'yyyy-MM-dd')=:on", on)
    }
    builder
  }
}
