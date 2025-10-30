/// Service for handling graphing configuration and settings.
/// Manages technical aspects of graph configuration and API integration.
class GraphingConfigService {
  const GraphingConfigService();

  /// Validates API key format for Desmos integration.
  bool isValidApiKey(String apiKey) {
    if (apiKey.isEmpty) return false;
    // Basic validation - API keys should be non-empty strings
    return apiKey.trim().isNotEmpty;
  }

  /// Generates default configuration for graphing.
  Map<String, dynamic> getDefaultConfig() {
    return {
      'showExpressions': true,
      'showGrid': true,
      'showAxes': true,
      'allowPan': true,
      'allowZoom': true,
      'lockViewport': false,
    };
  }

  /// Validates LaTeX expression for basic syntax issues.
  bool isValidLatexSyntax(String latex) {
    if (latex.trim().isEmpty) return false;
    
    // Check for balanced braces
    int braceCount = 0;
    for (final char in latex.split('')) {
      if (char == '{') braceCount++;
      if (char == '}') braceCount--;
      if (braceCount < 0) return false;
    }
    
    return braceCount == 0;
  }

  /// Sanitizes configuration values to prevent injection attacks.
  Map<String, dynamic> sanitizeConfig(Map<String, dynamic> config) {
    final sanitized = <String, dynamic>{};
    
    for (final entry in config.entries) {
      final key = entry.key.toString().replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '');
      final value = entry.value;
      
      if (value is String) {
        sanitized[key] = value.replaceAll(RegExp(r'''[<>"']'''), '');
      } else if (value is bool || value is num) {
        sanitized[key] = value;
      }
    }
    
    return sanitized;
  }

  /// Generates unique expression ID for Desmos API.
  String generateExpressionId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 1000).toString().padLeft(3, '0');
    return 'graph_$timestamp$random';
  }
}