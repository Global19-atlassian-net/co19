/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Interface Compositionality: T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
 * @description Check that if type T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and not all of Si <: Ui then T0 is
 * not a subtype of T1
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";
import "../../../Utils/expect.dart";

abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends U1 {}
// no subtype relation between S2 and U2
abstract class S2 {}

class C0<X, Y, Z> {}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();




namedArgumentsFunc1(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2}) {}
positionalArgumentsFunc1(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(C0<U0, U1, U2> t1) {}

  ArgumentsBindingClass.named(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2}) {}
  ArgumentsBindingClass.positional(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2]) {}

  factory ArgumentsBindingClass.fNamed(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2}) {}
  static positionalArgumentsStaticMethod(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2]) {}

  namedArgumentsMethod(C0<U0, U1, U2> t1, {C0<U0, U1, U2> t2}) {}
  positionalArgumentsMethod(C0<U0, U1, U2> t1, [C0<U0, U1, U2> t2]) {}

  set testSetter(C0<U0, U1, U2> val) {}
}

class ArgumentsBindingClassGen<X> {
  ArgumentsBindingClassGen(X t1) {}

  ArgumentsBindingClassGen.named(X t1, {X t2}) {}
  ArgumentsBindingClassGen.positional(X t1, [X t2]) {}

  factory ArgumentsBindingClassGen.fNamed(X t1, {X t2}) {
    return new ArgumentsBindingClassGen.named(t1, t2: t2);
  }
  factory ArgumentsBindingClassGen.fPositional(X t1, [X t2]) {
    return new ArgumentsBindingClassGen.positional(t1, t2);
  }

  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}

  set testSetter(X val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(C0<U0, U1, U2> t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(C0<S0, S1, S2> t0) : super (forgetType(t0)) {}
}

main() {
  // Test functions
  Expect.throws(() {
    namedArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc1(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc1(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClass(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.positional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.positional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass.fPositional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClass(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test static methods
  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance,
        t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance,
        forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test generic functions
  Expect.throws(() {
    namedArgumentsFunc2<C0<U0, U1, U2>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    namedArgumentsFunc2<C0<U0, U1, U2>>(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<C0<U0, U1, U2>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    positionalArgumentsFunc2<C0<U0, U1, U2>>(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Generic function types cannot be used as a type parameter, so test
  // generics only if it is not a generic function type and in a separate
  // function to avoid compile-time error
  if (!isGenericFunctionType) {
    testGenerics();
  }

  // Test superclass constructor call
  Expect.throws(() {
    new ArgumentsBindingDesc(t0Instance);
  }, (e) => e is TypeError);
}

void testGenerics() {
  // Test constructors
  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.named(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.named(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.positional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.positional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.fNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.fNamed(t1Instance, t2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.fPositional(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>.fPositional(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);


  // Test instance methods and setters
  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>(t1Instance).namedArgumentsMethod(
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>(t1Instance).namedArgumentsMethod(t1Instance,
    t2: forgetType(t0Instance));
    }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>(t1Instance).positionalArgumentsMethod(
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>(t1Instance).positionalArgumentsMethod(t1Instance,
    forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBindingClassGen<C0<U0, U1, U2>>(t1Instance).testSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
}