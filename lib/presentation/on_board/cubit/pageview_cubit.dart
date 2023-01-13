import 'package:bloc/bloc.dart';

class PageViewCubit extends Cubit<double>{
  PageViewCubit(super.initialState);

  void onPageChange(index)=>emit(index);
}