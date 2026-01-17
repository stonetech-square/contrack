import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.card,
    required this.onCard,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.cardColor,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.neutral,
    required this.neutralInverted,
    required this.white,
    required this.black,
    required this.border,

    required this.divider,
    required this.cardHighlight,
    required this.onCardPrimary,
    required this.onCardSecondary,
    required this.textSubtle,
    required this.textBody,
    required this.bgBlue,
    required this.bgGray,
    required this.bgOrange,
    required this.bgGreen,
    required this.bgRed,
    required this.greenPrimary,
    required this.orangePrimary,
    required this.textHeading,
    required this.statusOngoing,
    required this.statusCompleted,
    required this.statusPlanned,
    required this.statusStalled,
    required this.statusCancelled,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color card;
  final Color onCard;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  final Color cardColor;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color neutral;
  final Color neutralInverted;
  final Color white;
  final Color black;
  final Color border;

  final Color divider;
  final Color cardHighlight;
  final Color onCardPrimary;
  final Color onCardSecondary;
  final Color textSubtle;
  final Color textBody;
  final Color bgBlue;
  final Color bgGray;
  final Color bgOrange;
  final Color bgGreen;
  final Color bgRed;
  final Color greenPrimary;
  final Color orangePrimary;
  final Color textHeading;
  final Color statusOngoing;
  final Color statusCompleted;
  final Color statusPlanned;
  final Color statusStalled;
  final Color statusCancelled;

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? card,
    Color? onCard,
    Color? surface,
    Color? onSurface,
    Color? error,
    Color? onError,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? cardColor,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? neutral,
    Color? neutralInverted,
    Color? white,
    Color? black,
    Color? border,

    Color? divider,
    Color? cardHighlight,
    Color? onCardPrimary,
    Color? onCardSecondary,
    Color? textSubtle,
    Color? textBody,
    Color? bgBlue,
    Color? bgGray,
    Color? bgOrange,
    Color? bgGreen,
    Color? bgRed,
    Color? greenPrimary,
    Color? orangePrimary,
    Color? textHeading,
    Color? statusOngoing,
    Color? statusCompleted,
    Color? statusPlanned,
    Color? statusStalled,
    Color? statusCancelled,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      card: card ?? this.card,
      onCard: onCard ?? this.onCard,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      cardColor: cardColor ?? this.cardColor,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      neutral: neutral ?? this.neutral,
      neutralInverted: neutralInverted ?? this.neutralInverted,
      white: white ?? this.white,
      black: black ?? this.black,
      border: border ?? this.border,

      divider: divider ?? this.divider,
      cardHighlight: cardHighlight ?? this.cardHighlight,
      onCardPrimary: onCardPrimary ?? this.onCardPrimary,
      onCardSecondary: onCardSecondary ?? this.onCardSecondary,
      textSubtle: textSubtle ?? this.textSubtle,
      textBody: textBody ?? this.textBody,
      bgBlue: bgBlue ?? this.bgBlue,
      bgGray: bgGray ?? this.bgGray,
      bgOrange: bgOrange ?? this.bgOrange,
      bgGreen: bgGreen ?? this.bgGreen,
      bgRed: bgRed ?? this.bgRed,
      greenPrimary: greenPrimary ?? this.greenPrimary,
      orangePrimary: orangePrimary ?? this.orangePrimary,
      textHeading: textHeading ?? this.textHeading,
      statusOngoing: statusOngoing ?? this.statusOngoing,
      statusCompleted: statusCompleted ?? this.statusCompleted,
      statusPlanned: statusPlanned ?? this.statusPlanned,
      statusStalled: statusStalled ?? this.statusStalled,
      statusCancelled: statusCancelled ?? this.statusCancelled,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      card: Color.lerp(card, other.card, t)!,
      onCard: Color.lerp(onCard, other.onCard, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
      neutralInverted: Color.lerp(neutralInverted, other.neutralInverted, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      border: Color.lerp(border, other.border, t)!,

      divider: Color.lerp(divider, other.divider, t)!,
      cardHighlight: Color.lerp(cardHighlight, other.cardHighlight, t)!,
      onCardPrimary: Color.lerp(onCardPrimary, other.onCardPrimary, t)!,
      onCardSecondary: Color.lerp(onCardSecondary, other.onCardSecondary, t)!,
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
      bgBlue: Color.lerp(bgBlue, other.bgBlue, t)!,
      bgGray: Color.lerp(bgGray, other.bgGray, t)!,
      bgOrange: Color.lerp(bgOrange, other.bgOrange, t)!,
      bgGreen: Color.lerp(bgGreen, other.bgGreen, t)!,
      bgRed: Color.lerp(bgRed, other.bgRed, t)!,
      greenPrimary: Color.lerp(greenPrimary, other.greenPrimary, t)!,
      orangePrimary: Color.lerp(orangePrimary, other.orangePrimary, t)!,
      textHeading: Color.lerp(textHeading, other.textHeading, t)!,
      statusOngoing: Color.lerp(statusOngoing, other.statusOngoing, t)!,
      statusCompleted: Color.lerp(statusCompleted, other.statusCompleted, t)!,
      statusPlanned: Color.lerp(statusPlanned, other.statusPlanned, t)!,
      statusStalled: Color.lerp(statusStalled, other.statusStalled, t)!,
      statusCancelled: Color.lerp(statusCancelled, other.statusCancelled, t)!,
    );
  }

  static const light = AppColorsExtension(
    // Primary - Dark Gray/Black
    primary: Color(0xFF1A1A1A),
    onPrimary: Color(0xFFFFFFFF),

    // Secondary - Medium Gray
    secondary: Color(0xFF5F5F5F),
    onSecondary: Color(0xFFFFFFFF),

    // Card - Pure White
    card: Color(0xFFFFFFFF),
    onCard: Color(0xFF1A1A1A),

    // Surface - Off White
    surface: Color(0xFFF9FAFB),
    onSurface: Color(0xFF1A1A1A),

    // Surface Variant - Light Gray
    surfaceVariant: Color(0xFFF5F5F5),
    onSurfaceVariant: Color(0xFF424242),

    // Semantic Colors
    error: Color(0xFFE7000B),
    onError: Color(0xFFFFFFFF),

    success: Color(0xFF008236),
    onSuccess: Color(0xFFFFFFFF),

    warning: Color(0xFFEA580C),
    onWarning: Color(0xFFFFFFFF),

    info: Color(0xFF2563EB),
    onInfo: Color(0xFFFFFFFF),

    // Card Color - Light Gray
    cardColor: Color(0xFFEFEFEF),

    // Neutral colors
    neutral: Color(0xFF1A1A1A),
    neutralInverted: Color(0xFFE0E0E0),

    // Pure Black & White
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),

    // Borders & Dividers
    // Borders & Dividers
    border: Color(0xFFE0E0E0),
    divider: Color(0xFFEEEEEE),

    // Navigation Items
    // Generic Card Colors
    cardHighlight: Color(0xFFF0F7FF),
    onCardPrimary: Color(0xFF1A1A1A),
    onCardSecondary: Color(0xFF757575),
    textSubtle: Color(0xFF6A7282),

    // New additions
    textBody: Color(0xFF4A5565),
    bgBlue: Color(0xFFDBEAFE),
    bgGray: Color(0xFFF3F4F6),
    bgOrange: Color(0xFFFFEDD4),
    bgGreen: Color(0xFFDCFCE7),
    bgRed: Color(0xFFFEE2E2),
    greenPrimary: Color(0xFF00A63E),
    orangePrimary: Color(0xFFF54900),
    textHeading: Color(0xFF101828),

    // Status chart colors
    statusOngoing: Color(0xFF1A1A1A),
    statusCompleted: Color(0xFF22C55E),
    statusPlanned: Color(0xFFF97316),
    statusStalled: Color(0xFFEF4444),
    statusCancelled: Color(0xFF6B7280),
  );

  // Dark Theme Colors - Grayscale with Color Semantic
  static const dark = AppColorsExtension(
    // Primary - Light Gray/White
    primary: Color(0xFFE8E8E8),
    onPrimary: Color(0xFF1A1A1A),

    // Secondary - Medium-Light Gray
    secondary: Color(0xFFB0B0B0),
    onSecondary: Color(0xFF1A1A1A),

    // Card - Dark Gray (complementary to light #FFFFFF)
    card: Color(0xFF252525),
    onCard: Color(0xFFE8E8E8),

    // Surface - Very Dark Gray (complementary to light #F9FAFB)
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE8E8E8),

    // Surface Variant - Medium Dark Gray
    surfaceVariant: Color(0xFF2A2A2A),
    onSurfaceVariant: Color(0xFFD0D0D0),

    // Semantic Colors
    error: Color(0xFFFF4D4D),
    onError: Color(0xFF1A1A1A),

    success: Color(0xFF4CAF50),
    onSuccess: Color(0xFF1A1A1A),

    warning: Color(0xFFFDB47F),
    onWarning: Color(0xFF1A1A1A),

    info: Color(0xFF93C5FD),
    onInfo: Color(0xFF1A1A1A),

    // Card Color
    cardColor: Color(0xFF252525),

    // Neutral colors
    neutral: Color(0xFFE8E8E8),
    neutralInverted: Color(0xFF2A2A2A),

    // Pure Black & White
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),

    // Borders & Dividers
    // Borders & Dividers
    border: Color(0xFF3A3A3A),
    divider: Color(0xFF2F2F2F),

    // Navigation Items
    // Generic Card Colors
    cardHighlight: Color(0xFF2C2C2C),
    onCardPrimary: Color(0xFFFFFFFF),
    onCardSecondary: Color(0xFFA0A0A0),
    textSubtle: Color(0xFF9EAAB8),

    // New additions
    textBody: Color(0xFFE2E8F0),
    bgBlue: Color(0xFF1E3A8A),
    bgGray: Color(0xFF1F2937),
    bgOrange: Color(0xFF7C2D12),
    bgGreen: Color(0xFF14532D),
    bgRed: Color(0xFF7F1D1D),
    greenPrimary: Color(0xFF4ADE80),
    orangePrimary: Color(0xFFFB923C),
    textHeading: Color(0xFFFFFFFF),

    // Status chart colors (dark variants)
    statusOngoing: Color(0xFFE8E8E8),
    statusCompleted: Color(0xFF4ADE80),
    statusPlanned: Color(0xFFFB923C),
    statusStalled: Color(0xFFF87171),
    statusCancelled: Color(0xFF9CA3AF),
  );
}

extension AppColorsContext on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>() ??
      AppColorsExtension.light;
  ThemeData get theme => Theme.of(this);
  ThemeMode get themeMode => Theme.of(this).brightness == Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;
}
