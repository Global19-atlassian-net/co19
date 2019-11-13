/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class is a mixin with legacy class,
 * compile time error is thrown if parent legacy method parameter is of any
 * legacy type and child opted-in method parameter is [Never].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

class A1 with A {
  void test_never(Never i) {}
//     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_nullable(Never i) {}
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {}