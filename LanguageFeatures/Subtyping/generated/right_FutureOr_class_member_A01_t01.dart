/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is FutureOr<S1> and a type T0 is a
 * subtype of a type Future<S1>, then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";

class S1 {}
class T0 implements Future<S1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<T0>(FutureOr<T0> onValue(S1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<S1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());




class ClassMember1_t01 {
  static FutureOr<S1> s = forgetType(t0Instance);
  FutureOr<S1> m = forgetType(t0Instance);
  FutureOr<S1> _p = forgetType(t0Instance);

  ClassMember1_t01() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMember1_t01.named(FutureOr<S1> value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMember1_t01.short(this.m, this._p);

  test() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  set setter(FutureOr<S1> val) {
    _p = val;
  }

  FutureOr<S1> get getter => forgetType(_p);

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(FutureOr<S1> val) {
    s = val;
  }

  static FutureOr<S1> get staticGetter => forgetType(t0Instance);
}

class ClassMember2_t01<X> {
  X m;
  X _p;

  ClassMember2_t01() {
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMember2_t01.named(X value) {
    m = value;
    _p = value;
  }

  ClassMember2_t01.short(this.m, this._p);

  test(X v) {
    m = v;
    _p = v;
  }

  set setter(X val) {
    _p = val;
  }

  FutureOr<S1> get getter => forgetType(_p);
}

main() {
  ClassMember1_t01 c1 = new ClassMember1_t01();
  c1 = new ClassMember1_t01.short(forgetType(t0Instance),
      forgetType(t0Instance));
  c1 = new ClassMember1_t01.named(forgetType(t0Instance));
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.setter = forgetType(t0Instance);
  c1.getter;

  ClassMember1_t01.s = forgetType(t0Instance);
  ClassMember1_t01.staticTest();
  ClassMember1_t01.staticSetter = forgetType(t0Instance);
  ClassMember1_t01.staticGetter;

  // Generic function types cannot be used as a type parameter, so test
  // generics only if it is not a generic function type and in a separate
  // function to avoid compile-time error
  if (!isGenericFunctionType) {
    testGenerics();
  }
}

void testGenerics() {
  ClassMember2_t01<FutureOr<S1>> c2 = new ClassMember2_t01<FutureOr<S1>>();
  c2 = new ClassMember2_t01<FutureOr<S1>>.short(forgetType(t0Instance),
  forgetType(t0Instance));
  c2 = new ClassMember2_t01<FutureOr<S1>>.named(forgetType(t0Instance));
  c2.m = forgetType(t0Instance);
  c2.test(forgetType(t0Instance));
  c2.getter;
}