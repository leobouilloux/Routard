//
//  TabBarCoordinator.swift
//  Routard
//
//  Created by Leo Marcotte on 17/03/2025.
//

import SwiftUI

public struct TabBarCoordinator: View {

    @ObservedObject private var tabRouter = TabRouter()

    private let viewModel = TabBarCoordinatorViewModel()
    private let items: [TabBarItem]

    public init(items: [TabBarItem]) {
        self.items = items
    }

    public var body: some View {
        TabView(selection: $tabRouter.selectedTab) {
            ForEach(items) { item in
                NavigationCoordinator(destination: item.destination)
                    .tabItem {
                        Label(item.title, systemImage: item.systemImage)
                    }
                    .tag(item.id)
            }
        }
        .task {
            viewModel.subscribeForNavigation(tabRouter: tabRouter)
        }
        .environment(\.tabRouterId, tabRouter.id)
    }
}
