import Foundation
import Firebase

class DiningModel:ObservableObject{
    @Published var dinings:[[String:Any]]=[]
    
    init(){
        getData()
    }
    
    func getData(){
        let db=Firestore.firestore()
        db.collection("Columbia University").getDocuments{snapshot,error in
            if(error==nil){
                for doc in snapshot!.documents{
                    DispatchQueue.main.async{self.dinings.append(doc.data())}
                }
            }
        }
    }
}
