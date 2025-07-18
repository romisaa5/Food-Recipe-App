import 'package:flutter_bloc/flutter_bloc.dart';

class TermsCubit extends Cubit<bool> {
  TermsCubit() : super(false);

  void toggle(bool? value) => emit(value ?? false);
}
