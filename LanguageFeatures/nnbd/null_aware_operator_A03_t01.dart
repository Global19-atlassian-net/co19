/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A property access e?.f translates to:
 *  SHORT[EXP(e), fn[x] => x.f]
 *
 * @description Check that a property access e?.f translates to:
 *  SHORT[EXP(e), fn[x] => x.f]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {
  String test() => "Lily was here";
}

main() {
  A? a = null;
  Expect.isNull(a?.test());
  a = new A();
  Expect.equals("Lily was here", a?.test());

  String? s = null;
  Expect.isNull(s?.toString());
  s = "Let it be";
  Expect.equals("Let it be", s?.toString());
}