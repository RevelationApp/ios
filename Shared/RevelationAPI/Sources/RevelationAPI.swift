//
//  Networking.swift
//  Revelation
//
//  Created by RahulKatariya on 25/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Alamofire
import Foundation
import Restofire

public class RevelationAPI {
    private init() {}

    public static func setup(host: String, apiKey: String, language: String) {
        Restofire.Configuration.default.host = host
        Restofire.Configuration.default.headers = [
            "Content-Type": "application/json"
        ]
        Restofire.Validation.default.acceptableStatusCodes = Array(200 ..< 500)
        Restofire.Configuration.default.queryParameters = [
            "api_key": apiKey,
            "language": language
        ]
    }
}

extension Restofire.ResponseSerializable where Response == Any {
    public var responseSerializer: AnyResponseSerializer<Result<Response>> {
        return AnyResponseSerializer<Result<Response>>
            .init(
                dataSerializer: { (request, response, data, error) -> Result<Response> in
                    Result { try JSONResponseSerializer().serialize(
                        request: request, response: response, data: data, error: error
                    ) }
                }
            )
    }
}

extension Restofire.ResponseSerializable where Response: Decodable {
    public var responseSerializer: AnyResponseSerializer<Result<Response>> {
        return AnyResponseSerializer<Result<Response>>
            .init(
                dataSerializer: { (request, response, data, error) -> Result<Response> in
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseSerializer = DecodableResponseSerializer<Response>(decoder: decoder)
                    return Result { try responseSerializer.serialize(
                        request: request, response: response, data: data, error: error
                    ) }
                }
            )
    }
}
