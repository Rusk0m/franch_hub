part of 'home_cubit.dart';

enum HomeTab { catalog, comparison, profile }

final class HomeState extends Equatable {

  final HomeTab tab;

  const HomeState({
    this.tab = HomeTab.catalog,
  });

  int get tabIndex => tab.index;

  @override
  List<Object> get props => [tab];
}



