import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final bool isLoading;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final buttonChild = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          )
        : icon != null
        ? Icon(icon)
        : null;

    if (buttonChild != null) {
      return FilledButton.icon(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        icon: buttonChild,
        label: Text(label),
      );
    }

    return FilledButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      child: Text(label),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.isEnabled = true,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: isEnabled ? onPressed : null,
        icon: Icon(icon),
        label: Text(label),
      );
    }

    return OutlinedButton(
      onPressed: isEnabled ? onPressed : null,
      child: Text(label),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }

    return TextButton(onPressed: onPressed, child: Text(label));
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
    this.isEnabled = true,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String? tooltip;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: isEnabled ? onPressed : null,
      icon: Icon(icon),
    );
  }
}
