//
//  Resolver+Register.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 03/07/24.
//

import Foundation
import Resolver

// MARK: - Resolver + Register

/// Implements the protocol ResolverRegistering to register all necessary services
extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { LightningRemoteRepository() }
            .implements(LightningRepository.self)
            .scope(.application)
    }
}
