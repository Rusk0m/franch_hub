import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comparison_franchise_event.dart';
part 'comparison_franchise_state.dart';

class ComparisonFranchiseBloc extends Bloc<ComparisonFranchiseEvent, ComparisonFranchiseState> {
  ComparisonFranchiseBloc() : super(ComparisonFranchiseInitial()) {
    on<ComparisonFranchiseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
