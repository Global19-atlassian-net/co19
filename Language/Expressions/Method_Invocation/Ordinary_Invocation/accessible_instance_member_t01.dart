/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o. It is a static type warning if T
 * does not have an accessible instance member named m unless either:
 * • T or a superinterface of T is annotated with an annotation denoting a
 *   constant identical to the constant @proxy defined in dart:core. Or
 * • T is Type, e is a constant type literal and the class corresponding to e
 *   has a static getter named m.
 * • T is Function and m is call. The type Function is treated as if it has a
 *   call method for any possible signature of call. The expectation is that
 *   any concrete subclass of Function will implement call. Note that a warning
 *   will be issue if this is not the case. Furthermore, any use of call on a
 *   subclass of Function that fails to implement call will also provoke a
 *   warning, as this exemption is limited to type Function, and does not apply
 *   to its subtypes.
 * @description Checks that it is a compile error if T does not have an
 * instance member named m.
 * @compile-error
 * @author msyabro
 */

class C {}

main() {
  C o = new C();
  o.nonExistingMethod();
}

