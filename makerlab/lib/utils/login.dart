import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

const String baseUri = "http://identity.ua.pt/oauth/";

class UALogin {
  final String consumerKey, consumerKeySecret, accessToken, accessTokenSecret;

  Hmac _sigHasher;

  UALogin(this.consumerKey, this.consumerKeySecret,
      {this.accessToken, this.accessTokenSecret}) {
    var bytes = accessTokenSecret != null
        ? utf8.encode("$consumerKeySecret&$accessTokenSecret")
        : utf8.encode('$consumerKeySecret&');
    _sigHasher = new Hmac(sha1, bytes);
  }

  /// Sends a tweet with the supplied text and returns the response from the Twitter API.
  Future<http.Response> requestToken() {
    return _callGetApi("request_token", new Map<String, String>());
  }

  ///Access token, exchange token with an access token
  Future<http.Response> requestAccessToken(oauthToken, oauthVerifier) {
    return _callAccessToken("access_token",
        {'oauth_token': oauthToken, 'oauth_verifier': oauthVerifier});
  }

  Future<http.Response> _callAccessToken(String url, Map<String, String> data) {
    var fullUrl = Uri.parse(baseUri + url);

    var timestamp = (DateTime.now().millisecondsSinceEpoch / 100).round();

    data['oauth_consumer_key'] = consumerKey;
    data['oauth_signature_method'] = 'HMAC-SHA1';
    data['oauth_timestamp'] = "$timestamp";
    data['oauth_nonce'] = _randomString(8);
    data['oauth_version'] = '1.0a';

    data['oauth_signature'] = _generateSignature("GET", fullUrl, data);

    _generateOAuthHeader(data);

    var uri = _toQueryString(data);
    print(uri);

//    return _sendGetRequest(Uri.parse("$fullUrl?$uri"), data);
    print(Uri.parse("$fullUrl?$uri"));
    return null;
  }

  Future<http.Response> _callGetApi(String url, Map<String, String> data) {
    var fullUrl = Uri.parse(baseUri + url);

    var timestamp = (DateTime.now().millisecondsSinceEpoch / 100).round();

    data['oauth_callback'] = 'oob';
    data['oauth_consumer_key'] = consumerKey;
    data['oauth_nonce'] = _randomString(8);
    data['oauth_signature_method'] = 'HMAC-SHA1';
    data['oauth_timestamp'] = "$timestamp";
    data['oauth_version'] = '1.0a';

    data['oauth_signature'] = _generateSignature("GET", fullUrl, data);

    var oAuthHeader = _generateOAuthHeader(data);
    print(oAuthHeader);

    var uri = _toQueryString(data);

    return _sendGetRequest(Uri.parse("$fullUrl?$uri"), data);
  }

  /// Generate an OAuth signature from OAuth header values.
  String _generateSignature(
      String requestMethod, Uri url, Map<String, String> data) {
    var sigString = _toQueryString(data);
    var fullSigData =
        "$requestMethod&${_encode(url.toString())}&${_encode(sigString)}";

    return base64.encode(_hash(fullSigData));
  }

  /// Generate the raw OAuth HTML header from the values (including signature).
  String _generateOAuthHeader(Map<String, String> data) {
    var oauthHeaderValues = _filterMap(data, (k) => k.startsWith("oauth_"));

    return "OAuth " + _toOAuthHeader(oauthHeaderValues);
  }

  /// Send HTTP Request and return the response.
  Future<http.Response> _sendGetRequest(
      Uri fullUrl, Map<String, String> data) async {
    print("x = " + fullUrl.toString());
    return await http.get(fullUrl, headers: {});
  }

  Map<String, String> _filterMap(
      Map<String, String> map, bool test(String key)) {
    return new Map.fromIterable(map.keys.where(test), value: (k) => map[k]);
  }

  String _toQueryString(Map<String, String> data) {
    var items = data.keys.map((k) => "$k=${_encode(data[k])}").toList();
    items.sort();

    return items.join("&");
  }

  String _toOAuthHeader(Map<String, String> data) {
    var items = data.keys.map((k) => "$k=\"${_encode(data[k])}\"").toList();
    items.sort();

    return items.join(", ");
  }

  List<int> _hash(String data) => _sigHasher.convert(data.codeUnits).bytes;

  String _encode(String data) => percent.encode(data.codeUnits);

  String _randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(26) + 97;
    });

    return new String.fromCharCodes(codeUnits);
  }
}
