import SwiftUI

struct MDMainView:View{
    @Binding var isShowing:Bool
    let whichMenu:String
    let calories:String
    let showGf:Bool
    let showVegan:Bool
    let showVegetarian:Bool
    let showHal:Bool
    let curHeight:CGFloat
    var body:some View{
        ZStack(alignment:.bottom){
            if(isShowing){
                Color.black
                    .opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture{
                        isShowing=false
                    }
                mainView
                .transition(.move(edge:.bottom))
            }
        }
        .frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.bottom)
        .ignoresSafeArea()
        .animation(.easeInOut,value:isShowing)
    }
    var mainView:some View{
        VStack(alignment:.leading,spacing:5){
            Text(whichMenu)
                .font(.system(size:25,weight:.semibold))
            DividerView()
            HStack(spacing:0){
                Text("Calories: ")
                Text(calories)
                    .fontWeight(.bold)
                if(calories != "No Information"){
                    Text(" kcal per 100g")
                }
            }
            .font(Font.custom("Montserrat",size:18))
            if(showGf){
                MDIconView(icon:"Gluten Free")
            }
            if(showVegan){
                MDIconView(icon:"Vegan")
            }
            if(showVegetarian){
                MDIconView(icon:"Vegetarian")
            }
            if(showHal){
                MDIconView(icon:"Halal")
            }
            Spacer()
        }
        .frame(maxWidth:.infinity,alignment:.leading)
        .padding(20)
        .frame(height:curHeight)
        .background(
            ZStack{
                Rectangle()
                    .frame(height:curHeight)
                    .cornerRadius(30,corners:[.topLeft,.topRight])
            }
                .foregroundColor(.white)
        )
    }
}
