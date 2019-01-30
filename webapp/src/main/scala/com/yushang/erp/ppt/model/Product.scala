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
package com.yushang.erp.ppt.model

import java.time.Instant
import java.time.LocalDate

import org.beangle.commons.collection.Collections
import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Coded
import org.beangle.data.model.pojo.Named
import org.beangle.data.model.pojo.Remark

class Product extends LongId with Coded with Named with Remark {

  var customCode: String = _

  var productCode: String = _

  var specification: Option[String] = None

  var amount: Int = _

  var createdAt: Instant = _

  var planShippedOn: LocalDate = _

  var shippedOn: Option[LocalDate] = None

  var tasks = Collections.newBuffer[Task]

  var finished: Boolean = _

  var finishedOn: Option[LocalDate] = None

  var archived: Boolean = _

  def taskCategories: Set[TaskCategory] = {
    tasks.map(_.category).toSet
  }

  def postponed: Boolean = {
    !finished && LocalDate.now().isAfter(planShippedOn)
  }

  /**
   * 提前一天提示快要延期
   */
  def nearShippedOn: Boolean = {
    val now = LocalDate.now()
    !finished && now.isAfter(planShippedOn.minusDays(2)) && !now.isAfter(planShippedOn)
  }
}
