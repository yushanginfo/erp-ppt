package com.yushang.erp.ppt.model

import org.beangle.data.orm.MappingModule

class DefaultMapping extends MappingModule {

  override def binding() {
    defaultIdGenerator("auto_increment")
    bind[Product]
      .on(e => declare(
        e.tasks is depends("product")))

    bind[TaskCategory]
    bind[Task]
    
    bind[Enterprise]
  }

}