//
//  LightningEndpoint.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation
import Moya

enum LightningEndpoint {
    case rankingsByConnectivity
}

extension LightningEndpoint: TargetType {

    var baseURL: URL { .init(string: "https://mempool.space/api")! }

    var path: String {
        switch self {
        case .rankingsByConnectivity:
            return "v1/lightning/nodes/rankings/connectivity"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .rankingsByConnectivity:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .rankingsByConnectivity:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .rankingsByConnectivity:
            return nil
        }
    }
}
