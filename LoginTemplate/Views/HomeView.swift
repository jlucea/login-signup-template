
import SwiftUI

struct HomeView: View {
        
    var body: some View {
        
        Text("This is your App's Home View")
            .navigationTitle("Travel Partner Home")
            .navigationBarBackButtonHidden()
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
