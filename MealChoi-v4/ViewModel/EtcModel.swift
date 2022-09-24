import Foundation
import Firebase

class EtcModel:ObservableObject{
    @Published var etc:[[String:Any]]=[]
    
    init(){
        getData()
    }
    
    func getData(){
        let db=Firestore.firestore()
        db.collection("etc").getDocuments{snapshot,error in
            if(error==nil){
                for doc in snapshot!.documents{
                    DispatchQueue.main.async{self.etc.append(doc.data())}
                }
            }
        }
    }
}
