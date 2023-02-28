import 'package:app_compostagem/domain/entites/contato.dart';
import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/presentation/controllers/details_page_ctrl.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  final Empresa empresa;

  DetailsPage(this.empresa, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsPageCtrl controller = DetailsPageCtrl();

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
                future: controller.search(widget.empresa),
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
                            children: _buildListItens(widget.empresa, contatos),
                          ),
                        ),
                      );
                    });
                  }
                  return const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
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
                color: const Color.fromARGB(255, 196, 195, 195)),
            height: 250,
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        style: const TextStyle(fontSize: 16),
                        c.descricao
                        ),
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
              color: const Color.fromARGB(255, 196, 195, 195),
            ),
            height: 300,
            width: 350,
            child: Column(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Produção',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10,bottom: 10),
                      child: Text(
                        c.producao,
                        style: const TextStyle(fontSize: 18),
                        ),
                    ),
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
                color: const Color.fromARGB(255, 196, 195, 195)),
            height: 150,
            width: 350,
            child: Column(
              children: [
                Column(
                  children: [
                      const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          'Materia Orgânica',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Text(
                        style: const TextStyle(fontSize: 15),
                        c.materiaOrg
                        ),
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
            width: 500,
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
                          c.contato,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
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
                              fontSize: 16, color: Colors.white),
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
                        Icons.language,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          c.email,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.send,
                          color: Colors.white,),
                          Column(
                            children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(c.endereco,
                            style: const TextStyle(
                              fontSize: 9, color: Colors.white),
                            ),
                          )
                            ],
                          ),

                        ],
                      ),
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
