abstract class StreamUseCase<ReturnType, Params> {
  Stream<ReturnType> call({Params params});
}