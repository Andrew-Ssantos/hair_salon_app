import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hair_salon_app/core/ui/constants.dart';

class HsClientModal {
  Future<void> showClientModel(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          scrollable: true,
          actionsPadding: const EdgeInsets.all(10),
          content: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    Text('(15) 98826-8010'),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Enviar mensagem',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        width: 22,
                        child: SvgPicture.asset(
                          height: 20,
                          alignment: Alignment.centerLeft,
                          'lib/core/assets/icons/whatsapp.svg',
                        ),
                      )
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Excluir Agendamento',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Icon(Icons.delete, color: Colors.black, size: 24),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'FECHAR',
                      style: TextStyle(color: ColorsConstants.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
