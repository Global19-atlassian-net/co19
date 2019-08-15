/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to read a field or tear off a method from an
 * expression whose type is potentially nullable and not dynamic, except for the
 * methods and fields on Object.
 *
 * @description Check that it is a compile-time error to read a field or tear
 * off a method from an expression whose type is potentially nullable and not
 * dynamic. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

class A {
  final String s = "Lily was here";
  void foo() {}
}

typedef AAlias = A?;

class C<X extends AAlias> {
  X x;
  C(this.x);

  test() {
    x.s;
//   ^
// [analyzer] unspecified
// [cfe] unspecified
    x.foo;
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  A? a = new A();
  C<A?> c = new C<A?>(a);
  c.test();
}
