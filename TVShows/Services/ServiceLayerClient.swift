//
//  ServiceLayerClient.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation
//Generic network layer
class ServiceLayerClient {

    enum ServiceError: Error {
        case notValid
        case networkError
        case malformedJSON
        case unknown
        case badInput
        case notFound
        case url
    }

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }

    func createDataTask<OutputModel: Decodable, InputModel:Encodable>(path: String, parameter: InputModel, httpMethod: HTTPMethod = .get, completion: @escaping (Result<OutputModel, ServiceError>) -> Void) {
        let baseURL = URL(string: Endpoint.baseURL.path)!.appendingPathComponent(path)
        guard let url = createURL(url: baseURL, parameter: parameter, httpMethod: httpMethod) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue

        URLSession.shared.dataTask(with: request) { [unowned self ] (data: Data?, response: URLResponse?, error: Error?) in
            let result: Result<OutputModel, ServiceError> = self.mapToResultType(data, response: response, error: error)
            // move the response from background to main thread
            DispatchQueue.main.async {
                completion(result)
            }
    
        }.resume()
    }
    
    private func createURL(url: URL, parameter: Encodable, httpMethod: HTTPMethod) -> URL? {
        
        let requestURL: URL

        switch httpMethod {
        case .get:
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = parameter.asQueryItems
            requestURL = components?.url ?? url
            return requestURL
        default:
            //add support to create request body for POST AND PUT call
            print("Post call support needed")
        }
        
        return nil
    }

    private func mapToResultType<A>(_ data: Data?, response: URLResponse?, error: Error?) -> Result<A, ServiceError> where A: Decodable {

        guard let httpResponse = response as? HTTPURLResponse, let data = data else {
            return .failure(ServiceError.unknown)
        }

        switch httpResponse.statusCode {
        case 200 ..< 300:
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                //decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601DateFormatter)
                let data = try decoder.decode(A.self, from: data)
                return .success(data)
            } catch (let error){
                print("error for url: \(String(describing: response?.url?.absoluteString)) and error: \(error)")
                return .failure(ServiceError.malformedJSON)
            }
        default:
            return mapErrorResponse(httpResponse)
        }
    }

    private func mapErrorResponse<A>(_ response:HTTPURLResponse) -> Result<A, ServiceError> where A: Decodable {

        print("error for url: \(String(describing: response.url?.absoluteString))")
        
        switch response.statusCode {
        case 400:
            return .failure(ServiceError.badInput)
        case 404:
            return .failure(ServiceError.notFound)
        default:
            print(response.statusCode)
            return .failure(ServiceError.unknown)
        }
    }
}


