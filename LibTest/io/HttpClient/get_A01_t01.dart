/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpClientRequest> get(
 *  String host,
 *  int port,
 *  String path
 *  )
 * Opens a HTTP connection using the GET method.
 *
 * The server is specified using host and port, and the path (including a
 * possible query) is specified using path.
 *
 * See open for details.
 * @description Checks that this method opens a HTTP connection using the GET
 * method
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

test() async {
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    Expect.equals("GET", request.method);
    Expect.equals("/xxx", request.uri.toString());
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.get(localhost, server.port, "/xxx")
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
        response.transform(UTF8.decoder).listen((content) {
          Expect.equals(helloWorld, content);
    });
  });
}

main() {
  asyncStart();
  test();
}