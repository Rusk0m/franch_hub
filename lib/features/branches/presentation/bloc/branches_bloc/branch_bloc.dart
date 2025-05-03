import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/use_case/add_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/create_pending_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/delete_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/edit_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_branches_for_franchise_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_my_branches_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/moderate_branch_use_case.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:franch_hub/features/chat/domain/use_case/send_message_use_case.dart';
import 'package:uuid/uuid.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final CreatePendingBranchUseCase createPendingBranchUseCase = sl();
  final GetMyBranchesUseCase getMyBranchesUseCase = sl();
  final GetBranchesForFranchiseUseCase getBranchesForFranchiseUseCase = sl();
  final SendMessageUseCase sendMessageUseCase = sl();
  final AddBranchUseCase addBranchUseCase = sl();
  final DeleteBranchUseCase deleteBranchUseCase = sl();
  final EditBranchUseCase editBranchUseCase = sl();
  final ModerateBranchUseCase moderateBranchUseCase = sl();

  BranchBloc() : super(BranchInitial()) {
    on<CreatePendingBranch>(_onCreatePendingBranch);
    on<LoadMyBranches>(_onLoadMyBranches);
    on<LoadBranchesForFranchise>(_onLoadBranchesForFranchise);
    on<AddBranch>(_onAddBranch);
    on<DeleteBranch>(_onDeleteBranch);
    on<EditBranch>(_onEditBranch);
    on<ModeratePendingBranch>(_onModeratePendingBranch);
  }

  Future<void> _onCreatePendingBranch(
      CreatePendingBranch event, Emitter<BranchState> emit) async {
    emit(BranchLoading());
    try {
      final pendingBranch = PendingFranchiseBranch(
        id: const Uuid().v4(),
        franchiseId: event.franchiseId,
        ownerId: event.ownerId,
        requesterId: event.requesterId,
        name: event.name,
        location: event.location,
        royaltyPercent: event.royaltyPercent,
        workingHours: event.workingHours,
        phone: event.phone,
        status: 'pending',
        createdAt: DateTime.now(),
      );
      await createPendingBranchUseCase(params: pendingBranch);

      // Send notification to franchise owner
      final chatId = _generateChatId(event.ownerId, event.requesterId);
      await sendMessageUseCase(
        params: SendMessageParams(
          message: Message(
            id: const Uuid().v4(),
            senderId: 'system',
            receiverId: event.ownerId,
            content: 'New branch request for "${event.name}" from ${event.requesterId}.',
            sentAt: DateTime.now(),
            isSystemMessage: true,
          ),
          chatId: chatId,
        ),
      );

      emit(BranchSuccess());
    } catch (e) {
      print('BranchBloc: Error creating pending branch: $e');
      emit(BranchError(message: 'Failed to create pending branch: $e'));
    }
  }

  Future<void> _onLoadMyBranches(
      LoadMyBranches event, Emitter<BranchState> emit) async {
    emit(BranchLoading());
    try {
      print('BranchBloc: Loading franchiseBranches for ownerId: ${event.ownerId}');
      final branches = await getMyBranchesUseCase(params: event.ownerId);
      print('BranchBloc: Loaded ${branches.length} franchiseBranches for ownerId: ${event.ownerId}');
      emit(BranchLoaded(branches: branches));
    } catch (e) {
      print('BranchBloc: Error loading franchiseBranches: $e');
      emit(BranchError(message: 'Failed to load franchiseBranches: $e'));
    }
  }

  Future<void> _onLoadBranchesForFranchise(
      LoadBranchesForFranchise event, Emitter<BranchState> emit) async {
    emit(BranchLoading());
    try {
      print('BranchBloc: Loading franchiseBranches for franchiseId: ${event.franchiseId}');
      final branches = await getBranchesForFranchiseUseCase(params: event.franchiseId);
      print('BranchBloc: Loaded ${branches.length} franchiseBranches for franchiseId: ${event.franchiseId}');
      emit(BranchLoaded(branches: branches));
    } catch (e) {
      print('BranchBloc: Error loading franchiseBranches: $e');
      emit(BranchError(message: 'Failed to load franchiseBranches: $e'));
    }
  }

  Future<void> _onAddBranch(AddBranch event, Emitter<BranchState> emit) async {
    emit(BranchLoading());
    try {
      await addBranchUseCase(params: event.branch);
      emit(BranchSuccess());
    } catch (e) {
      print('BranchBloc: Error adding branch: $e');
      emit(BranchError(message: 'Failed to add branch: $e'));
    }
  }

  Future<void> _onDeleteBranch(DeleteBranch event, Emitter<BranchState> emit) async {
    emit(BranchLoading());
    try {
      await deleteBranchUseCase(params: event.branchId);
      // Update current state if it's BranchLoaded
      if (state is BranchLoaded) {
        final currentBranches = (state as BranchLoaded).branches;
        final updatedBranches = currentBranches.where((branch) => branch.id != event.branchId).toList();
        emit(BranchLoaded(branches: updatedBranches));
      } else {
        emit(BranchSuccess());
      }
    } catch (e) {
      print('BranchBloc: Error deleting branch: $e');
      emit(BranchError(message: 'Failed to delete branch: $e'));
    }
  }

  Future<void> _onEditBranch(EditBranch event, Emitter<BranchState> emit) async {
    emit(BranchLoading());
    try {
      await editBranchUseCase(params: event.branch);
      // Update current state if it's BranchLoaded
      if (state is BranchLoaded) {
        final currentBranches = (state as BranchLoaded).branches;
        final updatedBranches = currentBranches
            .map((branch) => branch.id == event.branch.id ? event.branch : branch)
            .toList();
        emit(BranchLoaded(branches: updatedBranches));
      } else {
        emit(BranchSuccess());
      }
    } catch (e) {
      print('BranchBloc: Error editing branch: $e');
      String errorMessage = 'Failed to edit branch: $e';
      if (e.toString().contains('Branch with ID')) {
        errorMessage = 'The branch you are trying to edit no longer exists.';
      }
      emit(BranchError(message: errorMessage));
    }
  }

  Future<void> _onModeratePendingBranch(
      ModeratePendingBranch event, Emitter<BranchState> emit) async {
    emit(BranchLoading());
    try {
      await moderateBranchUseCase(
        params: ModerateBranchParams(
          pendingBranchId: event.pendingBranchId,
          status: event.status,
          branch: event.branch,
        ),
      );
      if (event.status == 'approved' && event.branch != null) {
        // Send notification to franchisee
        final chatId = _generateChatId(event.branch!.ownerId, event.franchiseOwnerId);
        await sendMessageUseCase(
          params: SendMessageParams(
            message: Message(
              id: const Uuid().v4(),
              senderId: 'system',
              receiverId: event.branch!.ownerId,
              content: 'Your branch request for "${event.branch!.name}" has been approved.',
              sentAt: DateTime.now(),
              isSystemMessage: true,
            ),
            chatId: chatId,
          ),
        );
        // Update current state if it's BranchLoaded
        if (state is BranchLoaded) {
          final currentBranches = (state as BranchLoaded).branches;
          final updatedBranches = [...currentBranches, event.branch!];
          emit(BranchLoaded(branches: updatedBranches));
        } else {
          emit(BranchSuccess());
        }
      } else {
        emit(BranchSuccess());
      }
    } catch (e) {
      print('BranchBloc: Error moderating branch: $e');
      emit(BranchError(message: 'Failed to moderate branch: $e'));
    }
  }

  String _generateChatId(String uid1, String uid2) {
    final ids = [uid1, uid2]..sort();
    return '${ids[0]}_${ids[1]}';
  }
}