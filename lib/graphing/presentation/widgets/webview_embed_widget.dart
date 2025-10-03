import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Renders provided HTML content inside a real WebView (cross-platform).
class WebViewEmbedWidget extends StatefulWidget {
  final String htmlContent;

  const WebViewEmbedWidget({super.key, required this.htmlContent});

  @override
  State<WebViewEmbedWidget> createState() => _WebViewEmbedWidgetState();
}

class _WebViewEmbedWidgetState extends State<WebViewEmbedWidget> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => _isLoading = true);
            debugPrint('[webview] onPageStarted: $url');
          },
          onPageFinished: (url) {
            if (mounted) {
              setState(() => _isLoading = false);
            }
            debugPrint('[webview] onPageFinished: $url');
            // Ensure scrollbars are hidden and content is responsive
            _controller.runJavaScript(
              "document.documentElement.style.overflow='hidden';"
              "document.body.style.overflow='hidden';"
              "document.body.style.width='100%';"
              "document.body.style.height='100%';"
              "document.documentElement.style.width='100%';"
              "document.documentElement.style.height='100%';"
              "(function(){var s=document.createElement('style');"
              "s.innerHTML='::-webkit-scrollbar{display:none;width:0;height:0}';"
              "document.head.appendChild(s);})();",
            );
          },
          onWebResourceError: (err) {
            if (mounted) {
              setState(() => _isLoading = false);
            }
            debugPrint('[webview] onWebResourceError: ${err.errorCode} ${err.description}');
          },
          onUrlChange: (change) => debugPrint('[webview] onUrlChange: ${change.url}'),
        ),
      )
      ..loadHtmlString(widget.htmlContent);
    debugPrint('[webview] initState: loaded HTML length ${widget.htmlContent.length}');
  }

  @override
  void didUpdateWidget(WebViewEmbedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.htmlContent != widget.htmlContent) {
      _controller.loadHtmlString(widget.htmlContent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        WebViewWidget(controller: _controller),
        if (_isLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.12),
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                  SizedBox(height: 12),
                  Text('Loading...', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),
      ],
    );
  }
}


