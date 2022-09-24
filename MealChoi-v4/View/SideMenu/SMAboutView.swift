import SwiftUI

struct SMAboutView:View{
    var body:some View{
        ZStack{
            Color(UIColor(red:43/255.0,green:40/255.0,blue:74/255.0,alpha:1))
            VStack(){
                Text("This app is made by ...")
                    .font(Font.custom("NovaOval",size:23))
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .foregroundColor(.white)
                    .padding(.top,90)
                    .padding([.bottom,.leading],10)
                Image("self")
                    .resizable()
                    .frame(width:100,height:100,alignment:.center)
                    .padding(5)
                    .background(
                        Circle()
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .shadow(radius:5)
                    )
                Text("Ian Choi")
                    .font(Font.custom("NovaOval",size:30))
                    .foregroundColor(.white)
                    .padding(.bottom)
                VStack(spacing:5){
                    HStack(spacing:0){
                        Text("Instagram: iani_jh")
                        Link(destination:URL(string:"https://www.instagram.com/iani_jh/")!){
                            Image(systemName:"arrowshape.turn.up.right")
                        }
                    }
                    Text("Email: mealchoi8701@gmail.com")
                        .accentColor(.white)
                }
                .font(Font.custom("Montserrat",size:17))
                .foregroundColor(.white)
                
                Spacer()
                VStack{
                    Text("Information Source")
                    HStack(spacing:0){
                        Text("Columbia Dining")
                        Link(destination:URL(string:"https://dining.columbia.edu/")!){
                            Image(systemName:"arrowshape.turn.up.right")
                        }
                    }
                }
                .font(Font.custom("Montserrat",size:17))
                .frame(maxWidth:.infinity,alignment:.leading)
                .foregroundColor(.white)
                .padding(.leading,10)
                .padding(.bottom,100)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct SMAboutView_Previews:PreviewProvider{
    static var previews:some View{
        SMAboutView()
    }
}
