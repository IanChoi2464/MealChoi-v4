import SwiftUI

struct MLStationHeaderView:View{
    var station:String
    var body:some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(height:45)
            Text(station)
                .font(Font.custom("NovaOval",size:25))
        }
    }
}

struct MLStationHeaderView_Previews:PreviewProvider{
    static var previews:some View{
        MLStationHeaderView(station:"Main Line")
    }
}
