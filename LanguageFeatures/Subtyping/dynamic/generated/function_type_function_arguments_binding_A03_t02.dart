/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Function Type/Function: T0 is a function type and T1 is Function
 * @description Check that if type T0 is a function type and T1 is Function then
 * T0 is a subtype of T1. Test function without actual arguments but returning
 * some value
 * @author sgrekhov@unipro.ru
 */
import '../../utils/common.dart';

class C {}

typedef C T0();

C t0Instance() => new C();
Function t1Instance = null;




class ArgumentsBindingSuper1_t02 {
  Function m;

  ArgumentsBindingSuper1_t02(Function value) {}
  ArgumentsBindingSuper1_t02.named(Function value, {Function val2}) {}
  ArgumentsBindingSuper1_t02.positional(Function value, [Function val2]) {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(Function val) {}
  void superTestPositioned(Function val, [Function val2]) {}
  void superTestNamed(Function val, {Function val2}) {}
  Function get superGetter => m;
  void set superSetter(Function val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value) {}
  ArgumentsBindingSuper2_t02.named(X value, {X val2}) {}
  ArgumentsBindingSuper2_t02.positional(X value, [X val2]) {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestPositioned(X val, [X val2]) {}
  void superTestNamed(X val, {X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(X t1) : super(t1) {}
  ArgumentsBinding2_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding2_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test(X t1, X t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

main() {
  ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c1(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c2(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c3(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c4(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c5(forgetType(t0Instance));

  c1.test(forgetType(t0Instance), t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  // Test type parameters

    ArgumentsBinding2_t02<Function> c2 =
    new ArgumentsBinding2_t02<Function>(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<Function>.c1(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<Function>.c2(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<Function>.c3(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<Function>.c4(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<Function>.c5(forgetType(t0Instance));

  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestPositioned(forgetType(t0Instance));
  c2.superTestPositioned(t1Instance, forgetType(t0Instance));
  c2.superTestNamed(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  c2.superGetter;
  }