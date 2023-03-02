import 'package:app_compostagem/data/repositories/contato_repository.dart';
import 'package:app_compostagem/domain/entites/contato.dart';
import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/presentation/controllers/details_page_ctrl.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                          style: const TextStyle(fontSize: 16), c.descricao),
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
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, top: 10, bottom: 10),
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
                          style: const TextStyle(fontSize: 15), c.materiaOrg),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // COMPONENTE DO CARROSEL <INICIO>
          // Image.network(c.imagens),
          CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(c.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // IMAGEM 2
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(c.image2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // IMAGEM 3
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(c.image3),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(c.image4),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //IMAGEM 4
              ],
              options: CarouselOptions(
                height: 380.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              )),

          // COMPONENTE DO CARROSEL <FIM>
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          c.email,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          c.endereco,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ])));
  }
  return itens;
}
