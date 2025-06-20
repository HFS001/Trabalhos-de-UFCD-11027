import Foundation
import SwiftUI

class AppState: ObservableObject {
    @Published var restartID = UUID()
}
