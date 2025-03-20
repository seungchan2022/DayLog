import Foundation

public protocol SampleUseCase: Sendable {
  var fire: () async throws -> SampleEntity { get }
}
