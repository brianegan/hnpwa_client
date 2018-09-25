import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:test/test.dart';

void main() {
  group('HNPWA Client tests', () {
    test('fetches an item', () async {
      final client = HnpwaClient();
      final feed = await client.item(13831370);

      expect(feed, TypeMatcher<Item>());
    });

    test('fetches a user', () async {
      final client = HnpwaClient();
      final feed = await client.user('davideast');

      expect(feed, TypeMatcher<User>());
    });

    test('fetches a list of news items', () async {
      final client = HnpwaClient();
      final feed = await client.news();

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 1);
      expect(feed.nextPage, 2);
      expect(feed.hasNextPage, true);
    });

    test('has a max of 10 news pages', () async {
      final client = HnpwaClient();
      final feed = await client.news(page: 10);

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 10);
      expect(feed.hasNextPage, false);
    });

    test('fetches a list of newest items', () async {
      final client = HnpwaClient();
      final feed = await client.newest();

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 1);
      expect(feed.nextPage, 2);
      expect(feed.hasNextPage, true);
    });

    test('has a max of 12 newest pages', () async {
      final client = HnpwaClient();
      final feed = await client.newest(page: 12);

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 12);
      expect(feed.hasNextPage, false);
    });

    test('fetches a list of ask items', () async {
      final client = HnpwaClient();
      final feed = await client.ask();

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 1);
      expect(feed.nextPage, 2);
      expect(feed.hasNextPage, true);
    });

    test('has a max of 2 ask pages', () async {
      final client = HnpwaClient();
      final feed = await client.ask(page: 2);

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 2);
      expect(feed.hasNextPage, false);
    });

    test('fetches a list of show items', () async {
      final client = HnpwaClient();
      final feed = await client.show();

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 1);
      expect(feed.nextPage, 2);
      expect(feed.hasNextPage, true);
    });

    test('has a max of 2 show pages', () async {
      final client = HnpwaClient();
      final feed = await client.show(page: 2);

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 2);
      expect(feed.hasNextPage, false);
    });

    test('fetches a single list of jobs items', () async {
      final client = HnpwaClient();
      final feed = await client.jobs();

      expect(feed, TypeMatcher<Feed>());
      expect(feed.currentPage, 1);
      expect(feed.nextPage, null);
      expect(feed.hasNextPage, false);
    });
  });
}
