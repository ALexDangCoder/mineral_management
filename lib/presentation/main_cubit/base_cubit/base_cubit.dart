import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class BaseCubit<T> extends Cubit<T> {
  BaseCubit(T initialState) : super(initialState);
}