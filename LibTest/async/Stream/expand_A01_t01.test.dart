/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 *    Creates a new stream from this stream that converts each element into zero
 * or more events.
 *    Each incoming event is converted to an Iterable of new events, and each of
 * these new events are then sent by the returned stream in order.
 * @description Checks that returned stream produces all the values generated by
 * the convert function.
 * @author a.semenov@unipro.ru
 */
library expand_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T,S>(Stream<T> s, Iterable<S> convert(T value), List<S> expected) {
  AsyncExpect.data(expected, s.expand(convert));
}

void test(CreateStreamFunction create) {
  check(create([]), (value) => [], []);
  check(create([]), (value) => [1], []);

  check(create([1, 2, 3]), (value) => [], []);
  check(create([1, 2, 3]), (value) => [1], [1, 1, 1]);
  check(create([1, 2, 3]), (value) => [value], [1, 2, 3]);
  check(create([1, 2, 3]), (v) => [v, v], [1, 1, 2, 2, 3, 3]);
  check(create([1, 2, 3]), (v) => [null, v], [null, 1, null, 2, null, 3]);

  check<List<int>, int>(create([[1, 2, 3], [4, 5]]), (value) => value,
    [1, 2, 3, 4, 5]);
}
