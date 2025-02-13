//Ver : 0_0_1
//Date : 2025-02-14
//Contents : Manage Json file

import Foundation

struct ImageData : Decodable, Encodable {
    let imageTitle: String
    let imageName: String
    let type: String
}

func loadImageData(jsonFileName: String) -> [ImageData] {
    guard let filePath = Bundle.main.path(forResource: jsonFileName, ofType: "json") else {
        print("Json file \(jsonFileName) not found")
        return []
    }
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        let imageDataList: [ImageData] = try JSONDecoder().decode([ImageData].self, from: data)
        return imageDataList
    }
    catch {
        print("Json \(jsonFileName) file load error : \(error.localizedDescription)")
        return []
    }
}
