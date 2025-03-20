import Architecture
import Foundation
@preconcurrency import LinkNavigator
import Platform

@MainActor
final class AppContainer {

  // MARK: Lifecycle

  init(dependency: AppSideEffect = AppSideEffect.generate()) {
    self.dependency = dependency
    let builder = AppRouteBuilderGroup<SingleLinkNavigator>()
    linkNavigator = .init(
      routeBuilderItemList: builder.applicationBuilders(),
      dependency: dependency)
  }

  // MARK: Internal

  let linkNavigator: SingleLinkNavigator
  let dependency: AppSideEffect

}
