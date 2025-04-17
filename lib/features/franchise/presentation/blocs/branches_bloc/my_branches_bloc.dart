import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_my_branches_use_case.dart';

part 'my_branches_event.dart';
part 'my_branches_state.dart';

class MyBranchesBloc extends Bloc<MyBranchesEvent, MyBranchesState> {
  final GetMyBranchesUseCase getMyBranches = sl();

  MyBranchesBloc() : super(MyBranchesInitial()) {
    on<LoadMyBranches>((event, emit) async {
      emit(MyBranchesLoading());
     try{
       final result = await getMyBranches(params: event.ownerId);
       emit(MyBranchesLoaded(branches: result));
     }catch (e){
       emit(MyBranchesError(e.toString()));
     }
    });
  }
}
