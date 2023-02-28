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
        Informacao informacao = Informacao(json['card1'], json['card2'], json['card3'], json['card4'], json['card5'], json['card6'], json['card7'], json['card8'], json['card9'], json['card10'], json['card11'], json['card12'], json['card13'], json['card14'], json['card15'], json['card16'], json['card17']);
        informacoes.add(informacao);
      }
      return right <Failure, List<Informacao>>(informacoes);
    },).catchError((error){
      return left<Failure, List<Informacao>>(Failure());
    });
  }
}