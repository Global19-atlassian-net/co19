/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sends an asynchronous message to this send port. 
 * The message is copied to the receiving isolate.
 * @description Checks that message is sent to the ReceivePort.
 * @author msyabro
 */

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive(void func(var message, SendPort replyTo) {
    Expect.equals(message, "message");
    rPort.close();
  });
  
  sPort.send("message", null);
}