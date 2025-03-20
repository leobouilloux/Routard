//
//  TabRouter.swift
//  LeoUI
//
//  Created by Leo Marcotte on 28/10/2024.
//

import Foundation
import SwiftUI

public final class TabRouter: ObservableObject {

    public let id = UUID().uuidString

    @Published public var selectedTab: Int?

    @Published public var presentedSheet: AnyIdentifiable?
    @Published public var fullScreenSheet: AnyIdentifiable?
    @Published public var shouldDismiss: Bool = false

    public init() {}

    public func presentSheet(destination: any Identifiable) {
        presentedSheet = AnyIdentifiable(destination: destination)
    }

    public func fullScreenSheet(destination: any Identifiable) {
        fullScreenSheet = AnyIdentifiable(destination: destination)
    }

    public func dismiss() {
        shouldDismiss = true
    }
}
