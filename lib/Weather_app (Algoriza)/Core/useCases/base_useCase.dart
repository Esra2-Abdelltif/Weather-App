import 'package:dartz/dartz.dart' ;
import 'package:equatable/equatable.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';

abstract class BaseUseCases<T,Parameters>{
  // ignore: non_constant_identifier_names
  Future<Either<Failure,T>>  call(Parameters Parameters);
}


//useses when fun not need paramters
 class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}