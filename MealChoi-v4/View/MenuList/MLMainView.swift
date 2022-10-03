import SwiftUI

struct MLMainView:View{
    @State var mealTime:String
    @State var showDetails=false
    @State var whichMenu=""
    var today:Dictionary<String,Any>
    var menuInfos:Dictionary<String,Any>
    var diningName:String
    var body:some View{
        let numOfMeals=today["numOfMeals"] as? Int ?? 0
        let infoNotProvided=today["infoNotProvided"] as? Bool ?? false
        if(numOfMeals==0){
            if(infoNotProvided){
                Text("Sorry, menu information is not provided.")
                    .font(Font.custom("Montserrat",size:20))
                    .navigationBarTitle(diningName)
                    .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
            }
            else{
                Text("Closed Today")
                    .font(Font.custom("Montserrat",size:20))
                    .navigationBarTitle(diningName)
                    .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
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
                                MLStationView(showDetails:$showDetails,whichMenu:$whichMenu,sttAndMenus:meal[String(index+1)] as! Dictionary<String,Any>,menuInfos:menuInfos)
                            }
                        }
                    }
                }
                let menuInfo=menuInfos[whichMenu] as? Dictionary<String,Any> ?? ["":""]
                let showGf=menuInfo["gf"] as? Bool ?? false
                let showHal=menuInfo["hal"] as? Bool ?? false
                let showVegan=menuInfo["vegan"] as? Bool ?? false
                let showVegetarian=menuInfo["vegetarian"] as? Bool ?? false
                let showBal=menuInfo["bal"] as? Bool ?? false
                let curHeight=Services.getHeight(a:showGf,b:showHal,c:showVegan,d:showVegetarian,e:showBal)
                MDMainView(isShowing:$showDetails,whichMenu:whichMenu,showGf:showGf,showHal:showHal,showVegan:showVegan,showVegetarian:showVegetarian,showBal:showBal,curHeight:curHeight)
            }
            .navigationBarTitle(diningName)
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
        }
    }
}
