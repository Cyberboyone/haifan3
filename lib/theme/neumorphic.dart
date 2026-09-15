import 'package:flutter/material.dart';

/// Dark blue Islamic design tokens.
///
/// Deep navy backgrounds with cyan/teal accents, mosque-inspired geometry,
/// and subtle gradients evoking a night sky over a masjid.
class AppColors {
  static const background = Color(0xFF0D1B2A);
  static const backgroundLight = Color(0xFF1B2838);
  static const accent = Color(0xFF4FC3F7);
  static const accentDark = Color(0xFF0288D1);
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB0BEC5);
  static const cardBackground = Color(0xFF1B3A5C);
  static const cardBorder = Color(0xFF2A4A6B);

  static const shadowLight = Color(0xFF1B3A5C);
  static const shadowDark = Color(0xFF050A10);
}

enum NeuStyle { raised, pressed, flat }

/// A container with dark blue card styling.
class Neumorphic extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final NeuStyle style;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? width;
  final double? height;
  final double intensity;

  const Neumorphic({
    super.key,
    this.child,
    this.borderRadius = 24,
    this.style = NeuStyle.raised,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.width,
    this.height,
    this.intensity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    if (style == NeuStyle.pressed) {
      return Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.backgroundLight,
              AppColors.background,
              AppColors.cardBorder.withValues(alpha: 0.3),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: child,
      );
    }

    if (style == NeuStyle.flat) {
      return Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: radius,
        ),
        child: child,
      );
    }

    // Raised (default) - dark card with subtle glow
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: radius,
        border: Border.all(
          color: AppColors.cardBorder.withValues(alpha: 0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark.withValues(alpha: 0.6),
            offset: Offset(4 * intensity, 4 * intensity),
            blurRadius: 12 * intensity,
          ),
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.08),
            offset: Offset(-2 * intensity, -2 * intensity),
            blurRadius: 8 * intensity,
          ),
        ],
      ),
      child: child,
    );
  }
}

/// A circular button with dark blue styling.
class NeumorphicCircleButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final VoidCallback? onTap;
  final NeuStyle style;
  final Color? iconColor;

  const NeumorphicCircleButton({
    super.key,
    required this.icon,
    this.size = 56,
    this.iconSize = 24,
    this.onTap,
    this.style = NeuStyle.raised,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Neumorphic(
        width: size,
        height: size,
        borderRadius: size / 2,
        style: style,
        child: Icon(icon, size: iconSize, color: iconColor ?? AppColors.accent),
      ),
    );
  }
}
