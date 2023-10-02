import 'package:flutter/material.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

class HsClientModal {
  Future<void> showClientModel(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          actions: [
            SizedBox(
              height: 10,
              width: 10,
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
          ],
          scrollable: true,
          actionsPadding: const EdgeInsets.all(10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     IconButton(
              //       onPressed: () => Navigator.of(context).pop(),
              //       icon: const Icon(Icons.close),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Text(
                    'Cliente: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text('Rebeca Gomes de Araújo'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Whatsapp: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text('15 988268010'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Serviço: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text('Progressiva'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Valor: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text('R\$35,00'),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enviar mensagem',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Icon(Icons.message, color: Colors.black, size: 24),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(width: 2, color: ColorsConstants.purple),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Finalizar serviço',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Icon(Icons.check, color: Colors.black, size: 24),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsConstants.red,
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Excluir Agendamento',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Icon(Icons.delete, color: Colors.black, size: 24),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
