/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is not a compile time error to write to a final variable if
 * that variable is declared late and does not have an initializer.
 *
 * @description Check that it is not a compile time error to write to a final
 * variable if that variable is declared late and does not have an initializer.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

final late g;

class C {
  static final late s;
  final late v;
}

main() {
  final late l;

  g = "Lily";
  C.s = "was";
  new C().v = "here";
  l = "Run, Forrest, run";

  Expect.equals("Lily", g);
  Expect.equals("was", C.s);
  Expect.equals("here", v);
  Expect.equals("Run, Forrest, run", l);
}