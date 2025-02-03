
import SwiftUI

struct WelcomeView: View {
        
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // MARK: Icon and welcome text
                Group {
                    VStack (alignment: .center) {
                        Image(systemName: "person.2.badge.key.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48, alignment: .center)
                            .padding(.bottom, 20)
                        
                        VStack(alignment: .leading) {
                            Text("WELCOME_TITLE")
                                .font(AppFonts.title)
                        }
                    }
                    .foregroundStyle(.white)
                }
                
                Spacer()
                
                // MARK: Buttons (navigation links)
                Group {
                    // NavLink to create account
                    NavigationLink(destination: SignupOptionsView(), label: {
                        Text("SIGNUP_BUTTON_LABEL")
                            .modifier(ButtonStyle())
                    })
                    .padding(.vertical, 10)
                    
                    // NavLink to sign in
                    NavigationLink(destination: LoginView(), label: {
                        Text("LOGIN_BUTTON_LABEL")
                            .modifier(ButtonStyle(foregroundColor: .white, backgroundColor: .black, borderColor: .white.opacity(0.5)))
                    })
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            .background(AppColors.backgroundColor)
        }
    }
}

#Preview ("English") {
    WelcomeView()
        .environment(\.locale, .init(identifier: "en-UK"))
}

#Preview ("Español") {
    WelcomeView()
        .environment(\.locale, .init(identifier: "es-ES"))
}
