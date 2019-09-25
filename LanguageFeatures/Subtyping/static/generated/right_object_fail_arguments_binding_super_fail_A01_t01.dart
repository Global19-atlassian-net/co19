/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Object: if T1 is Object then:
 *  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
 *      B <: Object
 *  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
 *  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
 *  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
 *  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
 *      hold (per above, the result of the subtyping query is false).
 *  - Otherwise T0 <: T1 is true.
 * @description Check that if T0 is an unpromoted type variable with bound B
 * but B is not subtype of Object then T0 is not subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test superclass members. Super constructor
 * required argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from right_object_fail_A01.dart and 
 * arguments_binding_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class B {}
class T0 extends B {}

T0? t0Instance = new T0();
Object t1Instance = new Object();

const t1Default = const Object();





class ArgumentsBindingSuper1_t02 {
  Object m;

  ArgumentsBindingSuper1_t02(Object value): m = value {}
  ArgumentsBindingSuper1_t02.named(Object value, {Object val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(Object value, [Object val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(Object val) {}
  void superTestPositioned(Object val, [Object val2 = t1Default]) {}
  void superTestNamed(Object val, {Object val2 = t1Default}) {}
  Object get superGetter => t0Instance; //# 35: compile-time error
  void set superSetter(Object val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(T0? t1) : super(t1) {} //# 01: compile-time error
  ArgumentsBinding1_t02.c1(T0? t1) : super.named(t1) {} //# 02: compile-time error
  ArgumentsBinding1_t02.c2(Object t1, T0? t2) : super.named(t1, val2: t2) {} //# 03: compile-time error
  ArgumentsBinding1_t02.c3(T0? t1) : super.positional(t1) {} //# 04: compile-time error
  ArgumentsBinding1_t02.c4(Object t1, T0? t2) : super.positional(t1, t2) {} //# 05: compile-time error
  ArgumentsBinding1_t02.c5(Object t1) : super.short(t1) {} //# 06: compile-time error

  ArgumentsBinding1_t02.valid() : super(t1Default) {}

  test() {
    superTest(t0Instance); //# 14: compile-time error

    this.superTest(t0Instance); //# 15: compile-time error

    super.superTest(t0Instance); //# 16: compile-time error

    superTestPositioned(t0Instance); //# 17: compile-time error

    this.superTestPositioned(t0Instance); //# 18: compile-time error

    super.superTestPositioned(t0Instance); //# 19: compile-time error

    superTestPositioned(t1Instance, t0Instance); //# 20: compile-time error

    this.superTestPositioned(t1Instance, t0Instance); //# 21: compile-time error

    super.superTestPositioned(t1Instance, t0Instance); //# 22: compile-time error

    superTestNamed(t0Instance); //# 23: compile-time error

    this.superTestNamed(t0Instance); //# 24: compile-time error

    super.superTestNamed(t0Instance); //# 25: compile-time error

    superTestNamed(t1Instance, val2: t0Instance); //# 26: compile-time error

    this.superTestNamed(t1Instance, val2: t0Instance); //# 27: compile-time error

    super.superTestNamed(t1Instance, val2: t0Instance); //# 28: compile-time error

    superSetter = t0Instance; //# 29: compile-time error

    this.superSetter = t0Instance; //# 30: compile-time error

    super.superSetter = t0Instance; //# 31: compile-time error

    superGetter; //# 32: compile-time error

    this.superGetter; //# 33: compile-time error

    super.superGetter; //# 34: compile-time error
  }
}



test<T extends B?>(T t0Instance) {
  
  new ArgumentsBinding1_t02(t0Instance); //# 01: compile-time error
  new ArgumentsBinding1_t02.c1(t0Instance); //# 02: compile-time error
  new ArgumentsBinding1_t02.c2(t1Instance, t0Instance); //# 03: compile-time error
  new ArgumentsBinding1_t02.c3(t0Instance); //# 04: compile-time error
  new ArgumentsBinding1_t02.c4(t1Instance, t0Instance);//# 05: compile-time error
  new ArgumentsBinding1_t02.c5(t0Instance); //# 06: compile-time error
  new ArgumentsBinding1_t02.valid().superTest(t0Instance); //# 07: compile-time error
  new ArgumentsBinding1_t02.valid().superTestPositioned(t0Instance); //# 08: compile-time error
  new ArgumentsBinding1_t02.valid().superTestPositioned(t1Instance, t0Instance); //# 09: compile-time error
  new ArgumentsBinding1_t02.valid().superTestNamed(t0Instance); //# 10: compile-time error
  new ArgumentsBinding1_t02.valid().superTestNamed(t1Instance, val2: t0Instance); //# 11: compile-time error
  new ArgumentsBinding1_t02.valid().superSetter = t0Instance; //# 12: compile-time error
  new ArgumentsBinding1_t02.valid().superGetter; //# 13: compile-time error
  new ArgumentsBinding1_t02.valid().test();

}

main() {
  test<T0?>(t0Instance);
}