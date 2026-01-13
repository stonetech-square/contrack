extension StringExtensions on String {
  /// Returns the first character of each word in the string
  ///
  /// Edge cases handled:
  /// - Empty string returns empty string
  /// - Single word returns first character
  /// - Multiple words returns first character of each word
  /// - Extra spaces are ignored
  /// - Empty words are skipped
  /// - Single character words are included
  ///
  /// Example:
  /// ```dart
  /// 'John Doe'.firstInitials; // 'JD'
  /// 'John'.firstInitials; // 'J'
  /// ''.firstInitials; // ''
  /// 'John  Doe'.firstInitials; // 'JD' (handles multiple spaces)
  /// ```
  String get firstInitials {
    if (isEmpty) return '';

    return split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0])
        .join();
  }

  /// Returns the second character of each word in the string
  ///
  /// Edge cases handled:
  /// - Empty string returns empty string
  /// - Single character words are skipped (no second character)
  /// - Multiple words returns second character of each word (if available)
  /// - Extra spaces are ignored
  /// - Empty words are skipped
  ///
  /// Example:
  /// ```dart
  /// 'John Doe'.secondInitials; // 'oo'
  /// 'Jo'.secondInitials; // 'o'
  /// 'J'.secondInitials; // '' (single character)
  /// 'John A Doe'.secondInitials; // 'oo' (skips 'A')
  /// ```
  String get secondInitials {
    if (isEmpty) return '';

    return split(' ')
        .where((word) => word.length > 1)
        .map((word) => word[1])
        .join();
  }

  /// Returns initials (first letter of each word)
  /// Useful for creating user avatars
  ///
  /// Example:
  /// ```dart
  /// 'John Doe'.initials; // 'JD'
  /// 'John'.initials; // 'J'
  /// 'John Michael Doe'.initials; // 'JMD'
  /// ```
  String get initials {
    return firstInitials;
  }

  /// Returns a limited number of initials (typically for avatars)
  /// Takes the first character of first N words
  ///
  /// Example:
  /// ```dart
  /// 'John Michael Doe'.limitedInitials(2); // 'JM'
  /// 'John Doe'.limitedInitials(2); // 'JD'
  /// 'John'.limitedInitials(2); // 'J'
  /// ```
  String limitedInitials([int maxWords = 2]) {
    if (isEmpty) return '';

    return split(' ')
        .where((word) => word.isNotEmpty)
        .take(maxWords)
        .map((word) => word[0])
        .join();
  }
}
