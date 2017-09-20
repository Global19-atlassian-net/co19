/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String targetSync()
 * Synchronously gets the target of the link. Returns the path to the target.
 *
 * If the returned target is a relative path, it is relative to the directory
 * containing the link.
 *
 * If the link does not exist, or is not a link, throws a FileSystemException.
 * @description Check that this method returns the target of the link. Test
 * relative path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory target = getTempDirectorySync();
  Link link = new Link(target.path + Platform.pathSeparator + getTempFileName(extension: "lnk"));
  link.createSync("..");
  try {
    if (Platform.isWindows) {
      Expect.equals(target.parent.path + Platform.pathSeparator, link.targetSync());
    } else {
      Expect.equals("..", link.targetSync());
    }
  } finally {
    deleteLinkWithTarget(link);
  }
}