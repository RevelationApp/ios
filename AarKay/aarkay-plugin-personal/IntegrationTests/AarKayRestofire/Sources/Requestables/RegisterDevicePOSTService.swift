import Foundation
import Restofire
import Alamofire

public struct RegisterDevicePOSTService: Requestable {

    public typealias Response = Any
    public let uuid: UUID = UUID()
    public let path: String?
    public let version: String? = "v3"
    public let method: HTTPMethod = .post
    public var parameters: Any?
    public var queryParameters: [String: Any]?

    public init(id: String, queryParameters: RegisterDeviceQueryModel, parameters: RegisterDeviceRequestModel) {
        self.path = "pa/\(id)"
        self.parameters = parameters.any()
        self.queryParameters = queryParameters.any() as? [String : Any]
    }

}

public struct RegisterDeviceQueryModel: Codable {
    public let id: String

    public init(id: String) {
        self.id = id
    }

}

public struct RegisterDeviceRequestModel: Codable {
    public let _os: String
    public let _os_version: String
    public let app_version: String
    public let dev_id: String
    public let dev_type: String
    public let device_key: String
    public let deviceversion: String

    public init(_os: String, _os_version: String, app_version: String, dev_id: String, dev_type: String, device_key: String, deviceversion: String) {
        self._os = _os
        self._os_version = _os_version
        self.app_version = app_version
        self.dev_id = dev_id
        self.dev_type = dev_type
        self.device_key = device_key
        self.deviceversion = deviceversion
    }

}
