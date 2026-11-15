// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((
  ref,
) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', isChange: false));

  void search(String text) {
    state = state.copyWith(search: text);
  }

  void onChange(bool changeVal) {
    state = state.copyWith(isChange: changeVal);
  }
}

class SearchState {
  final String search;
  final bool isChange;
  SearchState({required this.search, required this.isChange});

  SearchState copyWith({String? search, bool? isChange}) {
    return SearchState(
      search: search ?? this.search,
      isChange: isChange ?? this.isChange,
    );
  }
}
