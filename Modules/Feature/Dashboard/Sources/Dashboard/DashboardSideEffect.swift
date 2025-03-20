import Architecture
import Domain
import Foundation

public protocol DashboardSideEffect: Sendable {
  var sampleUseCase: SampleUseCase { get }
}
