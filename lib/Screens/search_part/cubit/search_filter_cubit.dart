import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_filter_state.dart';

class SearchFilterCubit extends Cubit<SearchFilterState> {
  SearchFilterCubit() : super(SearchFilterState(false));

  void selectSearch(bool isSelected){
    emit(SearchFilterState(isSelected));
  }

}
