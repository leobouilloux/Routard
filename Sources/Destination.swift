//
//  Destination.swift
//  LeoUI
//
//  Created by Leo Marcotte on 17/02/2025.
//

import SwiftUI

open class Destination: Equatable, Hashable, @unchecked Sendable, Identifiable {

    public var id: String { name }

    public let name: String
    public var view: AnyView?

    public init(name: String) {
        self.name = name
    }

    // MARK: - Equatable

    public static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
