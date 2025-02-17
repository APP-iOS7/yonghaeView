//Ver : 0_1_2
//Date : 2025-02-15
//Contents : Manage Json file

import Foundation

struct ImageData : Decodable, Encodable {
    let imageTitle: String
    let imageName: String
    let type: String
    
    init(imageTitle: String, imageName: String, type: String) {
        self.imageTitle = imageTitle
        self.imageName = imageName
        self.type = type
    }
}

func getImageDataToJsonfile(jsonFileName: String) -> [ImageData] {
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

func encodeImageDataToJsonstring(imageDataList: [ImageData]) -> [String] {
    do {
        var encodedListData: [String] = []
        for i in imageDataList {
            let encodedata = try JSONEncoder().encode(i)
            let jsonString = String(data: encodedata, encoding: .utf8) ?? ""
            encodedListData.append(jsonString)
        }
        return encodedListData
    }
    catch {
        print("encoding Json format error : \(error.localizedDescription)")
        return []
    }
}

func decodeJsonstringToImageData(stringList: [String]) -> [ImageData] {
    var imageDataList = [ImageData]()
    
    for i in stringList {
        if let data = i.data(using: .utf8) {
            do {
                let decodeData: ImageData = try JSONDecoder().decode(ImageData.self, from: data)
                imageDataList.append(decodeData)
            }
            catch {
                print("decoding Json format error : \(error.localizedDescription)")
            }
        }
    }
    
    return imageDataList
}
