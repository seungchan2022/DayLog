import ComposableArchitecture
import SwiftUI

// MARK: - HomePage

struct HomePage {
  @Bindable var store: StoreOf<HomeReducer>
}

// MARK: View

extension HomePage: View {
  var body: some View {
    VStack {
      Spacer()
      Button(action: { store.send(.onTapBack) }) {
        Text("뒤로 이동")
      }
      Spacer()
    }
  }
}
