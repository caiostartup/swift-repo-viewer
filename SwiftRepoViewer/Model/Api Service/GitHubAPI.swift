// swiftlint:disable force_unwrapping

import Foundation
import Moya

// MARK: - Provider setup

//private func JSONResponseDataFormatter(_ data: Data) -> String {
//    do {
//        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
//        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
//        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
//    } catch {
//        return String(data: data, encoding: .utf8) ?? ""
//    }
//}

let gitHubProvider = MoyaProvider<GitHub>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum GitHub {
    case issues
}

extension GitHub: TargetType {
    public var baseURL: URL { return URL(string: "https://api.github.com")! }
    public var path: String {
        switch self {
        case .issues:
            return "/repos/apple/swift/issues"
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var task: Task {
        switch self {
        case .issues: return .requestPlain
        }
    }
    public var validationType: ValidationType {
        switch self {
        case .issues: return .none
        }
    }
    public var sampleData: Data {
        switch self {
        case .issues:
            return "Get issues.".data(using: String.Encoding.utf8)!
        }
    }
    public var headers: [String: String]? {
        return nil
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}
