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
