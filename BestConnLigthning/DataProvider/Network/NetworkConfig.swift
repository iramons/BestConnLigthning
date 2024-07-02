//
//  NetworkConfig.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation
import Moya

struct NetworkConfig {
    static var loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
    static var networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
}

