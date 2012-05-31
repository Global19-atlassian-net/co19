/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Libraries are units of privacy. A private declaration declared within a library
 * L can only be accessed by code within L. Any attempt to access a private member declaration
 * from outside L will cause a run-time error.
 * @description Checks that an attempt to access a private static member from outside L is
 * a compile-time error.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#import("12_Libraries_and_Scripts_A05_t01_lib.dart", prefix: "lib");

main() {
  try {
    lib.C._x;
  } catch(var e) {}
}
