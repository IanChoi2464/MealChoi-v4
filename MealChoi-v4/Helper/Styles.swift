import Foundation
import SwiftUI

struct OnBoardingButtonStyle:ButtonStyle{
    func makeBody(configuration:Configuration)->some View{
        configuration.label
            .padding()
            .foregroundColor(Color.white)
            .overlay(
                Capsule(style:.continuous)
                    .stroke(Color.white,lineWidth:3)
            )
            .frame(maxWidth:.infinity,alignment:.trailing)
    }
}
