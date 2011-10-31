/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEven()
 * @description Checks the method on NaN.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview Assumed NaN.isEven() must yield false.
 */


main() {
  double nan = 0 / 0;
  Expect.isFalse(nan.isEven());
  Expect.isFalse((-nan).isEven());
}
