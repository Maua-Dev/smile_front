import 'package:flutter/material.dart';

class ConfirmDeleteModal extends StatelessWidget {
  final Future<dynamic> Function(String, String) unsubscribeActivityFunction;
  final String activityId;
  final String userId;

  const ConfirmDeleteModal({
    Key? key,
    required this.unsubscribeActivityFunction,
    required this.activityId,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Atenção!',
            style: TextStyle(fontSize: 30),
          ),
          content: const Text(
            'Deseja mesmo desfazer a inscrição dessa atividade?',
            style: TextStyle(fontSize: 26),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
            TextButton(
              onPressed: () => {
                //chamada da função de desfazer inscrição
                unsubscribeActivityFunction(activityId, userId),
                Navigator.pop(context, 'Sim')
              },
              child: const Text(
                'Sim',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ],
        ),
      ),
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          height: 70,
          child: Container(
            child: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
          )),
    );
  }
}
