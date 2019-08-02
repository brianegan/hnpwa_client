import 'dart:async';
import 'dart:convert';

import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:hnpwa_client/src/models/feed.dart';
import 'package:hnpwa_client/src/models/item.dart';
import 'package:http/http.dart';

class HnpwaClient {
  final Client client;
  final Uri baseUri;

  HnpwaClient({Client client, Uri baseUrl})
      : this.client = client ?? Client(),
        this.baseUri = Uri.parse('https://api.hnpwa.com/v0/');

  Future<Item> item(int id) async {
    final response = await client.get(_buildUrl('item/$id.json'));

    if (response.statusCode == 200) {
      return Item.fromJson(_decodeResponse(response));
    } else {
      throw Exception(
        '${response.statusCode} Error Fetching HNPWA Results: ${response.body}',
      );
    }
  }

  Future<User> user(String id) async {
    final response = await client.get(_buildUrl('user/$id.json'));

    if (response.statusCode == 200) {
      return User.fromJson(_decodeResponse(response));
    } else {
      throw Exception(
        '${response.statusCode} Error Fetching HNPWA Results: ${response.body}',
      );
    }
  }

  Future<Feed> news({int page = 1}) {
    assert(page >= 1 && page <= 10, 'News endpoints provide pages 1-10');

    return _fetchFeed(
      url: _buildUrl('news/$page.json'),
      currentPage: page,
      maxPages: 10,
    );
  }

  Future<Feed> newest({int page = 1}) {
    assert(page >= 1 && page <= 12, 'Newest endpoints provide pages 1-12');

    return _fetchFeed(
      url: _buildUrl('newest/$page.json'),
      currentPage: page,
      maxPages: 12,
    );
  }

  Future<Feed> ask({int page = 1}) {
    assert(page >= 1 && page <= 2, 'Ask endpoints only support pages 1 & 2');

    return _fetchFeed(
      url: _buildUrl('ask/$page.json'),
      currentPage: page,
      maxPages: 2,
    );
  }

  Future<Feed> show({int page = 1}) {
    assert(page >= 1 && page <= 2, 'Show endpoints only support pages 1 & 2');

    return _fetchFeed(
      url: _buildUrl('show/$page.json'),
      currentPage: page,
      maxPages: 2,
    );
  }

  Future<Feed> jobs() {
    return _fetchFeed(
      url: _buildUrl('jobs/1.json'),
      currentPage: 1,
      maxPages: 1,
    );
  }

  String _buildUrl(String path) {
    return baseUri
        .replace(path: '${baseUri.pathSegments.join('/')}$path')
        .toString();
  }

  Future<Feed> _fetchFeed({String url, int currentPage, int maxPages}) async {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return Feed.from(
        items: (_decodeResponse(response) as List).cast<Map<String, dynamic>>(),
        currentPage: currentPage,
        nextPage: currentPage < maxPages ? currentPage + 1 : null,
      );
    } else {
      throw Exception(
        '${response.statusCode} Error Fetching HNPWA Results: ${response.body}',
      );
    }
  }

  _decodeResponse(Response response) =>
      json.decode(utf8.decode(response.bodyBytes));
}
