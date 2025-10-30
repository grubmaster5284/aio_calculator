/// Service for handling graphing-related errors and error processing.
/// Manages technical aspects of error handling and user feedback.
class GraphingErrorService {
  const GraphingErrorService();

  /// Processes and categorizes errors from external services.
  String processExternalError(dynamic error) {
    if (error == null) return 'Unknown error occurred';
    
    final errorString = error.toString().toLowerCase();
    
    // Categorize common external service errors
    if (errorString.contains('network') || errorString.contains('connection')) {
      return 'Network error: Unable to connect to graphing service';
    }
    
    if (errorString.contains('api') || errorString.contains('key')) {
      return 'API error: Invalid or missing API key';
    }
    
    if (errorString.contains('syntax') || errorString.contains('parse')) {
      return 'Syntax error: Invalid mathematical expression';
    }
    
    if (errorString.contains('timeout')) {
      return 'Timeout: Graphing service took too long to respond';
    }
    
    // Default fallback
    return 'Graphing error: ${error.toString()}';
  }

  /// Validates error messages for security (prevent XSS).
  String sanitizeErrorMessage(String errorMessage) {
    return errorMessage
        .replaceAll(RegExp(r'<[^>]*>'), '') // Remove HTML tags
        .replaceAll(RegExp(r'''[<>"']'''), '') // Remove dangerous characters
        .trim();
  }

  /// Determines if an error is recoverable (user can retry).
  bool isRecoverableError(dynamic error) {
    if (error == null) return true;
    
    final errorString = error.toString().toLowerCase();
    
    // Network and timeout errors are usually recoverable
    if (errorString.contains('network') || 
        errorString.contains('timeout') ||
        errorString.contains('connection')) {
      return true;
    }
    
    // API key errors are not recoverable without user action
    if (errorString.contains('api') || errorString.contains('key')) {
      return false;
    }
    
    // Syntax errors are not recoverable without user input change
    if (errorString.contains('syntax') || errorString.contains('parse')) {
      return false;
    }
    
    return true;
  }

  /// Generates user-friendly error messages.
  String getUserFriendlyMessage(String technicalError) {
    final sanitized = sanitizeErrorMessage(technicalError);
    
    if (sanitized.contains('Network error')) {
      return 'Please check your internet connection and try again.';
    }
    
    if (sanitized.contains('API error')) {
      return 'There was an issue with the graphing service. Please try again later.';
    }
    
    if (sanitized.contains('Syntax error')) {
      return 'Please check your mathematical expression and try again.';
    }
    
    if (sanitized.contains('Timeout')) {
      return 'The graphing service is taking longer than expected. Please try again.';
    }
    
    return 'Something went wrong. Please try again.';
  }
}