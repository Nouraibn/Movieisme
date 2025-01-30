import Foundation
import Combine

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSignedIn: Bool = false // State for navigation
    @Published var errorMessage: String? = nil // Error message for incorrect login
    @Published var emailError: Bool = false // Email validation state
    @Published var passwordError: Bool = false // Password validation state
    @Published var isPasswordVisible: Bool = false
    
    private var fetchData = FetchData() // Fetch ViewModel
    
    init() {
        fetchData.fetchUsers()
    }
    
    func signIn() {
        if let user = fetchData.users.first(where: { $0.fields.email == email && $0.fields.password == password }) {
            print("Welcome, \(user.fields.name)!")
            errorMessage = nil
            emailError = false
            passwordError = false
            isSignedIn = true // Navigate to MoviesCenterView
        } else {
            errorMessage = "Invalid email or password. Please try again."
            emailError = !fetchData.users.contains { $0.fields.email == email }
            passwordError = !fetchData.users.contains { $0.fields.password == password }
        }
    }
}
