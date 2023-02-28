import 'package:app_compostagem/domain/entites/informacao.dart';
import 'package:app_compostagem/domain/failures/failure.dart';
import 'package:app_compostagem/presentation/controllers/information_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  InformationCtrl controller = InformationCtrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: controller.search(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.fold((failure) {
                  return const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Center(child: Text('Errro....')),
                  );
                }, (informacoes) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView(
                        children: _buildListItens(informacoes, context),
                      ),
                    ),
                  );
                });
              }
              return const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(child: CircularProgressIndicator()),
              );
            },
          )
        ],
      ),
    );
  }
}

List<Widget> _buildListItens(List<Informacao> informacoes, context) {
  List<Widget> itens = [];

  for (Informacao i in informacoes) {
    itens.add(Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 196, 195, 195)),
            height: 250,
            width: 350,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Oque Pode ser Compostado ?',
                    style: TextStyle(
                        fontSize: 18, 
                        color: Color.fromARGB(255, 10, 10, 10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(i.card1),
                )
              ],
            ))
      ],
    ));
  }
  return itens;
}
