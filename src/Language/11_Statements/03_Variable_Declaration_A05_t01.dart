/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Executing a variable declaration statement T id = e;  is equivalent
 * to evaluating the assignment expression id = e, except that the assignment 
 * is considered legal even if the variable is final.
 * @description Checks that a variable declaration statement T id = e; indeed results in
 * variable id being assigned the value of e, whether or not it's final.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  var v;

  bool id = false;
  v = false;
  Expect.isTrue(id == v);

  final int id1 = 11;
  v = 11;
  Expect.isTrue(id1 == v);

  final String id2 = "id2";
  v =  "id2";
  Expect.isTrue(id2 == v);

  Object id3 = null;
  v =  null;
  Expect.isTrue(id3 == v);
}

