import Architecture
import ComposableArchitecture
import Foundation
import LinkNavigator

// MARK: - HomeSideEffect

struct HomeSideEffect {
  let useCaseGroup: DashboardSideEffect
  let navigator: RootNavigatorType
}

extension HomeSideEffect {
  var routeToBack: () -> Void {
    {
      navigator.back(isAnimated: true)
    }
  }
}
