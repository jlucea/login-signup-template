
import SwiftUI

struct RevealableSecureField: View {

    private var placeholder : String
    @Binding private var text : String
    @State var reveal : Bool = false

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            Group {
                if reveal == true {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
            }

            Button(action: {
                reveal.toggle()
            }) {
                Image(systemName: self.reveal ? "eye" : "eye.slash" )
            }
        }
    }
    
}
