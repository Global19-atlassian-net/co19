/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> reversed
 * Returns an [Iterable] of the objects in [this] list in reverse order.
 * @description Checks that [reversed] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list) {
  dynamic l = new Float32x4List.fromList(list);
  Expect.throws(() { l.reversed = list; }, (e) => e is NoSuchMethodError);
}

main() {
  check([]);
  var list = List<Float32x4>.filled(255, pack(0.0));
  for (int i = 0; i < 255; ++i) {
    list[i] = pack(i * 1.0);
  }
  check(list);
}
