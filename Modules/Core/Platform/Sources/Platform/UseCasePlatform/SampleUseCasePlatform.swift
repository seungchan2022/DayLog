import Domain
import Foundation

// MARK: - SampleUseCasePlatform

public struct SampleUseCasePlatform {
  public init() { }
}

// MARK: SampleUseCase

extension SampleUseCasePlatform: SampleUseCase {
  public var fire: () async throws -> SampleEntity {
    {
      .init(name: "sample")
    }
  }
}
