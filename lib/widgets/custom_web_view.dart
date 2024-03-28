import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../core/theme/app_theme.dart';
import 'custom_app_bar.dart';

class DocumentWebView extends StatelessWidget {
  const DocumentWebView({
    required this.url,
    required this.title,
    this.html,
    super.key,
  });

  final String title;
  final String url;
  final String? html;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        titleChild: Text(
          title,
          style: context.text.s20w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(url),
          ),
        ),
      ),
    );
  }
}
