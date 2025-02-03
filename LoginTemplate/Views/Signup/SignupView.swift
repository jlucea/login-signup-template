
import SwiftUI

struct SignupView: View {
    
    @StateObject var vm = SignupViewModel()
    
    var body: some View {

        VStack (alignment: .center) {
            
            Spacer()
            
            Text("Sign up")
                .font(AppFonts.title)
            
            Group {
                
                TextField("PLACEHOLDER_EMAIL_TEXFIELD", text: $vm.email)
                    .textFieldStyle(TextFieldWithImage(image: Image(systemName: "envelope.fill")))
                    .autocorrectionDisabled()
                    .padding(.vertical, 20)
                                
                // Email validation error message
//                if vm.isEmailValidationError {
//                    Text(NSLocalizedString(vm.emailValidationErrorMessage, comment: ""))
//                        .font(.footnote)
//                        .foregroundColor(.red)
//                }
                
                // Password text field
                SecureField("PLACEHOLDER_PASSWORD_TEXTFIELD", text: $vm.password, onCommit: vm.validatePassword)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(TextFieldWithImage(image: Image(systemName: "lock.fill")))
                
//            if vm.isPasswordValidationError {
//                Text(NSLocalizedString(vm.passwordValidationErrorMessage, comment: "Password validation error message"))
//                    .font(.footnote)
//                    .foregroundColor(.red)
//            }
            }
            
            Spacer()
            
            Button(action: {
                vm.attemptSignup()
            }, label: {
                Text("CREATE_ACCOUNT_BUTTON_LABEL")
                    .modifier(ButtonStyle())
            })
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity)
        .foregroundStyle(AppColors.foregroundColor)
        .background(AppColors.backgroundColor)
        .toolbarRole(.editor)   // Removes the "Back" text from toolbar
    }

}

#Preview {
    SignupView()
}
