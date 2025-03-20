import Architecture
import ComposableArchitecture
import Foundation

// MARK: - SampleReducer

@Reducer
struct SampleReducer {
  let sideEffect: SampleSideEffect

  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: state.id, id: $0) })

      case .onTapHome:
        sideEffect.routeToHome()
        return .none
      }
    }
  }

}

extension SampleReducer {

  @ObservableState
  struct State: Equatable, Identifiable, Sendable {
    let id: UUID

    init(id: UUID = .init()) {
      self.id = id
    }
  }

  enum Action: Equatable, BindableAction, Sendable {
    case binding(BindingAction<State>)
    case teardown

    case onTapHome
  }
}

extension SampleReducer {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
