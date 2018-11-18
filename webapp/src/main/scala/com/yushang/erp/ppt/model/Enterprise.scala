package com.yushang.erp.ppt.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Named

class Enterprise extends LongId with Named {

  var logoUrl: Option[String] = None

  var shortName: String = _
}