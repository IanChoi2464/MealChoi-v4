import SwiftUI

struct MLStationView:View{
    @EnvironmentObject var model2:EtcModel
    @Binding var showDetails:Bool
    @Binding var whichMenu:String
    var sttAndMenus:Dictionary<String,Any>
    var body:some View{
        let station=sttAndMenus["station"] as! String
        let menus=sttAndMenus["menus"] as! Array<String>
        LazyVStack(alignment:.leading,pinnedViews:[.sectionHeaders]){
            Section(header:MLStationHeaderView(station:station)){
                ForEach(menus,id:\.self){menu in
                    MLRowView(showDetails:$showDetails,whichMenu:$whichMenu,menu:menu)
                }
            }
        }
    }
}
