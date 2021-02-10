//
//  NetworkService.swift
//  NewWorker
//
//  Created by Vladyslav on 9/2/21.
//

//import Foundation
//
//public enum APIServiceError: Error {
//    case apiError
//    case invalidEndpoint
//    case invalidResponse
//    case noData
//    case decodeError
//}
//
//class NetworkService {
//    private static func getData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//    public static func downloadImage(url: URL, completion: @escaping (Result<Data,APIServiceError>) -> Void) {
//        self.getData(url: url) { data, response, error in
//            if error != nil {
//                completion(.failure(.apiError))
//                return
//            }
//            
//            guard let data = data, error == nil else {
//                return
//            }
//            
//            DispatchQueue.main.async() {
//                completion(.success(data))
//            }
//        }
//    }
//}
