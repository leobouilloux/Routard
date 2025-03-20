//
//  Destination.swift
//  LeoUI
//
//  Created by Leo Marcotte on 17/02/2025.
//

import SwiftUI

public struct Destination: Equatable, Hashable, @unchecked Sendable, Identifiable {

    public var id: String { name }

    public let name: String
    public let view: AnyView

    public init(name: String, view: AnyView) {
        self.name = name
        self.view = view
    }

    public static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
