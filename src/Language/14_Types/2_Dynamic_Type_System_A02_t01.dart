/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is malformed iff:
 *  - T has the form id, and id does not denote a type available in the enclosing lexical scope.
 *  - T is a parameterized type of the form G<S1, .., Sn>, and any of the following conditions hold:
 *    - Either G or Si, 1 <= i <= n are malformed.
 *    - G is not a generic type with n type parameters.
 *    - Let Ti be the type parameters of G (if any) and let Bi be the bound of Ti, 1 <= i <= n,
 *      and Si is not a subtype of [S1,  ..., Sn/T1,  ..., Tn]Bi,  1 <= i <= n,
 * In checked mode, it is a dynamic type error if a malformed type is used in a subtype test.
 * In production mode, an undeclared type is treated as an instance of type dynamic.
 * @description Checks that it is a dynamic type error if a malformed type is used in a
 * subtype test.
 * static-warning
 * @author msyabro
 * @reviewer iefremov
 * @reviewer rodionov
 * @issue 5809
 */

import "../../Utils/dynamic_check.dart";

class C<T, U, V> {}
class Bounded<T extends num> {}
class BoundedInt<T extends int> {}

main() {
  // Expressions|Type test dictates that this should produce a runtime error in both modes
  try {
    null is MalformedType;
    Expect.fail("Runtime error expected");
  } on Error catch(e) {
    if(isCheckedMode()) {
      Expect.isTrue(e is TypeError);
    }
  }
  
  checkTypeError( () {
    C<int, double, MalformedType> x = new C();
  });
  checkTypeError( () {
    // non-normative, but spec contains this statement:
    // "we have opted to treat a malformed type as an error type that has no subtypes or supertypes"
    Expect.isFalse(null is C<int, double, MalformedType>);
  });
  
  checkTypeError( () {
    C<int, double, MalformedType> x = new C();
  });
  
  checkTypeError( () {
    Bounded<String> x = new Bounded();
  });
  
  checkTypeError( () {
    BoundedInt<num> x = new BoundedInt();
  });
  
  checkTypeError( () {
    C<Bounded<String>, C, C> x = new C();
  });
  
  checkTypeError( () {
    C<C<MalformedType, int, int>, C, C> x = new C();
  });
}
