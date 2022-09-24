import SwiftUI

struct SMRowView:View{
    var image:String
    var text:String
    var body:some View{
        VStack{
            HStack{
                Image(systemName:image)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width:32,height:32,alignment:.center)
                Text(text)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .font(Font.custom("Montserrat",size:18))
            .foregroundColor(.white)
            .padding([.leading])
            Divider()
        }
    }
}
