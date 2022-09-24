import SwiftUI

struct MLMainView:View{
    @EnvironmentObject var model2:EtcModel
    @State var mealTime:String
    @State var showDetails=false
    @State var whichMenu=""
    var today:Dictionary<String,Any>
    var diningName:String
    var body:some View{
        let numOfMeals=today["numOfMeals"] as? Int ?? 0
        let infoNotProvided=today["infoNotProvided"] as? Bool ?? false
        if(numOfMeals==0){
            if(infoNotProvided){
                Text("Sorry, menu information is not provided.")
                    .font(Font.custom("Montserrat",size:20))
                    .navigationBarTitle(diningName)
            }
            else{
                Text("Closed Today")
                    .font(Font.custom("Montserrat",size:20))
                    .navigationBarTitle(diningName)
            }
        }
        else{
            ZStack{
                VStack(spacing:0){
                    Divider()
                    if(numOfMeals==3){
                        Picker("",selection:$mealTime){
                            Text("Breakfast").tag("Breakfast")
                            Text("Lunch").tag("Lunch")
                            Text("Dinner").tag("Dinner")
                        }
                        .padding(.horizontal,30.0)
                        .font(Font.custom("Montserrat",size:15))
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    else if(numOfMeals==2){
                        Picker("",selection:$mealTime){
                            Text("Brunch").tag("Brunch")
                            Text("Dinner").tag("Dinner")
                        }
                        .padding(.horizontal,30.0)
                        .font(Font.custom("Montserrat",size:15))
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    else{
                        Picker("",selection:$mealTime){
                            Text("Daily").tag("Daily")
                        }
                        .padding(.horizontal,30.0)
                        .font(Font.custom("Montserrat",size:15))
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    let meal=today[mealTime.lowercased()] as! Dictionary<String,Any>
                    ScrollView(showsIndicators:false){
                        VStack{
                            ForEach(Array(meal.keys).indices,id:\.self){index in
                                MLStationView(showDetails:$showDetails,whichMenu:$whichMenu,sttAndMenus:meal[String(index+1)] as! Dictionary<String,Any>)
                            }
                        }
                    }
                }
                let menuInfos=model2.etc[0]["menuInfos"] as! Dictionary<String,Any>
                let menuInfo=menuInfos[whichMenu] as? Dictionary<String,Any> ?? ["cal":"No Information","gf":false,"hal":false,"vegan":false,"vegetarian":false]
                let calories=menuInfo["cal"] as! String
                let showGf=menuInfo["gf"] as! Bool
                let showVegan=menuInfo["vegan"] as! Bool
                let showVegetarian=menuInfo["vegetarian"] as! Bool
                let showHal=menuInfo["hal"] as! Bool
                let curHeight=Services.getHeight(a:showGf,b:showVegan,c:showVegetarian,d:showHal)
                MDMainView(isShowing:$showDetails,whichMenu:whichMenu,calories:calories,showGf:showGf,showVegan:showVegan,showVegetarian:showVegetarian,showHal:showHal,curHeight:curHeight)
            }
            .navigationBarTitle(diningName)
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
        }
    }
}
