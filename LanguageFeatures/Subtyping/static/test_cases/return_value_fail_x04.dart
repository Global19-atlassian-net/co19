/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1. Return value of
 * instance method is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ReturnValueTest {
  @T1 testMethod() => t0Instance;
}

main() {
  new ReturnValueTest().testMethod();
}