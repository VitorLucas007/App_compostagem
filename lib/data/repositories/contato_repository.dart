import 'package:app_compostagem/domain/entites/contato.dart';
import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/domain/failures/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ContatoRepository {
  //PEGANDO DO BANCO
  /* Future<Either<Failure, List<Contato>>> all() async {
    return FirebaseFirestore.instance.collection('contatos').get().then((snapshot){
      List<Contato> contatos = [];
      for (QueryDocumentSnapshot doc in snapshot.docs){
        final json = doc.data() as Map<String, dynamic>;
        json['id'] = doc.id;
        Contato contato = Contato(json['id'], json['descricao'], json['producao'], json['materiaOrg'], json['image'], json['nome'], json['telefone'], json['email']);
        contatos.add(contato);
      }
      return right<Failure, List<Contato>>(contatos);
    }).catchError((error){
      return left<Failure, List<Contato>>(Failure());
    });
  }*/

//metodo para pegar a coleção contato dentro da coleção empresa
  Future<Either<Failure, List<Contato>>> buscaPorContato(
      Empresa empresa) async {
    return FirebaseFirestore.instance
        .collection('empresas')
        .doc(empresa.id)
        .collection('contatos')
        .get()
        .then((snapshot) {
      List<Contato> contatos = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        final json = doc.data() as Map<String, dynamic>;
        json['id'] = doc.id;
        Contato contato = Contato(
            json['id'],
            json['descricao'],
            json['producao'],
            json['materiaOrg'],
            json['image'],
            json['image2'],
            json['image3'],
            json['image4'],
            json['contato'],
            json['contato2'],
            json['contato3'],
            json['telefone'],
            json['telefone2'],
            json['telefone3'],
            json['email'],
            json['local']);
        contatos.add(contato);
      }
      return right<Failure, List<Contato>>(contatos);
    }).catchError((error) {
      return left<Failure, List<Contato>>(Failure());
    });
  }
}