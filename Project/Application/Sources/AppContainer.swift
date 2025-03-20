import Architecture
import Foundation
@preconcurrency import LinkNavigator
import Platform

@MainActor
final class AppContainer {

  // MARK: Lifecycle

  init(dependency: AppSideEffect = AppSideEffect.generate()) {
    let builder = AppRouteBuilderGroup<SingleLinkNavigator>()
    linkNavigator = .init(
      routeBuilderItemList: builder.applicationBuilders(),
      dependency: dependency)
  }

  // MARK: Internal

  let linkNavigator: SingleLinkNavigator

}
