import Architecture
import Domain
import Foundation

public protocol DashboardSideEffect: Sendable {
  var toastViewModel: ToastViewActionType { get }
  var sampleUseCase: SampleUseCase { get }
}
