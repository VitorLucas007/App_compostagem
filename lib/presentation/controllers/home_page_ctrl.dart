import 'package:app_compostagem/data/repositories/empresa_repository.dart';
import 'package:app_compostagem/domain/entites/empresa.dart';
import 'package:app_compostagem/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class HomePageCtrl {
  EmpresaRepository repository = EmpresaRepository();

    Future<Either<Failure, List<Empresa>>>search(){
      return repository.all();
    }
}