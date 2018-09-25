# HNPWA Dart Client

[![Build Status](https://travis-ci.org/brianegan/hnpwa_client.svg?branch=master)](https://travis-ci.org/brianegan/hnpwa_client) [![codecov](https://codecov.io/gh/brianegan/hnpwa_client/branch/master/graph/badge.svg)](https://codecov.io/gh/brianegan/hnpwa_client)

Fetch data from the [HNPWA api](https://github.com/tastejs/hacker-news-pwas/blob/master/docs/api.md)! This is an alternative to the official Hacker News API that is built for Progressive Web app and Mobile usage!

No API key needed. Just create a client and fetch data! 

## Usage

A simple usage example:

```dart
import 'package:hnpwa_client/hnpwa_client.dart';

main() async {
  final client = new HnpwaClient();

  // Print the top stories
  print(await client.news());

  // Print the 4th page of newest stories
  print(await client.newest(page: 4));

  // Access a specific item
  print(await client.item(4));

  // Query a specific user
  print(await client.user('davideast'));
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/brianegan/hnpwa_client/issues
