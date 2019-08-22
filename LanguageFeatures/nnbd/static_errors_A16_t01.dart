/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is not an error for the body of a late field to reference this.
 *
 * @description Check that it is not an error for the body of a late field to
 * reference this.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class C {
  num pi = 3.14;
  late num p = this.pi;
}

main() {
  Expect.equals(3.14, new C().p);
}