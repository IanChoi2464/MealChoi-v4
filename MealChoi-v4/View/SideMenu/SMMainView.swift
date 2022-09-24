import SwiftUI

struct SMMainView:View{
    var body:some View{
        ZStack{
            Color(UIColor(red:43/255.0,green:40/255.0,blue:74/255.0,alpha:1))
            VStack(alignment:.leading,spacing:0){
                HStack{
                    Image(systemName:"person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width:32,height:32,alignment:.center)
                    Text("Columbia University")
                }
                .font(Font.custom("NovaOval",size:25))
                .foregroundColor(.white)
                .padding()
                .padding(.top)
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height:1)
                    .padding(.horizontal)
                    .padding(.bottom,30)
                NavigationLink(
                    destination:SMAboutView()
                ){
                    SMRowView(image:"person.fill.questionmark",text:"About")
                }
                Spacer()
            }
            .padding(.top,15)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SMMainView_Previews:PreviewProvider{
    static var previews:some View{
        SMMainView()
    }
}
