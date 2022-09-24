import SwiftUI

struct RootView:View{
    @EnvironmentObject var model1:DiningModel
    @EnvironmentObject var model2:EtcModel
    var body:some View{
        if(model1.dinings.count<6||model2.etc.count<1){
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
            .environmentObject(EtcModel())
    }
}
