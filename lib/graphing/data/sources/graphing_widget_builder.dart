/// Data-layer builder that returns embeddable HTML for the graphing widget.
/// In real apps, this would support multiple providers (Desmos, Symbolab, etc.).
class GraphingWidgetBuilder {
  const GraphingWidgetBuilder();

  /// Returns minimal HTML for embedding a Desmos Graphing Calculator.
  /// Accepts the API key to avoid hardcoding sensitive values in UI.
  String buildDesmosHtml({required String apiKey, bool showExpressions = true, String initialLatex = ''}) {
    final expressionsFlag = showExpressions ? 'true' : 'false';
    final safeLatex = initialLatex.replaceAll("'", "\\'");

    return '''<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Graphing</title>
    <style>
      html, body { margin: 0; padding: 0; width: 100%; height: 100%; background: #121212; overflow: hidden; }
      #calculator {
        position: fixed;
        top: 0; left: 0; right: 0; bottom: 0;
        width: 100%;
        height: 100%;
      }
      /* Defensive: hide any scrollbars the content might trigger */
      ::-webkit-scrollbar { width: 0 !important; height: 0 !important; display: none !important; }
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
}


