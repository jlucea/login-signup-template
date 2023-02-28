
import SwiftUI

//
// This ViewModifier will give a TextField the looks of a wide colored button with rounded corners
//
struct ButtonViewModifier : ViewModifier {
    
    var foregroundColor : Color
    var backgroundColor : Color
    var isEnabled : Bool
    
    let CORNER_RADIUS : CGFloat = 22
    let HEIGHT : CGFloat = 55
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: HEIGHT)
            .background(isEnabled ? backgroundColor : .gray)
            .foregroundColor(foregroundColor)
            .cornerRadius(CORNER_RADIUS)
            .overlay(RoundedRectangle(cornerRadius: CORNER_RADIUS).stroke(isEnabled ? backgroundColor : .gray, lineWidth: 2))
    }

}
