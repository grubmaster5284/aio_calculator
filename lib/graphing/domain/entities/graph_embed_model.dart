/// Domain entity representing embeddable graph content (HTML snippet).
class GraphEmbed {
  final String html;

  const GraphEmbed({required this.html});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GraphEmbed && other.html == html;

  @override
  int get hashCode => html.hashCode;
}


