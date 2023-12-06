import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HsWarningModal extends StatelessWidget {
  final String message;
  const HsWarningModal({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: const Text(
        'AVISO',
        style: TextStyle(fontSize: 18),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text(message)),
        ],
      ),
      actions: [TextButton(onPressed: () => Modular.to.pop(), child: const Text('Fechar'))],
    );
  }
}
