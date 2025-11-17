import 'package:bnv_opendata/data/model/mine_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class Mine3DState {}

class Mine3DInitial extends Mine3DState {}

class Mine3DLoading extends Mine3DState {}

class Mine3DLoaded extends Mine3DState {
  final MineModel mine;

  Mine3DLoaded(this.mine);
}

class Mine3DError extends Mine3DState {
  final String message;

  Mine3DError(this.message);
}
