import UIKit

protocol SearchResultModel {
    var name: String { get }
    var address: String { get }
}

protocol SearchAPIProtocol {
    func searchFood(_ text: String) -> [SearchResultModel]
}

class SearchTool {
    
    let searchAPIs: [SearchAPIProtocol]
    
    init() {
        searchAPIs = [AppleSearchAPI()]
    }
    
    func search(_ text: String) -> [SearchResultModel]{
        var results = [SearchResultModel]()
        for api in searchAPIs {
            results += api.searchFood(text)
        }
        return results
    }
}

struct AppleSearchResultModel: SearchResultModel{
    var name: String
    var address: String
}

class AppleSearchAPI: SearchAPIProtocol {
    func searchFood(_ text: String) -> [SearchResultModel]{
        return [AppleSearchResultModel(name: "TKK", address: "新埔"),
                AppleSearchResultModel(name: "KFC", address: "板橋")]
    }
}


struct GoogleSearchResultModel {
    var goName: String
    var goAddress: String
}

class GoogleSearchAPI {
    
    func searchStore(_ text: String) -> [GoogleSearchResultModel]{
        return [GoogleSearchResultModel(goName: "pizza Hut", goAddress: "龍山寺"),
                GoogleSearchResultModel(goName: "拿玻里", goAddress: "江子翠")]
    }
}
