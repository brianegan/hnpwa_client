## 2.0.0

- Works with http 0.12.x
- Fixes UTF-8 Encoding (Thanks Michael Bui!!!)
- Introduces ItemType enum to decode Strings and know which ItemTypes are available
- Remove `toJson` methods since HNPWA API is read-only

## 1.0.0

- Initial version -- provides ability to fetch feeds by page, items, and users from the HNPWA API
- Fetch data with HnpwaClient class
- Provides the following models:
  - Feed
  - FeedItem
  - Item
  - User
