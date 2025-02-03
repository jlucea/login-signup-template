
import SwiftUI

struct LoginView: View {
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        VStack (alignment: .center) {
            Spacer()
            
            Text("SIGN_IN")
                .font(AppFonts.title)
                .foregroundColor(.white)
                .padding(.bottom, 30)
            
            Group {
                // Email text field
                TextField("PLACEHOLDER_EMAIL_TEXFIELD", text: $vm.email, onEditingChanged: { (isGainedFocus) in
                    if !isGainedFocus {
                        vm.validateEmail()
                    }
                })
                .textFieldStyle(TextFieldWithImage(image: Image(systemName: "envelope.fill")))
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .padding(.vertical, 10)
                
                // Password text field
                SecureField("PLACEHOLDER_PASSWORD_TEXTFIELD", text: $vm.password)
                    .textFieldStyle(TextFieldWithImage(image: Image(systemName: "lock.fill")))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Spacer()
            
            // Login button
            Button (action: {
                vm.attemptLogin()
            }) {
                Text("LOGIN_BUTTON_LABEL")
                    .modifier(ButtonStyle())
                    .padding(.top, 25)
            }
            .frame(width: 220)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 40)
        .foregroundStyle(AppColors.foregroundColor)
        .background(AppColors.backgroundColor)
        .toolbarRole(.editor)   // Removes the "Back" text from toolbar
    }
}

#Preview {
    LoginView()
}

