/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 * `#' `import' `(' stringLiteral (`, ' `prefix:
 * ' stringLiteral)? `) `;'
 * ;
 * @description Checks that it is a compile-time error if an import
 * directive is missing the '#' symbol.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

import("2_Imports_lib.dart", prefix:"Library");

main() {
  try {
    Library._privateVar = 0;
  } catch(var e) {}
}
