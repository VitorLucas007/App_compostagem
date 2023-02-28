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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Oque pode ser compostado ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 196, 195, 195)),
            height: 250,
            width: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 9, right: 9),
                  child: Text(
                    i.card1,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    i.descCard1,
                    style: const TextStyle(fontSize: 17),
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 25,
        ),
        // CARD 2
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  i.card2,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard2,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
        // CARD 3
        const SizedBox(
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  i.card3,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard3,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        // CARD 04
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card4,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard4,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        // CARD 05
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card5,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard5,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        // CARD 6
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 150,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card6,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard6,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        // texto descritivo
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Resíduos de alimentos não recomendados nas composteiras',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // CARD 7
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card7,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard7,
                  style: const TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        // CARD 8
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  i.card8,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard8,
                  style: const TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        // CARD 9
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card9,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard9,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        // CARD 10
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card10,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard10,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        // CARD 11
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card11,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard11,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        // CARD 12
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card12,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard12,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        // CARD 13
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card13,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard13,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        // CARD 14
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card14,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard14,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        // CARD 15
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  i.card15,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard15,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        // CARD 16
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 196, 195, 195)),
          height: 200,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.card16,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  i.descCard16,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
  return itens;
}
