import 'package:flutter_demo/router/routes.dart';

void handleSchema(context, String link) {
  String _targetUrl = link.replaceFirst(
    'baomi://',
    '/',
  );
  if (_targetUrl != null) Routes.push(context, link);
}
