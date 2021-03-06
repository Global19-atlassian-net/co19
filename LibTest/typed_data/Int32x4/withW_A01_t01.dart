/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4 withW(int w)
 * Returns a new [Int32x4] copied from [this] with a new [w] value.
 * @description Checks that a new object is created and all its lanes except
 * [w] equal to corresponding lanes of [this]. Checks that [w] of new [Int32x4]
 * equals the [w] parameter of the method.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, newW) {
  var obj1 = new Int32x4(x, y, z, w);
  var obj2 = obj1.withW(newW);

  Expect.isFalse(obj1 == obj2);
  Expect.equals(x, obj2.x);
  Expect.equals(y, obj2.y);
  Expect.equals(z, obj2.z);
  Expect.equals(newW, obj2.w);
}

main() {
  check(0, 0, 0, 0,       0);
  check(1, 1, 1, 1,       0);
  check(10, 23, 43, 100,  256);
}
