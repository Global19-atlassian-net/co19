/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion (Unified collections) Let [e] be a [setOrMapLiteral].
 *
 * If [e] has a context [C], and the base type of [C] is [Cbase] (that is,
 * [Cbase] is [C] with all wrapping [FutureOrs] removed), and [Cbase] is not
 * [?], then let [S] be the greatest closure.
 *
 * If [e] has [typeArguments] then:
 * ...
 * If there are exactly two type arguments [K] and [V], then [e] is a map
 * literal with static type [Map<K, V>].
 *
 * @description Checks that [setOrMapLiteral] has two type argument, it's a map.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018
import "../../Utils/expect.dart";

main() {
  dynamic aSet = {1, 2, 3};
  dynamic aList = [1, 2, 3];
  dynamic aMap = {1: 1, 2: 2, 3: 3};

  var res1 = <int, int>{...?aMap};
  Expect.isTrue(res1 is Map);

  var res2;
  Expect.throws(() => res2 = <int, int>{...aList});
  Expect.throws(() => res2 = <int, int>{...aSet});
}