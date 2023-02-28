import 'package:app_compostagem/data/repositories/informacoes_repository.dart';
import 'package:app_compostagem/domain/entites/informacao.dart';
import 'package:app_compostagem/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class InformationCtrl {
  InformacaoRepository repository = InformacaoRepository();

  Future<Either<Failure, List<Informacao>>>search(){
    return repository.all();
  }
}