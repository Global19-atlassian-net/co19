/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ElementStream<Event> get onLoad
 * Stream of load events handled by this Element.
 * @description Checks that correct events are delivered via the stream
 */
// OtherResources=dart-logo.png
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'load';
  dynamic x = document.body;
  if (x != null) {
    x.innerHtml = '<img src="dart-logo.png">';

    asyncStart();
    x.firstChild.onLoad.listen((e) {
      Expect.equals(type, e.type);
      asyncEnd();
    });
  } else {
    Expect.fail("Body is null");
  }
}
