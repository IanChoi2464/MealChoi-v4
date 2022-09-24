import SwiftUI

struct DLHeaderView:View{
    @Binding var showSideMenu:Bool
    var body:some View{
        HStack{
            Text("MealChoi")
                .font(Font.custom("NovaOval",size:36))
                .padding(.leading,15.0)
            Spacer()
            Button{
                showSideMenu.toggle()
            }label:{
                Image(systemName:"line.3.horizontal.circle")
                    .resizable()
                    .frame(width:30,height:30,alignment:.center)
                    .padding([.bottom,.trailing],15.0)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct DLHeaderView_Previews:PreviewProvider{
    static var previews:some View{
        DLHeaderView(showSideMenu:.constant(false))
    }
}
