//Ver : 0_0_1
//Date : 2025-02-15
//Contents : Main View

import SwiftUI
import SwiftData

struct ImageDataID : Decodable, Encodable,Identifiable {
    let id: UUID
    let imageTitle: String
    let imageName: String
    let type: String
    
    init(id: UUID, imageTitle: String, imageName: String, type: String) {
        self.id = id
        self.imageTitle = imageTitle
        self.imageName = imageName
        self.type = type
    }
}

struct MainView: View {
    @AppStorage("isFloating") var isFloating: Bool = false
//    @Environment(\.isFloating) var sceneIsFloating: Bool
    @Environment(\.modelContext) private var modelContext
    @Query private var config: [ConfigData]
    
    @State private var imageDataList: [ImageDataID] = []

    var body: some View {
        NavigationStack {
            VStack {
                ForEachView
            }
            .onAppear() {
                imageDataList = ImageDataToImageDataID(getImageDataToJsonfile(jsonFileName: "ImageInformationData"))
            }
        }
        .navigationTitle(Text("YongHae Quotation"))
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Toggle(isOn: $isFloating) {
                    Image(systemName: isFloating ? "circle.fill" : "circle")
                    Text("Window Level Floating")
                }
            }
        }
    }
    
    
    private var ForEachView: some View {
        List {
            ForEach(imageDataList) { data in
                Button(action: {
                    let NSImageName = imageNameToNSImage(data.imageName)
                    copyImageToClipboard(NSImageName)
                }, label: {
                    Text(data.imageTitle)
                        .frame(maxWidth: .infinity,minHeight: 30, alignment: .center)
                })
            }
        }
    }
    
    func ImageDataToImageDataID(_ imageData: [ImageData]) -> [ImageDataID] {
        var willReturnList: [ImageDataID] = []
        for i in imageData {
            let data = ImageDataID(
                id: UUID(),
                imageTitle: i.imageTitle,
                imageName: i.imageName,
                type: i.type)
            willReturnList.append(data)
        }
        return willReturnList
    }
}

#Preview {
    MainView()
}
