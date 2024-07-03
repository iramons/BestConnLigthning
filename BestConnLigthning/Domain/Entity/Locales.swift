//
//  Locales.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation

struct Locales: Codable {
    let de, en, es, fr: String?
    let ja, ptBR, ru, zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}

extension Locales {
    /// Retun the default String value
    /// Get value for ptBR if exists else get value for en.
    var `default`: String? { ptBR ?? en }
}
