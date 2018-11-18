package com.yushang.erp.ppt.model

import org.beangle.data.model.LongId
import java.time.LocalDate

class Task extends LongId {

  var product: Product = _

  var category: TaskCategory = _

  var finished: Boolean = _

  var finishedBy: Option[String] = None

  var finishedOn: Option[LocalDate] = None

  def this(product: Product, category: TaskCategory) {
    this()
    this.product = product
    this.category = category
  }

}