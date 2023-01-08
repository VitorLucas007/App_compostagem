import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/presentation/controllers/home_page_ctrl.dart';
import 'package:app_compostagem/presentation/pages/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageCtrl controller = HomePageCtrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nome APP'),
          backgroundColor: Colors.green,
          actions: [Icon(Icons.filter_alt)],
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: controller.search(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.fold((failure) {
                      return const Center(child: Text('Errro....'));
                    }, (empresas) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                            ),
                            children: _buildListItens(empresas, context),
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

List<Widget> _buildListItens(List<Empresa>empresas, context) {
  List<Widget> itens = [];

  for (Empresa e in empresas) {
    itens.add(Card(
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            ListTile(
              leading: Image.network(e.imageLogo),
              title: Text(e.nomeEmpresa),
              subtitle: Text(e.cidadeEmpresa),
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailsPage(e)),);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(e.image,
              scale: 2,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        e.descricao,
                        style: const TextStyle(fontSize: 10.5),
                      ),
                    ],
                  ),
                ],
              ),
        )],
        ),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
     
    );
  }
  return itens;
}
