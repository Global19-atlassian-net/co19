/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if an optional parameter (named or otherwise) with
 * no default value has a potentially non-nullable type.
 *
 * @description Check that it is a compile-time error if an optional parameter
 * (named or otherwise) with no default value has a potentially non-nullable
 * type.  Test F*, where F is a function type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "legacy_lib.dart";

class C {
  static void test1(var v, [LegacyFoo f]) {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

  static void test2(var v, {LegacyFoo f}) {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

  void test11(var v, [LegacyFoo f]) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  void test22(var v, {LegacyFoo f}) {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test1(var v, [LegacyFoo f]) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

void test2(var v, {LegacyFoo f}) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
