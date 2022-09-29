import SwiftUI

struct RootView:View{
    @EnvironmentObject var model1:DiningModel
    var body:some View{
        if(model1.dinings.count<11){
            WaitingView()
        }
        else{
            DLMainView()
        }
    }
}

struct RootView_Previews:PreviewProvider{
    static var previews:some View{
        RootView()
            .environmentObject(DiningModel())
    }
}
