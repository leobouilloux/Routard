//
//  TabBarCoordinatorViewModel.swift
//  Routard
//
//  Created by Leo Marcotte on 19/03/2025.
//

import Combine

@MainActor
final class TabBarCoordinatorViewModel {

    @Injected(\.routard)
    private var routard

    private var didSetup = false
    private var cancellables = Set<AnyCancellable>()

    func subscribeForNavigation(tabRouter: TabRouter) {
        guard !didSetup else { return }

        didSetup = true

        routard.observeTabBarWith(id: tabRouter.id)
            .sink { tabBarAction in
                switch tabBarAction {
                    case .changeTab(let tag):
                        tabRouter.selectedTab = tag
                    case .present(let destination):
                        tabRouter.presentSheet(destination: destination)
                    case .fullscreen(let destination):
                        tabRouter.fullScreenSheet(destination: destination)
                    case .dismiss:
                        tabRouter.dismiss()
                }
            }
            .store(in: &cancellables)
    }
}
