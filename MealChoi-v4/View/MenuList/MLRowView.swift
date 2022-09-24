import SwiftUI

struct MLRowView:View{
    @EnvironmentObject var model2:EtcModel
    @Binding var showDetails:Bool
    @Binding var whichMenu:String
    var menu:String
    var body:some View{
        VStack(alignment:.leading){
            let menuInfos=model2.etc[0]["menuInfos"] as! Dictionary<String,Any>
            let menuInfo=menuInfos[menu] as? Dictionary<String,Any> ?? ["cal":"No Information","gf":false,"hal":false,"vegan":false,"vegetarian":false]
            Button{
                showDetails=true
                whichMenu=menu
            }label:{
                HStack{
                    Text(menu)
                        .font(Font.custom("Roboto",size:21))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    HStack{
                        if(menuInfo["gf"] as! Bool){
                            Image("Gluten Free")
                                .resizable()
                                .frame(width:30,height:30)
                        }
                        if(menuInfo["vegan"] as! Bool){
                            Image("Vegan")
                                .resizable()
                                .frame(width:30,height:30)
                        }
                        if(menuInfo["vegetarian"] as! Bool){
                            Image("Vegetarian")
                                .resizable()
                                .frame(width:30,height:30)
                        }
                        if(menuInfo["hal"] as! Bool){
                            Image("Halal")
                                .resizable()
                                .frame(width:30,height:30)
                        }
                        Image(systemName:"questionmark.circle")
                            .resizable()
                            .frame(width:30,height:30)
                            .opacity(0.7)
                    }
                    .padding(.trailing,10)
                }
            }
            DividerView()
        }
        .padding(.horizontal,10.0)
        .foregroundColor(.black)
    }
}
