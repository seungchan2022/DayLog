import ComposableArchitecture
import SwiftUI

// MARK: - SamplePage

struct SamplePage {
  @Bindable var store: StoreOf<SampleReducer>
}

// MARK: View

extension SamplePage: View {
  var body: some View {
    VStack {
      Spacer()
      Button(action: { store.send(.onTapHome) }) {
        Text("홈으로 이동")
      }
      Spacer()
    }
  }
}
