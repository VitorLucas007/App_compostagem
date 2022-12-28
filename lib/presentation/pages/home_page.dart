import 'package:app_compostagem/presentation/pages/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nome do App'),
        backgroundColor: Colors.green,
        actions: [Icon(Icons.filter_alt)],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                  child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ListTile(
                      leading: Image(
                          image: NetworkImage(
                              'https://img.freepik.com/vetores-gratis/modelo-de-logotipo-de-negocios-de-sustentabilidade-vetor-de-design-de-marca-texto-de-empresa-florestal-mori_53876-140593.jpg?w=2000')),
                      title: Text('ALGO......'),
                      subtitle: Text('ALGO.....'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(
                          'https://st.depositphotos.com/1784849/2763/i/450/depositphotos_27639295-stock-photo-soybean-field-at-sundown.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [Text('Descrição.....')],
                      ),
                    )
                  ],
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
