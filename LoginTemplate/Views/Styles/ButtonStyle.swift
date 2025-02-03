
import SwiftUI

//
// This ViewModifier will give a View the looks of a wide colored button with rounded corners
//
struct ButtonStyle: ViewModifier {
    
    var foregroundColor: Color = AppColors.buttonForeground
    var backgroundColor: Color = AppColors.buttonBackground
    var borderColor: Color = AppColors.buttonBackground
    
    func body(content: Content) -> some View {
        content
            .font(AppFonts.buttonLabel)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(borderColor, lineWidth: 1)
            }
    }

}
