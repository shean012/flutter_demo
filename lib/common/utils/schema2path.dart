import 'package:flutter_demo/router/routes.dart';

void handleSchema(context, String link) {
  String _targetUrl = link.replaceFirst(
    'baomi://',
    '/',
  );
  if (_targetUrl != null) {
    // do something before page push
    Routes.push(context, _targetUrl);
  }
}
