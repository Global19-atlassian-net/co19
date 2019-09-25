/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Super-Interface: T0 is an interface type with super-interfaces S0,...Sn
 * - and Si <: T1 for some i
 * @description Check that if there is no i, such that Si <: T1, then T0 is not
 * subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to global variable of type T1.
 * Assignment to global variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from super_interface_fail_A01.dart and 
 * global_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}

// Missing subtype relation to T1
abstract class S0 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

T0 t0Instance = new T();
T1 t1Instance = new T1();

const t1Default = const T1();




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance; //# 03: compile-time error
  }
  GlobalVariableTest.valid() {}

  foo() {
    t1Instance = t0Instance; //# 04: compile-time error
  }
  static test() {
    t1Instance = t0Instance; //# 05: compile-time error
  }
}

main() {
  t1Instance = t0Instance; //# 01: compile-time error

  bar () {
    t1Instance = t0Instance; //# 02: compile-time error
  }
  bar(); //# 02: compile-time error

  new GlobalVariableTest(); //# 03: compile-time error
  new GlobalVariableTest.valid().foo(); //# 04: compile-time error
  GlobalVariableTest.test(); //# 05: compile-time error
}
