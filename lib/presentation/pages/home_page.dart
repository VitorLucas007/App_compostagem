import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/presentation/controllers/home_page_ctrl.dart';
import 'package:app_compostagem/presentation/pages/details_page/details_page.dart';
import 'package:app_compostagem/presentation/pages/information_page/information_page.dart';
import 'package:flutter/material.dart';


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
          title: const Text('THE Composto'),
          backgroundColor: Colors.green,
          actions:[
            TextButton(
              child: const Icon(
                Icons.filter_alt,
                color: Colors.white,
                ),
              onPressed: () {}),
            TextButton(
              child: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  InformationPage()),);
              })
          ]
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
                  return const Center(child: CircularProgressIndicator());
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
              subtitle: Text(e.bairo),
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DetailsPage(e)),);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(e.image,
              height: 200,
              scale: 1,),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Text(
                        e.descricao,
                        style: const TextStyle(fontSize: 12 ),                       
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
