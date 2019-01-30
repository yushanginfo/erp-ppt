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

import org.beangle.data.model.LongId
import java.time.LocalDate
import java.time.LocalDateTime

class Task extends LongId {

  var product: Product = _

  var category: TaskCategory = _

  var finished: Boolean = _

  var finishedBy: Option[String] = None

  var finishedAt: Option[LocalDateTime] = None

  var finishedIp: Option[String] = None

  def this(product: Product, category: TaskCategory) {
    this()
    this.product = product
    this.category = category
  }

}
