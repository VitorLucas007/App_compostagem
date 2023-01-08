import 'package:app_compostagem/data/repositories/contato_repository.dart';
import 'package:app_compostagem/domain/entites/contato.dart';
import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class DetailsPageCtrl {
  ContatoRepository repository = ContatoRepository();

  Future<Either<Failure, List<Contato>>> search(Empresa empresa) {
    return repository.buscaPorContato(empresa);
  }
}