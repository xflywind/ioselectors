# Package

version       = "0.1.7"
author        = "flywind"
description   = "Selectors extension."
license       = "Apache-2.0"
srcDir        = "src"



# Dependencies

requires "nim >= 1.2.6"
requires "wepoll >= 0.1.0"

requires "timerwheel >= 0.1.2"

task tests, "Tests all":
  exec "testament all"
