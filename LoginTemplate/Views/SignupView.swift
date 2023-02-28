
import SwiftUI

struct SignupView: View {
    
    @StateObject var vm = SignupViewModel()

    private let BACKGROUND_IMAGE = "blue-background"
    
    var body: some View {

        VStack (alignment: .leading) {

            NavigationLink(destination: HomeView(), isActive: $vm.isRegistrationComplete) { EmptyView() }

            Spacer()
            
            Group {
                // Name text field
                TextField("PLACEHOLDER_NAME_TEXTFIELD", text: $vm.name, onEditingChanged: { (isGainedFocus) in
                    // print("Name field on editing changed")
                    if !isGainedFocus {
                        vm.validateName()
                    }
                })
                .textFieldWithImage(image: Image(systemName: "person"))
                .autocorrectionDisabled()
                .padding(.top, 10)
                
                // Name validation error message
                if vm.isNameValidationError {
                    // Name validation error message
                    Text(NSLocalizedString(vm.nameValidationErrorMessage, comment: ""))
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                // Email text field
                TextField("PLACEHOLDER_EMAIL_TEXFIELD", text: $vm.email, onEditingChanged: { (isGainedFocus) in
                    if !isGainedFocus {
                        vm.validateEmail()
                    }
                })
                .textFieldWithImage(image: Image(systemName: "envelope"))
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .padding(.top, 10)
                
                // Email validation error message
                if vm.isEmailValidationError {
                    Text(NSLocalizedString(vm.emailValidationErrorMessage, comment: ""))
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                // Password text field
                SecureField("PLACEHOLDER_PASSWORD_TEXTFIELD", text: $vm.password, onCommit: vm.validatePassword)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldWithImage(image: Image(systemName: "lock"))
                    .padding(.top, 10)
                
                // An alternative component for the password field that includes a show/hide toggle button
                //                 RevealableSecureField("PLACEHOLDER_PASSWORD_TEXTFIELD", text: $vm.password)
                //                    .modifier(TextFieldStyle())
            }
            
            if vm.isPasswordValidationError {
                Text(NSLocalizedString(vm.passwordValidationErrorMessage, comment: "Password validation error message"))
                    .font(.footnote)
                    .foregroundColor(.red)
            }
            Button(action: {
                
                vm.attemptSignup()
                
            }) {
                Text("CREATE_ACCOUNT_BUTTON_LABEL")
                    .modifier(ButtonViewModifier(foregroundColor: .white, backgroundColor: .purple, isEnabled: vm.formIsValid()))
                    .padding(.top, 35)
            }
            
            Spacer()
            
            Text("LEGAL_WARNING_TEXT")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.top)
            
        } // VStack
        .navigationTitle("Sign up")
        .background(Image(BACKGROUND_IMAGE))
        .padding(20)
        
    } // Body
    
}


struct SignupView_Previews: PreviewProvider {
            
    static var previews: some View {
        let previewViewModel = SignupViewModel()
        previewViewModel.name = ""
        previewViewModel.email = ""
        previewViewModel.password = ""
            
        let previews = Group {
            SignupView(vm: previewViewModel)
                .previewDisplayName("Signup")
            SignupView(vm: previewViewModel)
                .environment(\.locale, .init(identifier: "ar-EG"))
                .previewDisplayName("Signup - Arabic")
        }
        
        return previews
    }
    
}
