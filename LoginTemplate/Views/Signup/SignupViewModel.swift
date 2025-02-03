
import Foundation

class SignupViewModel : ObservableObject {
    
    // Form data
    @Published var name : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    
    // Form validation state
    @Published var isNameValidationError = false
    @Published var nameValidationErrorMessage : String = ""
    @Published var isEmailValidationError = false
    @Published var emailValidationErrorMessage : String = ""
    @Published var isPasswordValidationError = false
    @Published var passwordValidationErrorMessage : String = ""
    
    // User registration state
    @Published var isRegistrationComplete = false
    @Published var registrationError : Error? = nil
    
    let signupService : SignupServiceProtocol = SignupService()
    
    func attemptSignup() {
                
        if formIsValid() {
            // Build a SignupData object using the form information
            let userData = SignupData(email: email, password: password, firstName: name)
            
            // Call signup service asynchronously, handing success and failure cases
            signupService.registerUser(signupData: userData) { result in
                switch result {
                case .success(let userId):
                    
                    print("User registration success")
                    print("User ID = \(userId)")
                    
                    // Store user ID
                    // AppRepository.shared.store(data: userId, key: AppConstants.USERID_STORAGE_KEY)
                    
                    // Use the main thread to mark operation as complete
                    DispatchQueue.main.async {
                        self.isRegistrationComplete = true
                    }
                    
                case .failure(let error):
                    
                    print("User registration failure")
                    print("Error: \(error)")
                }
            }
        } else {
            validateForm()
        }
    }
}

extension SignupViewModel {
    
    func validateForm() {
        validateName()
        validateEmail()
        validatePassword()
    }
    
    func validateName() {
        let isValid = name.count > 0
        if !isValid {
            self.isNameValidationError = true
            self.nameValidationErrorMessage = "VALIDATION_TEXT_NAME_REQUIRED"
        } else {
            self.isNameValidationError = false
            self.nameValidationErrorMessage = ""
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
    
    func validatePassword() {
        if FieldValidator.isSecurePassword(password) {
            self.isPasswordValidationError = false
            self.passwordValidationErrorMessage = ""
        } else {
            self.isPasswordValidationError = true
            if (password.count < 8) {
                self.passwordValidationErrorMessage = "VALIDATION_PASSWORD_LENGHT"
            } else {
                self.passwordValidationErrorMessage = "VALIDATION_PASSWORD_FORMAT"
            }
        }
    }
    
    func formIsValid() -> Bool {
        return !name.isEmpty && FieldValidator.isValidEmail(email) && FieldValidator.isSecurePassword(password)
    }
    
}


