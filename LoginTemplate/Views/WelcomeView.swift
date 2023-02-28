
import SwiftUI

struct WelcomeView: View {
    
    private let BACKGROUND_IMAGE = "blue-background"
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                Spacer()
                
                // Go to sign up button
                NavigationLink(destination: SignupView(), label: {
                    Text("SIGNUP_BUTTON_LABEL")
                        .modifier(ButtonViewModifier(foregroundColor: .white, backgroundColor: .purple, isEnabled: true))
                })
                .padding(.bottom, 12)
                
                // Go to log in button
                NavigationLink(destination: LoginView(), label: {
                    Text("LOGIN_BUTTON_LABEL")
                        .modifier(ButtonViewModifier(foregroundColor: .purple, backgroundColor: .white, isEnabled: true))
                })
                
                // Continue as a guest label
                Text("SIGNUP_LATER_TEXT")
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                    .foregroundColor(.white)
            }
            .background(Image(BACKGROUND_IMAGE))
            .padding(20)
        }
        .accentColor(Color(.label))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeView()
                .previewDisplayName("WelcomeView - English")
            WelcomeView()
                .environment(\.locale, .init(identifier: "ar-EG"))
                .previewDisplayName("WelcomeView - Arabic")
        }
    }
}
