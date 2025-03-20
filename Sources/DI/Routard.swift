//
//  Navigator.swift
//  Routard
//
//  Created by Leo Marcotte on 18/03/2025.
//

import Combine
import SwiftUI

public final class Routard: ObservableObject {

    private let navigationActionSubject = PassthroughSubject<(String, NavigationAction), Never>()
    private let tabBarActionSubject = PassthroughSubject<(String, TabBarAction), Never>()
    private let selectedTabSubject = PassthroughSubject<(String, Int), Never>()
}

// MARK: - Navigation

public extension Routard {

    func observeNavigationWith(id: String) -> AnyPublisher<(NavigationAction), Never> {
        navigationActionSubject
            .filter { $0.0 == id }
            .map { $1 }
            .eraseToAnyPublisher()
    }

    func send(id: String, navigationAction: NavigationAction) {
        navigationActionSubject.send((id, navigationAction))
    }
}

// MARK: - TabBar

public extension Routard {

    func observeTabBarWith(id: String) -> AnyPublisher<(TabBarAction), Never> {
        tabBarActionSubject
            .filter { $0.0 == id }
            .map { $1 }
            .eraseToAnyPublisher()
    }

    func send(id: String, tabBarAction: TabBarAction) {
        tabBarActionSubject.send((id, tabBarAction))
    }
}
