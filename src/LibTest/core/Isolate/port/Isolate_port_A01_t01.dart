/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When [Isolate]s are used as entry-points, the [port] field contains a
 * [ReceivePort].
 * @description Checks that the method returns null if the isolate is not used as an entry-point.
 * @author msyabro
 * @reviewer kaigorodov
 */

void main() {
  Isolate i = new Isolate();
  void check(SendPort port) {
    Expect.equals(null, i.port);
  }
  check();
  Expect.equals(null, i.port);
  i.spawn().then(check);
}
