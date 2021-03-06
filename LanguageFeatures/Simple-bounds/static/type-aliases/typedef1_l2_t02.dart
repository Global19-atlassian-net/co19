/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let [G] be a generic class or parameterized type alias with formal
 * type parameter declarations [F1] .. [Fk] containing formal type parameters
 * [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
 * [Xj] has a simple bound when one of the following requirements is satisfied:
 * [Bj] is omitted.
 * [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
 * a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
 * generic class or parameterized type alias [G1] (that is, [T] is a raw type),
 * every type argument of [G1] has a simple bound.
 * @description Checks that instantiate-to-bounds work as expected for
 * non-nullable non-function type alias with two depending type parameters.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

import "../../../../Utils/expect.dart";

class C<X, Y> {}

class A<X> {}
class B<X> {}

typedef G<X extends A<B>, X1 extends B<X>> = C<X, X1>;

void test(G source) {
  var fsource = toF(source);

  F<G<A<B<dynamic>>, B<A<B<dynamic>>>>> target = fsource;

  F<G<A<B<dynamic>?>?, B<A<B<dynamic>?>>>> target0 = fsource;
//                                                   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<A<B<int>>, B<A<B<dynamic>>>>> target1 = fsource;
//                                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<A<B<dynamic>>, B<A<B<int>>>>> target2 = fsource;
//                                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<A<B<Null>>, B<A<B<dynamic>>>>> target3 = fsource;
//                                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<A<B<dynamic>>, B<A<B<Null>>>>> target4 = fsource;
//                                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<A<B<int>>, B<A<B<int>>>>> target5 = fsource;
//                                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<A<B<Null>>, B<A<B<Null>>>>> target6 = fsource;
//                                          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  G();
}

main() {}
