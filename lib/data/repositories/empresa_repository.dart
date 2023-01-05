import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/domain/failures/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class EmpresaRepository{
  //PEGANDO DO BANCO
  Future<Either<Failure, List<Empresa>>> all() async {
    return FirebaseFirestore.instance.collection('empresas').get().then((snapshot){
      List<Empresa> empresas = [];
      for (QueryDocumentSnapshot doc in snapshot.docs){
        final json = doc.data() as Map<String, dynamic>;
        json['id'] = doc.id;
        Empresa empresa = Empresa(json['id'], json['imageLogo'], json['nomeEmpresa'], json['cidadeEmpresa'], json['image'], json['descricao']);
        empresas.add(empresa);
      }
      return right<Failure, List<Empresa>>(empresas);
    }).catchError((error){
      return left<Failure, List<Empresa>>(Failure());
    });
  }
}