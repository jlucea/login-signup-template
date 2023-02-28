
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    
    // Email validation
    @Published var isEmailValidationError = false
    @Published var emailValidationErrorMessage : String = ""
    
    // Login Successful
    @Published var isLoginSuccess = false
        
    private var service: AuthenticationServiceProtocol
    // private var repository: Repository
    
    init(_ service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
        // self.repository = repository
    }
    
    func attemptLogin() {
        let data = UserCredentials(email: email, password: password)
        
        service.login(credentials: data) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let loginResponse):
                self.isLoginSuccess = true
                // self.repository.store(data: loginResponse.accessToken, key: AppConstants.ACCESS_TOKEN)
                print("LoginViewModel attemptLogin success: ", loginResponse.userId)
                
            case .failure(let error):
                self.isLoginSuccess = false
                print("LoginViewModel attemptLogin error \(error)")
            }
        }
    }
    
    func validateEmail() {
        if FieldValidator.isValidEmail(email) {
            self.isEmailValidationError = false
            self.emailValidationErrorMessage = ""
        } else {
            self.isEmailValidationError = true
            self.emailValidationErrorMessage = "VALIDATION_TEXT_EMAIL"
        }
    }
    
    
    func formIsValid() -> Bool {
        return FieldValidator.isValidEmail(email) && password.count > 4
    }
    
    
}
