//
//  GenericResponseModel.swift
//  Revelation
//
//  Created by RahulKatariya on 25/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation

public enum ResultResponseModel<Success: Codable>: Decodable {
    case success(Success)
    case failure(FailureResponseModel)

    public init(from decoder: Decoder) throws {
        do {
            let success = try Success(from: decoder)
            self = .success(success)
        } catch {
            guard let failure = try? FailureResponseModel(from: decoder) else {
                throw error
            }
            self = .failure(failure)
        }
    }

    public var value: Success? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let result):
            let userInfo = ["statusMessage": result.statusMessage]
            let error = NSError(
                domain: "API",
                code: result.statusCode,
                userInfo: userInfo
            )
            return error
        }
    }
}
