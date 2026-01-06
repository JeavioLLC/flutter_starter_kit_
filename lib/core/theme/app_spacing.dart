import 'dart:ui';
import 'package:flutter/material.dart';

class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    this.base = 8,
    this.xs = 0.5,  // 4px
    this.s = 1,     // 8px
    this.m = 2,     // 16px
    this.l = 3,     // 24px
    this.xl = 4,    // 32px
  });

  /// Base spacing unit (8px by default)
  final double base;

  /// Multipliers for design system spacing
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;

  // ─────────────────────────────────────────────
  // DESIGN SYSTEM SPACING GETTERS
  // ─────────────────────────────────────────────
  double get extraSmall => base * xs;
  double get small => base * s;
  double get medium => base * m;
  double get large => base * l;
  double get extraLarge => base * xl;

  // Short aliases (xs, s, m, l, xl)
  double get x => extraSmall;
  double get sm => small;
  double get md => medium;
  double get lg => large;
  double get xl2 => extraLarge;

  // ─────────────────────────────────────────────
  // CUSTOM PX SUPPORT
  // ─────────────────────────────────────────────

  /// Direct pixel spacing — any px you want
  double px(double value) => value;

  /// Optional commonly used fixed px helpers
  double get px1 => 1;
  double get px2 => 2;
  double get px4 => 4;
  double get px6 => 6;
  double get px8 => 8;
  double get px12 => 12;
  double get px16 => 16;
  double get px24 => 24;
  double get px32 => 32;

  @override
  AppSpacing copyWith({
    double? base,
    double? xs,
    double? s,
    double? m,
    double? l,
    double? xl,
  }) {
    return AppSpacing(
      base: base ?? this.base,
      xs: xs ?? this.xs,
      s: s ?? this.s,
      m: m ?? this.m,
      l: l ?? this.l,
      xl: xl ?? this.xl,
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) return this;
    return AppSpacing(
      base: lerpDouble(base, other.base, t) ?? base,
      xs: lerpDouble(xs, other.xs, t) ?? xs,
      s: lerpDouble(s, other.s, t) ?? s,
      m: lerpDouble(m, other.m, t) ?? m,
      l: lerpDouble(l, other.l, t) ?? l,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
    );
  }
}