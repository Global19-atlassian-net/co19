/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an initializer of the form this.v = e proceeds as
 * follows:
 * First, the expression e is evaluated to an object o. Then, the instance
 * variable v of the object denoted by this is bound to o, unless v is a final
 * variable that has already been initialized, in which case a runtime error
 * occurs. It is a dynamic type error if o is not null and the interface of the
 * class of o is not a subtype of the actual type of the field v.
 * An initializer of the form v = e is equivalent to an initializer of the form
 * this.v = e.
 * @description Checks that a compile-error occurs, by using an initializer of
 * the form this.v = e for already initiailized final instance variable.
 * @compile-error
 * @author ilya
 * @issue 13335
 */

class C {
  final x = 1;
  C() : this.x = 2 {}
}

main() {
  new C();
}
