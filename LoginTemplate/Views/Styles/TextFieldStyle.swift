
import SwiftUI

struct TextFieldWithImage: TextFieldStyle {

    let image: Image
    var foregroundColor = AppColors.textFieldForeground
    var placeholderColor = Color.gray
    var backgroundColor = AppColors.textFieldBackground
    
    func _body(configuration: TextField<_Label>) -> some View {
        ZStack {
            backgroundColor
                .cornerRadius(16)
            HStack {
                image
                    .frame(width: 24, alignment: .center)
                    .padding(.leading, 12)
                    .foregroundStyle(foregroundColor)
                configuration
                    .foregroundColor(foregroundColor)               // User input color
                    .placeholderStyle(color: placeholderColor)      // Placeholder color
                    .padding(.horizontal, 8)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
    }
    
}
    
extension View {
    func placeholderStyle(color: Color) -> some View {
        self.overlay(
            self
                .foregroundColor(color)
                .opacity(0.5),
            alignment: .leading
        )
    }
}
