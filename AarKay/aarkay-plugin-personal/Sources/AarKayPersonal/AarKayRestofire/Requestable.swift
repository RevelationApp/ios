//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//

import AarKayKit
import AarKayPlugin
import Foundation

public class Requestable: NSObject, Templatable {
    private let datafile: Datafile
    private var model: RequestableModel
    public var generatedfile: Generatedfile

    public required init?(datafile: Datafile, generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.datafile = datafile
        self.model = try contents.decode(type: RequestableModel.self)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

    public static func resource() -> String {
        return #file
    }
}

public class RequestableModel: Codable {
    public var protocols: String?
    public var name: String
    public var configurable: String?
    public var response: String!
    public var method: String!
    public var version: String?
    public var path: String
    public var parameters: Bool!
    public var queryParameters: Bool!
    public var isCollection: Bool!
    public var requestModel: [ArgModel]?
    public var responseModel: [ArgModel]?
    public var subModels: [RFCodableModel]?
    public var queryModel: [ArgModel]?
    public var tests: [RequestableTestModel]?
    public var enums: [RFEnumModel]?
    public var coreDataSync: Bool!

    public var initParams: String {
        /// <aarkay initParams>
        var paramsDict: [[String: String]] = pathParams
        
        if let _ = queryModel {
            paramsDict.append(["queryParameters": name + "QueryModel"])
        } else if let qp = queryParameters, qp {
            paramsDict.append(["queryParameters": "[String: Any]"])
        }
        
        if isCollection {
            paramsDict.append(["parameters": "\(name)RequestModel"])
        } else if let _ = requestModel {
            paramsDict.append(["parameters": "\(name)RequestModel"])
        } else if let p = parameters, p {
            paramsDict.append(["parameters": "Any"])
        }
        
        var paramsArray: [String] = []
        for i in 0..<paramsDict.count {
            paramsArray.append(paramsDict[i].map { "\($0.key): \($0.value)" }.first!)
        }
        let paramsString = paramsArray.joined(separator: ", ")
        return paramsString
        /// </aarkay>
    }

    public var initExecParams: String {
        /// <aarkay initExecParams>
        var paramsDict: [[String: String]] = pathParams
        
        if let _ = queryModel {
            paramsDict.append(["queryParameters": "queryParameters"])
        } else if let qp = queryParameters, qp {
            paramsDict.append(["queryParameters": "queryParameters"])
        }
        
        if isCollection {
            paramsDict.append(["parameters": "parameters"])
        } else if let _ = requestModel {
            paramsDict.append(["parameters": "parameters"])
        } else if let p = parameters, p {
            paramsDict.append(["parameters": "parameters"])
        }
        
        var paramsArray: [String] = []
        for i in 0..<paramsDict.count {
            paramsArray.append(paramsDict[i].map { "\($0.key): \($0.key)" }.first!)
        }
        let paramsString = paramsArray.joined(separator: ", ")
        return paramsString
        /// </aarkay>
    }

    public var testInitParams: [String]? {
        /// <aarkay testInitParams>
        return tests?.map { test in
            var paramsDict: [[String: String]] = pathParams
            let initParamsCount = paramsDict.count
            
            if let _ = queryModel {
                paramsDict.append(["queryParameters": name + "QueryModel"])
            } else if let qp = queryParameters, qp {
                paramsDict.append(["queryParameters": "[String: Any]"])
            }
            
            if isCollection {
                paramsDict.append(["parameters": "\(name)RequestModel"])
            } else if let _ = requestModel {
                paramsDict.append(["parameters": "\(name)RequestModel"])
            } else if let p = parameters, p {
                paramsDict.append(["parameters": "Any"])
            }
            
            var paramsArray: [String] = []
            if let testPathParams = test.testPathParams {
                for i in 0..<initParamsCount {
                    paramsArray.append(paramsDict[i].map { "\($0.key): \"\(testPathParams[i])\"" }.first!)
                }
            }
            if test.testQueryModel != nil {
                paramsArray.append("queryParameters: queryModel")
            }
            if test.testRequestModel != nil {
                paramsArray.append("parameters: requestModel")
            }
            let paramsString = paramsArray.joined(separator: ", ")
            return paramsString
        }
        /// </aarkay>
    }

    public var pathParams: [[String: String]] {
        /// <aarkay pathParams>
        let regex = try! NSRegularExpression(pattern: "\\{(.*?)\\}", options: [.caseInsensitive])
        return regex.matches(in: path, options: [], range: NSMakeRange(0, path.count))
            .map { NSMakeRange($0.range.location+1, $0.range.length-2) }
            .map { String(path[Range($0, in: path)!]) }
            .reduce([]) { var d = $0; d.append([$1: "String"]); return d }
        /// </aarkay>
    }

    public var paramsPath: String? {
        /// <aarkay paramsPath>
        if pathParams.count > 0 {
            return path
                .replacingOccurrences(of: "{", with: "\\(")
                .replacingOccurrences(of: "}", with: ")")
        }
        return nil
        /// </aarkay>
    }

    public var allCodables: [RFCodableModel]? {
        /// <aarkay allCodables>
        var allCodables: [RFCodableModel] = []
        if let queryModel = queryModel {
            allCodables.append(RFCodableModel(name: name + "QueryModel", props: queryModel))
        }
        if let requestModel = requestModel {
            allCodables.append(RFCodableModel(name: name + "RequestModel", props: requestModel))
        }
        if let responseModel = responseModel {
            allCodables.append(RFCodableModel(name: name + "Model", props: responseModel))
        }
        if let subModels = subModels {
            subModels.forEach { allCodables.append($0) }
        }
        guard !allCodables.isEmpty else { return nil }
        return allCodables
        /// </aarkay>
    }

