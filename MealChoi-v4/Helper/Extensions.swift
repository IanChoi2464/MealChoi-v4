import SwiftUI

extension View{
    func cornerRadius(_ radius:CGFloat,corners:UIRectCorner)->some View{
        clipShape(RoundedCorner(radius:radius,corners:corners))
    }
    
    @ViewBuilder
    func offsetX(completion:@escaping(CGFloat)->())->some View{
        self
            .overlay{
                GeometryReader{proxy in
                    let minX=proxy.frame(in:.global).minX
                    Color.clear
                        .preference(key:OffsetKey.self,value:minX)
                        .onPreferenceChange(OffsetKey.self){value in
                            completion(value)
                        }
                }
            }
    }
}

struct RoundedCorner:Shape{
    var radius:CGFloat = .infinity
    var corners:UIRectCorner = .allCorners
    func path(in rect:CGRect)->Path{
        let path=UIBezierPath(roundedRect:rect,byRoundingCorners:corners,cornerRadii:CGSize(width:radius,height:radius))
        return Path(path.cgPath)
    }
}

struct OffsetKey:PreferenceKey{
    static var defaultValue:CGFloat=0
    static func reduce(value:inout CGFloat,nextValue:()->CGFloat){
        value=nextValue()
    }
}
