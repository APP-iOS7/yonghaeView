//Ver : 0_1_2
//Date : 2025-02-15
//Contents : connect to server and post to FTP server


import Foundation

func returnRequest(urlPath: String = PATH_URL_TESTPOST) -> URLRequest? {
    guard let url = URL(string: urlPath) else { return nil }
    var requset = URLRequest(url: url)
    requset.httpMethod = "POST"
    requset.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return requset
}

func postRequset(request: URLRequest, httpBody: Data?) async throws -> Data? {
    var request = request
    if let httpBody = httpBody {
        request.httpBody = httpBody
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
//            switch response {
//            case 200..<300:
//                return data
//            case 300..<400:
//                print("error : 300..<400")
//            case 400..<500:
//                print("error : 400..<500")
//            default:
//                <#code#>
//            }
            return data
        }
        catch {
            print("Post error : \(error)")
        }
    }
    return nil
}