    public var allProtocols: String? {
        /// <aarkay allProtocols>
        if let configurable = configurable, let protocols = protocols {
            return configurable + "Configurable, " + protocols
        } else if let configurable = configurable {
            return configurable + "Configurable"
        } else if let protocols = protocols {
            return protocols
        } else {
            return nil
        }
        /// </aarkay>
    }

    public var allTests: [RequestableTestModel]? {
        /// <aarkay allTests>
        guard let tests = tests else {
            if initParams.isEmpty {
                return [RequestableTestModel()]
            } else {
                return nil
            }
        }
        var allTests: [RequestableTestModel] = []
        for (index, test) in tests.enumerated() {
            test.testInitParams = testInitParams?[index]
            allTests.append(test)
        }
        return allTests
        /// </aarkay>
    }

    private enum CodingKeys: String, CodingKey {
        case protocols
        case name
        case configurable
        case response
        case method
        case version
        case path
        case parameters
        case queryParameters
        case isCollection
        case requestModel
        case responseModel
        case subModels
        case queryModel
        case tests
        case enums
        case coreDataSync
        case initParams
        case initExecParams
        case testInitParams
        case pathParams
        case paramsPath
        case allCodables
        case allProtocols
        case allTests
    }

    public init(name: String, path: String) {
        self.name = name
        self.path = path
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.protocols = try container.decodeIfPresent(String.self, forKey: .protocols)
        self.name = try container.decode(String.self, forKey: .name)
        self.configurable = try container.decodeIfPresent(String.self, forKey: .configurable)
        self.response = try container.decodeIfPresent(String.self, forKey: .response) ?? "Any"
        self.method = try container.decodeIfPresent(String.self, forKey: .method) ?? "get"
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
        self.path = try container.decode(String.self, forKey: .path)
        self.parameters = try container.decodeIfPresent(Bool.self, forKey: .parameters) ?? false
        self.queryParameters = try container.decodeIfPresent(Bool.self, forKey: .queryParameters) ?? false
        self.isCollection = try container.decodeIfPresent(Bool.self, forKey: .isCollection) ?? false
        self.requestModel = try container.decodeIfPresent([ArgModel].self, forKey: .requestModel)
        self.responseModel = try container.decodeIfPresent([ArgModel].self, forKey: .responseModel)
        self.subModels = try container.decodeIfPresent([RFCodableModel].self, forKey: .subModels)
        self.queryModel = try container.decodeIfPresent([ArgModel].self, forKey: .queryModel)
        self.tests = try container.decodeIfPresent([RequestableTestModel].self, forKey: .tests)
        self.enums = try container.decodeIfPresent([RFEnumModel].self, forKey: .enums)
        self.coreDataSync = try container.decodeIfPresent(Bool.self, forKey: .coreDataSync) ?? false
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(protocols, forKey: .protocols)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(configurable, forKey: .configurable)
        try container.encode(response, forKey: .response)
        try container.encode(method, forKey: .method)
        try container.encodeIfPresent(version, forKey: .version)
        try container.encode(path, forKey: .path)
        try container.encode(parameters, forKey: .parameters)
        try container.encode(queryParameters, forKey: .queryParameters)
        try container.encode(isCollection, forKey: .isCollection)
        try container.encodeIfPresent(requestModel, forKey: .requestModel)
        try container.encodeIfPresent(responseModel, forKey: .responseModel)
        try container.encodeIfPresent(subModels, forKey: .subModels)
        try container.encodeIfPresent(queryModel, forKey: .queryModel)
        try container.encodeIfPresent(tests, forKey: .tests)
        try container.encodeIfPresent(enums, forKey: .enums)
        try container.encode(coreDataSync, forKey: .coreDataSync)
        try container.encode(initParams, forKey: .initParams)
        try container.encode(initExecParams, forKey: .initExecParams)
        try container.encodeIfPresent(testInitParams, forKey: .testInitParams)
        try container.encode(pathParams, forKey: .pathParams)
        try container.encodeIfPresent(paramsPath, forKey: .paramsPath)
        try container.encodeIfPresent(allCodables, forKey: .allCodables)
        try container.encodeIfPresent(allProtocols, forKey: .allProtocols)
        try container.encodeIfPresent(allTests, forKey: .allTests)
    }
}

/// MARK:- AarKayEnd
extension Requestable {
    
    public func rk_filename() -> String {
        return "\(model.name)\(model.method.uppercased())Service"
    }
    
    public func generatedfiles() -> [Generatedfile] {
        var generatedFiles: [Generatedfile] = []
        
        var sourceFile = rk_generatedfile()
        sourceFile.directory = "Sources/Requestables"
        if let configurable = model.configurable {
            sourceFile.directory = (sourceFile.directory ?? "") +  "/\(configurable)"
        }
        generatedFiles.append(sourceFile)
        
        if model.coreDataSync {
            var cdFile = rk_generatedfile()
            cdFile.template = "CoreDataSync"
            cdFile.name = "CD\(model.name)Sync"
            cdFile.directory = "Sources/Sync"
            if let coreDataDir = datafile.globalContext?["coreDataSyncDir"] as? String {
                cdFile.directory = coreDataDir + "/Sync"
            }
            generatedFiles.append(cdFile)
        }
        
        if model.allTests != nil {
            var specFile = rk_generatedfile()
            specFile.template = "RequestableSpec"
            specFile.name += "Spec"
            specFile.directory = "Tests/Requestables"
            if let configurable = model.configurable {
                specFile.directory = (specFile.directory ?? "") + "/\(configurable)"
            }
            generatedFiles.append(specFile)
        }
        
        return generatedFiles
    }
    
}
