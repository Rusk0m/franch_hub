import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_branches_for_franchise_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/create_franchise_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_all_franchise_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_my_franchises_use_case.dart';
part 'franchise_event.dart';
part 'franchise_state.dart';

class FranchiseBloc extends Bloc<FranchiseEvent, FranchiseState> {
  final GetMyFranchisesUseCase getMyFranchises = sl();
  final GetBranchesForFranchiseUseCase getBranches = sl();
  final CreateFranchiseUseCase createFranchise = sl();
  final GetAllFranchisesUseCase getAllFranchises = sl();

  FranchiseBloc() : super(FranchiseInitial()) {
    on<LoadMyFranchises>((event, emit) async {
      emit(FranchiseLoading());
      try {
        final result = await getMyFranchises(params: event.ownerId);
        emit(FranchiseLoaded(franchises: result));
      } catch (e) {
        emit(MyFranchisesError(e.toString()));
      }
    });

    on<LoadFranchiseBranches>((event, emit) async {
      emit(FranchiseLoading());
      try {
        final result = await getBranches(params: event.franchiseId);
        emit(FranchiseBranchesLoaded(branches: result));
      } catch (e) {
        emit(MyFranchisesError(e.toString()));
      }
    });

    on<CreateFranchise>((event, emit) async {
      emit(FranchiseLoading());
      try {
        await createFranchise(
          params: Franchise(
            id: '',
            ownerId: event.ownerId,
            name: event.name,
            description: event.description,
            industry: event.industry,
            city: event.city,
            startupCost: event.startupCost,
            royaltyPercent: event.royaltyPercent,
            createdAt: DateTime.now(),
          ),
        );
        emit(FranchiseCreated());
      } catch (e) {
        emit(MyFranchisesError('Failed to create franchise: $e'));
      }
    });

    on<LoadAllFranchises>((event, emit) async {
      emit(FranchiseLoading());
      try {
        final result = await getAllFranchises();
        emit(FranchiseLoaded(franchises: result));
      } catch (e) {
        emit(MyFranchisesError(e.toString()));
      }
    });
  }
}