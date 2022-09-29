import SwiftUI

struct MDIconView:View{
    var icon:String
    var body:some View{
        HStack{
            Image(icon)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width:35,height:35,alignment:.center)
            Text(icon)
        }
        .font(Font.custom("Montserrat",size:18))
    }
}
