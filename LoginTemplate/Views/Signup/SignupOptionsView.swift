//
//  SignupOptionsView.swift
//  LoginTemplate
//
//  Created by Jaime Lucea on 3/2/25.
//

import SwiftUI

struct SignupOptionsView: View {
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // MARK: Icon and welcome text
            Group {
                VStack(alignment: .leading) {
                    Text("Sign up")
                        .font(AppFonts.title)
                }
            }
            
            VStack {
                NavigationLink(destination: SignupView()) {
                    Text("Sign up with email")
                        .modifier(ButtonStyle())
                        .padding(.horizontal, 60)
                }
            }
            
            Spacer()
            VStack (spacing: 18) {
                Text("Already have an account?")
                    .font(AppFonts.primary)
                
                NavigationLink(destination: LoginView()) {
                    Text("Log in")
                        .font(AppFonts.primary)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(AppColors.foregroundColor)
        .background(AppColors.backgroundColor)
        .toolbarRole(.editor)   // Removes the "Back" text from toolbar
    }
}

#Preview {
    SignupOptionsView()
}
