//Ver : 0_0_1
//Date : 2025-02-15
//Contents : Copy Image

import AppKit

func copyImageToClipboard(_ image: NSImage?) {
    guard let image = image else {
        print("It is not a Image")
        return
    }
    let pasteboard = NSPasteboard.general
    pasteboard.clearContents()
    if let tiffRepresentation = image.tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) {
        pasteboard.setData(bitmapImage.representation(using: .png, properties: [:])!, forType: .png)
        print("copied to clipboard")
    }
    else {
        print("Image transfer is fail")
    }
}

func imageNameToNSImage(_ imageName: String) -> NSImage? {
    if let imageFilePath = Bundle.main.path(forResource: imageName, ofType: "png") {
        let image = NSImage(contentsOfFile: imageFilePath)
        return image
    }
    else {
        print("Cant Find filePath")
        return nil
    }
}

