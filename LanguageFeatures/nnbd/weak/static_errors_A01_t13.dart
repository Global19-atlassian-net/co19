/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, getter or operator on
 * an expression whose type is potentially nullable and not dynamic, except for
 * the methods, setters, getters, and operators on Object.
 *
 * @description  Check that it is no compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable if
 * they are  methods, setters, getters, and operators on Object. Test
 * that methods of Object are allowed for the type <T extends Object?>
 * @author sgrekhov@unipro.ru
 */
// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

class C<T extends Object?> {
  T a;
  C(this.a);

  test() {
    Expect.isNotNull(a.hashCode);
    Expect.isNotNull(a.toString());
    Expect.isNotNull(a.runtimeType);
    Expect.isFalse(a == new Object());
  }
}

main() {
  C<Object?> c = new C<Object?>(new Object());
  c.test();
}