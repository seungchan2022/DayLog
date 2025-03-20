import Architecture
import ComposableArchitecture
import Foundation
import LinkNavigator

// MARK: - SampleSideEffect

struct SampleSideEffect {
  let useCaseGroup: DashboardSideEffect
  let navigator: RootNavigatorType
}

extension SampleSideEffect {

  var getSample: (String) -> Effect<SampleReducer.Action> {
    { text in
      .run { send in
        do {
          let _ = try await useCaseGroup.sampleUseCase.fire()
          await send(SampleReducer.Action.fetchSample(.success(text)))
        } catch {
          await send(SampleReducer.Action.fetchSample(.failure(.other(error))))
        }
      }
    }
  }

  var routeToHome: () -> Void {
    {
      navigator.next(
        linkItem: .init(
          path: Link.Dashboard.Path.home.rawValue,
          items: .none),
        isAnimated: true)
    }
  }
}
