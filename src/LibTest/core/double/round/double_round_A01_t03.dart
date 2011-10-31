/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double round()
 * @description Checks that [:round():] on a positive or negative zeros
 * returns the same value.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Expect.equals(.0.round(), .0);
  Expect.equals((-.0).round(), -.0);
}
