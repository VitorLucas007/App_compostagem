import 'package:app_compostagem/domain/entites/informacao.dart';
import 'package:app_compostagem/domain/failures/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class InformacaoRepository {

  Future<Either<Failure, List<Informacao>>> all() async {
    return FirebaseFirestore.instance.collection('informacoes').get().then((snapshot) {
      List <Informacao> informacoes = [];
      for (QueryDocumentSnapshot doc in snapshot.docs){
        final json = doc.data() as Map<String, dynamic>;
        json['id'] = doc.id;
        Informacao informacao = Informacao(json['card1'], json['descCard1'],
         json['card2'], json['descCard2'],
         json['card3'], json['descCard3'],
         json['card4'], json['descCard4'],
         json['card5'], json['descCard5'],
         json['card6'], json['descCard6'],
         json['card7'], json['descCard7'],
         json['card8'], json['descCard8'],
         json['card9'], json['descCard9'],
         json['card10'], json['descCard10'],
         json['card11'], json['descCard11'],
         json['card12'], json['descCard12'],
         json['card13'], json['descCard13'],
         json['card14'], json['descCard14'],
         json['card15'], json['descCard15'],
         json['card16'], json['descCard16'],);
        informacoes.add(informacao);
      }
      return right <Failure, List<Informacao>>(informacoes);
    },).catchError((error){
      return left<Failure, List<Informacao>>(Failure());
    });
  }
}