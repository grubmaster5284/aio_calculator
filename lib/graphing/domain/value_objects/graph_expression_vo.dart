/// Strongly-typed LaTeX expression for graphing.
class GraphExpression {
  final String latex;

  GraphExpression(this.latex) {
    // Basic defensive validation without being opinionated about LaTeX.
    // Allow empty string (means no initial expression), but disallow only whitespace.
    if (latex.trim().isEmpty && latex.isNotEmpty) {
      throw ArgumentError('Graph expression cannot be only whitespace');
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GraphExpression && other.latex == latex;

  @override
  int get hashCode => latex.hashCode;

  @override
  String toString() => 'GraphExpression($latex)';
}


