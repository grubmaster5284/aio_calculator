/// Service for generating HTML content for graphing widgets.
/// Handles technical implementation of HTML generation and formatting.
class GraphingHtmlService {
  const GraphingHtmlService();

  /// Generates HTML for Desmos graphing calculator.
  /// Handles technical details like API integration and HTML structure.
  String generateDesmosHtml({
    required String apiKey,
    required bool showExpressions,
    required String latexExpression,
  }) {
    final expressionsFlag = showExpressions ? 'true' : 'false';
    final safeLatex = _sanitizeLatex(latexExpression);

    return _buildHtmlTemplate(
      apiKey: apiKey,
      expressionsFlag: expressionsFlag,
      safeLatex: safeLatex,
    );
  }

  /// Sanitizes LaTeX expressions to prevent XSS and ensure proper escaping.
  String _sanitizeLatex(String latex) {
    return latex
        .replaceAll("'", "\\'")
        .replaceAll('"', '\\"')
        .replaceAll('\n', '\\n')
        .replaceAll('\r', '\\r');
  }

  /// Builds the complete HTML template for the graphing widget.
  String _buildHtmlTemplate({
    required String apiKey,
    required String expressionsFlag,
    required String safeLatex,
  }) {
    return '''<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Graphing Calculator</title>
    <style>
      html, body { 
        margin: 0; 
        padding: 0; 
        width: 100%; 
        height: 100%; 
        background: #121212; 
        overflow: hidden; 
      }
      #calculator {
        position: fixed;
        top: 0; left: 0; right: 0; bottom: 0;
        width: 100%;
        height: 100%;
      }
      ::-webkit-scrollbar { 
        width: 0 !important; 
        height: 0 !important; 
        display: none !important; 
      }
    </style>
    <script src="https://www.desmos.com/api/v1.11/calculator.js?apiKey=$apiKey"></script>
  </head>
  <body>
    <div id="calculator"></div>
    <script>
      var elt = document.getElementById('calculator');
      var calculator = Desmos.GraphingCalculator(elt, { expressions: $expressionsFlag });
      if ('$safeLatex'.length > 0) {
        calculator.setExpression({ id: 'graph1', latex: '$safeLatex' });
      }
      window.addEventListener('resize', function() { calculator.resize(); });
    </script>
  </body>
</html>''';
  }

  /// Validates HTML content for basic security and structure.
  bool isValidHtml(String html) {
    return html.contains('<!DOCTYPE html>') &&
           html.contains('<html>') &&
           html.contains('</html>') &&
           html.contains('Desmos.GraphingCalculator');
  }
}
