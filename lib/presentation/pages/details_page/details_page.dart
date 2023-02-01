import 'package:app_compostagem/domain/entites/contato.dart';
import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/presentation/controllers/details_page_ctrl.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  final Empresa empresa;
  DetailsPageCtrl controller = DetailsPageCtrl();
  DetailsPage(this.empresa, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: controller.search(empresa),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.fold((failure) {
                      return const Padding(
                        padding: EdgeInsets.all(50.0),
                        child: Center(child: Text('Errro....')),
                      );
                    }, (contatos) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView(
                            children: _buildListItens(empresa, contatos),
                          ),
                        ),
                      );
                    });
                  }
                  return const CircularProgressIndicator();
                })),
          ],
        ));
  }
}

List<Widget> _buildListItens(Empresa empresas, List<Contato> contatos) {
  List<Widget> itens = [];
  for (Contato c in contatos) {
    itens.add(Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 196, 195, 195)),
            height: 150,
            width: 350,
            child: Column(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Descrição',
                        style: TextStyle(fontSize: 25, color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 5),
                      child: Text(c.descricao),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 196, 195, 195),
            ),
            height: 150,
            width: 350,
            child: Column(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Produção',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ),
                    Text(c.producao),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 196, 195, 195)),
            height: 150,
            width: 350,
            child: Column(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Materia Orgânica',
                        style: TextStyle(fontSize: 25, color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(c.materiaOrg),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.network(c.image),
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.green),
            height: 400,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          c.nome,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          c.telefone,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.web,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          c.email,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ])));
  }
  return itens;
}
