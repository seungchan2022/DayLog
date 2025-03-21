import Combine
import SwiftUI

// MARK: - SearchBar

public struct SearchBar {
  @StateObject private var textBindingObserver = BindingObserver<String>()
  @FocusState var isFocus: Bool

  let viewState: ViewState
  let throttleAction: () -> Void

  public init(
    viewState: ViewState,
    throttleAction: @escaping () -> Void)
  {
    self.viewState = viewState
    self.throttleAction = throttleAction
  }
}

// MARK: SearchBar.ViewState

extension SearchBar {
  public struct ViewState: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
      lhs.text.wrappedValue == rhs.text.wrappedValue
    }

    let text: Binding<String>

    public init(text: Binding<String>) {
      self.text = text
    }
  }
}

// MARK: View

extension SearchBar: View {
  public var body: some View {
    HStack {
      TextField("Search..", text: viewState.text)
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal, 10)
        .focused($isFocus)
        .textInputAutocapitalization(.never)

      if isFocus, !viewState.text.wrappedValue.isEmpty {
        Button(action: {
          isFocus = false
          viewState.text.wrappedValue = ""
        }) {
          Text("Cancel")
        }
        .transition(.move(edge: .trailing))
      }
    }
    .clipped()
    .padding(.trailing, 10)
    .animation(.default, value: viewState)
    .onChange(of: viewState.text.wrappedValue) { _, new in
      textBindingObserver.update(value: new)
    }
    .onReceive(textBindingObserver.$value.throttle(
      for: .milliseconds(1500),
      scheduler: RunLoop.main,
      latest: true)) { _ in throttleAction() }
  }
}
