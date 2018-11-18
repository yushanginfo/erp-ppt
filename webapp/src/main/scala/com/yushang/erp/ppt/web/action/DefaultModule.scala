package com.yushang.erp.ppt.web.action

import org.beangle.cdi.bind.BindModule

class DefaultModule extends BindModule {

  protected override def binding() {
    bind(classOf[IndexAction], classOf[ProductAction], classOf[TaskAction], classOf[TaskCategoryAction], classOf[TrackAction])
  }
}