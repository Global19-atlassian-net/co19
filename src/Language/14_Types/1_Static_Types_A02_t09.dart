/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static type annotation grammar:
 * type:
 *   typeName typeArguments?
 * ;
 * typeName:
 *   qualified
 * ;
 * typeArguments:
 *   '<' typeList '>'
 * ;
 * typeList:
 *   type (',' type)*
 * ;
 * @description Checks that using fully qualified type name allows to import it from some library.
 * @author iefremov
 * @reviewer rodionov
 */

import "somelib.dart" as somelibprefix;

main() {
  somelibprefix.ClassFromSomeLib v1;
  somelibprefix.ClassFromSomeLib<int, String, double> v2;
  somelibprefix.ClassFromSomeLib
    <
    somelibprefix.ClassFromSomeLib<int>,
    somelibprefix.ClassFromSomeLib<bool>,
    somelibprefix.ClassFromSomeLib
    >
    v3;
}
