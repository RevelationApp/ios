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

extension ResponseSerializable where Response == Any {
    /// `Alamofire.DataRequest.dataResponseSerializer()`
    public var responseSerializer: AnyResponseSerializer<RFResult<Response>> {
        return AnyResponseSerializer<RFResult<Response>>
            .init(dataSerializer: { (request, response, data, error) -> RFResult<Response> in
                Result<Data, RFError>.serialize { try Alamofire.JSONResponseSerializer()
                    .serialize(
                        request: request,
                        response: response,
                        data: data,
                        error: error
                    )
                }
            })
    }
}

extension ResponseSerializable where Response: Decodable {
    /// `Alamofire.DataRequest.dataResponseSerializer()`
    public var responseSerializer: AnyResponseSerializer<RFResult<Response>> {
        return AnyResponseSerializer<RFResult<Response>>
            .init(dataSerializer: { (request, response, data, error) -> RFResult<Response> in
                Result<Data, RFError>.serialize { try Alamofire.DecodableResponseSerializer()
                    .serialize(
                        request: request,
                        response: response,
                        data: data,
                        error: error
                    )
                }
            })
    }
}
