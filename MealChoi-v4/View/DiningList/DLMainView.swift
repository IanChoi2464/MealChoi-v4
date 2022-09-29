import SwiftUI

struct DLMainView:View{
    @EnvironmentObject var model1:DiningModel
    @State var showSideMenu=false
    var body:some View{
        NavigationView{
            ZStack{
                VStack(alignment:.leading,spacing:0){
                    DLHeaderView(showSideMenu:$showSideMenu)
                    ScrollView{
                        LazyVStack{
                            ForEach(model1.dinings.indices,id:\.self){index in
                                let diningName=model1.dinings[index]["name"] as! String
                                let menuInfos=model1.dinings[index]["menuInfos"] as? Dictionary<String,Any> ?? ["":""]
                                //let today=model1.dinings[index]["220924"] as! Dictionary<String,Any>
                                let today=model1.dinings[index][Services.getDate_str(date:Date(),format:"yyMMdd")] as! Dictionary<String,Any>
                                let mealTime=Services.getMealTime(numOfMeals:today["numOfMeals"] as? Int ?? 0)
                                let openHours=today["openHours"] as? [String] ?? ["Closed Today"]
                                if(index==6){
                                    Text("Cafe")
                                        .font(Font.custom("NovaOval",size:35))
                                        .frame(maxWidth:.infinity,alignment:.leading)
                                        .padding(.leading,15)
                                }
                                NavigationLink(
                                    destination:MLMainView(mealTime:mealTime,today:today,menuInfos:menuInfos,diningName:diningName)
                                ){
                                    DLRowView(diningName:diningName,openHours:openHours)
                                }
                            }
                        }
                        .padding(.top)
                        .accentColor(.black)
                    }
                }
                ZStack{
                    GeometryReader{_ in
                        EmptyView()
                    }
                    .background(.gray.opacity(0.25))
                    .opacity(showSideMenu ? 1: 0)
                    .animation(.easeIn.delay(0.25),value:showSideMenu)
                    .onTapGesture{
                        showSideMenu.toggle()
                    }
                    HStack{
                        Spacer()
                        SMMainView()
                            .frame(width:UIScreen.main.bounds.width/1.6)
                            .offset(x:showSideMenu ? 0:UIScreen.main.bounds.width)
                            .animation(.default,value:showSideMenu)
                            .cornerRadius(20,corners:[.topLeft,.bottomLeft])
                            .ignoresSafeArea()
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DLMainView_Previews:PreviewProvider{
    static var previews:some View{
        DLMainView()
            .environmentObject(DiningModel())
    }
}
