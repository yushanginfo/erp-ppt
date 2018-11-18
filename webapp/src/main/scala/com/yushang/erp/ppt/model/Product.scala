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
}