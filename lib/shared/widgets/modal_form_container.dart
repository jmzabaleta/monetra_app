import 'package:flutter/material.dart';

/// Widget que maneja correctamente el scroll en formularios modales
/// Previene el "bottom overflowed by X pixels" error
class ModalFormContainer extends StatelessWidget {
  const ModalFormContainer({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.all(20),
  });

  final List<Widget> children;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          padding.left,
          padding.top,
          padding.right,
          MediaQuery.of(context).viewInsets.bottom + padding.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
