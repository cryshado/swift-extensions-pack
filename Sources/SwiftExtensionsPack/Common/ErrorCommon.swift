//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 21.03.2023.
//

import Foundation

public protocol ErrorCommonMessage: LocalizedError, Error, Decodable {
    init(_ reason: String)
    static func mess(_ reason: String) -> Self
}

public extension ErrorCommonMessage {
    static func mess(_ reason: String) -> Self {
        Self(reason)
    }
}

public protocol ErrorCommon: ErrorCommonMessage {
    var title: String { get set }
    var reason: String { get set }
    
    init()
    init(reason: String)
    init(_ reason: String)
    init(_ error: Error)
}

public extension ErrorCommon {
    var title: String { "" }
    var reason: String { "" }
    var description: String { "[\(title)] \(reason)" }
    var errorDescription: String? { self.description }
    var failureReason: String? { self.description }
    var recoverySuggestion: String? { self.description }
    var helpAnchor: String? { self.description }
    
    init(_ reason: String) {
        self.init()
        self.reason = reason
    }
    
    init(reason: String) {
        self.init()
        self.reason = reason
    }
    
    init(_ error: Error) {
        self.init()
        self.reason = error.localizedDescription
    }
}

public func makeError<T: ErrorCommonMessage>(_ error: T, _ funcName: String = #function, _ line: Int = #line) -> T {
    let message: String = "\(funcName) line: \(line), error: \(error.localizedDescription)"
    return T.mess(message)
}

public struct SEPCommonError: ErrorCommon {
    public var title: String = "SEPCommonError"
    public var reason: String = ""
    public init() {}
}
