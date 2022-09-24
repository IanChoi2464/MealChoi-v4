import Foundation

class Services{
    static func getDate_str(date:Date,format:String)->String{
        let dateFormatter=DateFormatter()
        dateFormatter.dateFormat=format
        return dateFormatter.string(from:date)
    }
    
    static func getDate_date(date:String,format:String)->Date{
        let dateFormatter=DateFormatter()
        dateFormatter.dateFormat=format
        dateFormatter.timeZone=TimeZone.current
        dateFormatter.locale=Locale.current
        return dateFormatter.date(from:date)!
    }
    
    static func isOpen(openHours:[String])->Bool{
        for oh in openHours{
            if(oh=="Closed Today"){return false}
            let now_str=getDate_str(date:Date(),format:"h:mma")
            let now_date=getDate_date(date:now_str,format:"h:mma")
            let t=oh.firstIndex(of:" ")!
            let a=getDate_date(date:String(oh[...t]),format:"h:mma ")
            let b=getDate_date(date:String(oh[t...]),format:" - h:mma")
            if(now_date>=a&&now_date<b){
                return true
            }
        }
        return false
    }
    
    static func getMealTime(numOfMeals:Int)->String{
        let now=atoi(getDate_str(date:Date(),format:"Hmm"))
        if(numOfMeals==1){
            return "Daily"
        }
        else if(numOfMeals==2){
            if(now>1500&&now<2359){
                return "Dinner"
            }
            return "Brunch"
        }
        else{
            if(now>1100&&now<=1500){
                return "Lunch"
            }
            else if(now>1500&&now<2359){
                return "Dinner"
            }
            return "Breakfast"
        }
    }
    
    static func getHeight(a:Bool,b:Bool,c:Bool,d:Bool)->CGFloat{
        var count:CGFloat=0
        if(a){count+=1}
        if(b){count+=1}
        if(c){count+=1}
        if(d){count+=1}
        return 130+35*count
    }
}
