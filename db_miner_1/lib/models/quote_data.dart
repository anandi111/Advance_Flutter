import 'package:flutter/foundation.dart';

class QuoteData {
  final String quote;
  final String author;
  final String category;

  QuoteData({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuoteData.fromMap({required Map e}) {
    return QuoteData(
      quote: e["quote"] ?? 'The will of man is his happiness.',
      author: e["author"] ?? "Friedrich Schiller",
      category: e["category"] ?? "happiness",
    );
  }
}
