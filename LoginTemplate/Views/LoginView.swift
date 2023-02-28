
import SwiftUI

struct LoginView: View {
    
    private let BACKGROUND_IMAGE = "blue-background"
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        
        VStack {

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
            
            // Password text field
            SecureField("PLACEHOLDER_PASSWORD_TEXTFIELD", text: $vm.password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldWithImage(image: Image(systemName: "lock"))
                .padding(.top, 10)
                        
            Button (action: {
                
                vm.attemptLogin()
                
            }) {
                Text("LOGIN_BUTTON_LABEL")
                    .modifier(ButtonViewModifier(foregroundColor: .white, backgroundColor: .purple, isEnabled: vm.formIsValid()))
                    .padding(.top, 25)
            }
        }
        .background(Image(BACKGROUND_IMAGE))
        .padding(20)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
