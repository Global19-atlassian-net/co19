/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a do statement of the form do s while (e); proceeds as follows:
 * The statement s is executed. Then, the expression e is evaluated to an object o.
 * In checked mode, it is a dynamic type error if o is not of type bool.
 * Otherwise, o is then subjected to boolean conversion, producing an object r.
 * If r is false, execution of the do statement is complete.
 * If r is true, then the do statement is re-executed recursively.
 * @description Checks that the number of iterations is correct for various valid expressions.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  var count = 0;
  do {
    ++count;
  } while (false);
  Expect.equals(1, count);

  count = 0;
  do {
    ++count;
    if (count == 100)
      break;
  } while (true);
  Expect.equals(100, count);

  count = 0;
  do {
    ++count;
  } while (count < 5);
  Expect.equals(5, count);
  
  count = 0;
  var it = [0,1,2,3,4,5].iterator();
  do {
    it.next();
    ++count;
  } while (it.hasNext());
  Expect.equals(6, count);
}

