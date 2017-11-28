/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void authenticate=(
 *    Future<bool> f(
 *      Uri url,
 *      String scheme,
 *      String realm
 *    )
 * )
 * Sets the function to be called when a site is requesting authentication.
 * The URL requested and the security realm from the server are passed in the
 * arguments url and realm.
 *
 * The function returns a Future which should complete when the authentication
 * has been resolved. If credentials cannot be provided the Future should
 * complete with false. If credentials are available the function should add
 * these using addCredentials before completing the Future with the value true.
 *
 * If the Future completes with true the request will be retried using the
 * updated credentials. Otherwise response processing will continue normally.
 * @description Checks that this setter sets the function to be called when a
 * site is requesting authentication. Test Digest authentication
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import 'dart:async';
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 0);
  server.listen((HttpRequest request) {
    var response = request.response;
    if (request.headers[HttpHeaders.AUTHORIZATION] == null) {
      response.statusCode = HttpStatus.UNAUTHORIZED;
      StringBuffer authHeader = new StringBuffer();
      authHeader.write('Digest');
      authHeader.write(', realm="realm"');
      authHeader.write(', nonce="123"');
      authHeader.write(', domain="/xxxt/"');
      response.headers.set(HttpHeaders.WWW_AUTHENTICATE, authHeader);
      response.close();
    } else {
      var authorization = request.headers[HttpHeaders.AUTHORIZATION][0];
      Expect.isTrue(authorization.contains('Digest'));
      Expect.isTrue(authorization.contains('username="co19-test"'));
      Expect.isTrue(authorization.contains('realm="realm"'));
      Expect.isTrue(authorization.contains('algorithm="MD5"'));
      Expect.isTrue(authorization.contains('uri="/xxx"'));
      response.close();
      server.close();
      asyncEnd();
    }
  });
  HttpClient client = new HttpClient();

  client.authenticate = (Uri url, String scheme, String realm) {
    Expect.equals("Digest", scheme);
    Expect.equals("realm", realm);
    Completer completer = new Completer();
    client.addCredentials(
        Uri.parse(
            "http://${InternetAddress.LOOPBACK_IP_V4.address}:${server.port}/xxx"),
        "realm",
        new HttpClientDigestCredentials("co19-test", "password"));
    completer.complete(true);

    return completer.future;
  };

  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.LOOPBACK_IP_V4.address}:${server.port}/xxx"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.transform(UTF8.decoder).listen((content) {});
  });
}

main() {
  asyncStart();
  test();
}