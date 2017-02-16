//
//  Serialization.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import Alamofire


protocol LocalObjectSerializable {
    init?(dictionary: [String: Any])
    var dictionaryValue: [String: Any] { get }
}

protocol ResponseObjectSerializableType {}

protocol ResponseObjectSerializable: ResponseObjectSerializableType {
    init?(response: HTTPURLResponse, representation: Any)
}

extension DataRequest {
    @discardableResult
    func responseObject<T: ResponseObjectSerializable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
            // TODO: HANDLE ERROR
            
            let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonResponseSerializer.serializeResponse(request, response, data, nil)
            
            //TODO: Weird crash here - getting a failure from the server?
            print("url: \(response?.url?.absoluteString)")
            guard case let .success(jsonObject) = result else {
                fatalError("CRASH ON SERIALIZING")
            }
            
            let responseObject = T(response: response!, representation: jsonObject)!
            return .success(responseObject)
        }
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}

protocol ResponseCollectionSerializable {
    static func collection(from response: HTTPURLResponse, withRepresentation: Any) -> [Self]
}

extension ResponseCollectionSerializable where Self: ResponseObjectSerializable {
    static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Self] {
        var collection: [Self] = []
        if let representation = representation as? [[String: Any]] {
            for itemRepresentation in representation {
                if let item = Self(response: response, representation: itemRepresentation) {
                    collection.append(item)
                }
            }
        }
        return collection
    }
}

extension DataRequest {
    @discardableResult
    func responseCollection<T: ResponseCollectionSerializable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self
    {
        let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
            //gotta handle errors
            //guard error == nil else { return .failure(BackendError.network(error: error!)) }
            let jsonSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                //return .failure(BackendError.jsonSerialization(error: result.error!))
                fatalError("CRASH ON SERIALIZING")
            }
            // guard let response = response else {
            //   let reason = "Response collection could not be serialized due to nil response."
            // return .failure(BackendError.objectSerialization(reason: reason))
            //}
            return .success(T.collection(from: response!, withRepresentation: jsonObject))
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
