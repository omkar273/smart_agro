import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashbaord_state.dart';

class DashbaordCubit extends Cubit<DashbaordState> {
  DashbaordCubit() : super(DashbaordInitial());
}
