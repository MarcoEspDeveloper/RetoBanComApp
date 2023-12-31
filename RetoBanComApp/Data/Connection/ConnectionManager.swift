//
//  ConnectionManager.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation
import Alamofire

class ConnectionManager: ConnectionManagerProtocol {
    
    func getUsersList(handler: @escaping ([UserResponse]?, NSError?) -> Void) {
        
        let url = "\(Constants.ConnectionUrl.baseUrl)\(Constants.ConnectionUrl.usersUrl)"
            
        AF.session.configuration.timeoutIntervalForRequest = 10

        AF.request(url).validate().responseDecodable(of: [UserResponse].self) { (response) in
            
            switch response.result {
            case .success(let value):
                handler(value, nil)
            case .failure(let error):
                
                var errorCode = 0
                
                if let underlyingError = error.asAFError?.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            errorCode = urlError.code.rawValue
                            print("TIMED OUT ERROR")
                        case .notConnectedToInternet:
                            errorCode = urlError.code.rawValue
                            print("INTERNET ERROR")
                        default:
                            //Do something
                            errorCode = urlError.code.rawValue
                        }
                    }
                }
                
                let newError = NSError(domain: url, code: (errorCode), userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                    
                handler(nil, newError)
            }
        }
    }
    
    func getUserPostsList(userId: Int64, handler: @escaping ([UserPostResponse]?, NSError?) -> Void) {
        
        let url = "\(Constants.ConnectionUrl.baseUrl)\(Constants.ConnectionUrl.usersUrl)/\(userId)\(Constants.ConnectionUrl.postsUrl)"
            
        AF.session.configuration.timeoutIntervalForRequest = 10

        AF.request(url).validate().responseDecodable(of: [UserPostResponse].self) { (response) in
            
            switch response.result {
            case .success(let value):
                handler(value, nil)
            case .failure(let error):
                
                var errorCode = 0
                
                if let underlyingError = error.asAFError?.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            errorCode = urlError.code.rawValue
                            print("TIMED OUT ERROR")
                        case .notConnectedToInternet:
                            errorCode = urlError.code.rawValue
                            print("INTERNET ERROR")
                        default:
                            //Do something
                            errorCode = urlError.code.rawValue
                        }
                    }
                }
                
                let newError = NSError(domain: url, code: (errorCode), userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                    
                handler(nil, newError)
            }
        }
    }
    
    func postCreateUserPost(userId: Int64, postTitle: String, postDescription: String, handler: @escaping (UserPostResponse?, NSError?) -> Void) {
        
        let url = "\(Constants.ConnectionUrl.baseUrl)\(Constants.ConnectionUrl.postsUrl)"
        
        /*let params: [String: Any] = [
                "title": postTitle,
                "body": postDescription,
                "userId": userId
        ]*/
        
        let params = UserPostRequest(title: postTitle, body: postDescription, userId: userId)
            
        AF.session.configuration.timeoutIntervalForRequest = 10
        
        AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default).validate().responseDecodable(of: UserPostResponse.self) { (response) in
            
            switch response.result {
            case .success(let value):
                handler(value, nil)
            case .failure(let error):
                
                var errorCode = 0
                
                if let underlyingError = error.asAFError?.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            errorCode = urlError.code.rawValue
                            print("TIMED OUT ERROR")
                        case .notConnectedToInternet:
                            errorCode = urlError.code.rawValue
                            print("INTERNET ERROR")
                        default:
                            //Do something
                            errorCode = urlError.code.rawValue
                        }
                    }
                }
                
                let newError = NSError(domain: url, code: (errorCode), userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                    
                handler(nil, newError)
            }
        }
    }
}
