import 'package:flutter_demo/router/routes.dart';

void handleSchema(context, String link) {
  String targetUrl = link.replaceFirst(
    'baomi://',
    '/',
  );
  Uri _paramsUri = Uri.parse(targetUrl);
  Map<String, String> schemaParams = _paramsUri.queryParameters;
  if (targetUrl != null) {
    // do something before page push
    Routes.push(context, targetUrl, params: schemaParams);
  }
}
