/// Base interface for all use cases
///
/// [Output] - The type of data returned
/// [Params] - The type of parameters accepted
abstract class UseCase<Output, Params> {
  Output call(Params params);
}

class NoParams {}
