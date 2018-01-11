/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * ProcessResult runSync(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     Encoding stdoutEncoding: SYSTEM_ENCODING,
 *     Encoding stderrEncoding: SYSTEM_ENCODING
 * })
 * ...
 * The encoding used for decoding stdout and stderr into text is controlled
 * through stdoutEncoding and stderrEncoding. The default encoding is
 * SYSTEM_ENCODING. If null is used no decoding will happen and the
 * ProcessResult will hold binary data.
 *
 * @description Checks that if [stderrEncoding] is null no decoding is happen
 * and the ProcessResult.stderr holds binary data.
 * @author ngl@unipro.ru
 * @issue 30945
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  if (Platform.isLinux) {
    command = 'echo';
    args = ['abc'];
  }
  if (Platform.isWindows) {
    command = 'dart';
    args = ['--version'];
  }
}

main() {
  setCommand();
  ProcessResult processResult =
      Process.runSync(command, args, stderrEncoding: null);
  Expect.equals(0, processResult.exitCode);
  Expect.isTrue(processResult.stdout is String);
  Expect.isTrue(processResult.stderr is List);
  Utf8Decoder decoder = new Utf8Decoder();
  if (Platform.isWindows) {
    Expect.equals(0, (processResult.stdout).length);
    String decoded = decoder.convert(processResult.stderr);
    Expect.isTrue(decoded.indexOf(Platform.version) > -1);
  } else {
    Expect.isTrue(processResult.stdout.substring(0, 3) == "abc");
    Expect.isTrue((processResult.stderr).length == 0);
    String decoded = decoder.convert(processResult.stderr);
    Expect.equals("", decoded);
  }
}