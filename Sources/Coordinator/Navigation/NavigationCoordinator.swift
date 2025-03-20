//
//  NavigationCoordinator.swift
//  Routard
//
//  Created by Leo Marcotte on 17/03/2025.
//

import SwiftUI

public struct NavigationCoordinator: View {

    @Environment(\.dismiss)
    private var dismiss

    private let destination: Destination
    private let viewModel = NavigationCoordinatorViewModel()
    @ObservedObject private var navigationRouter = NavigationRouter()

    public init(destination: Destination) {
        self.destination = destination
    }

    public var body: some View {
        NavigationStack(path: $navigationRouter.navPath) {
            destination.view
                .sheet(item: $navigationRouter.presentedSheet) { identifiable in
                    presentationCallback(identifiable: identifiable)
                }
                .fullScreenCover(item: $navigationRouter.fullScreenSheet) { identifiable in
                    presentationCallback(identifiable: identifiable)
                }
                .navigationDestination(for: Destination.self) { destination in
                    destination.view
                }
        }
        .onChange(of: navigationRouter.shouldDismiss) { newPath in
            dismiss()
        }
        .task {
            viewModel.subscribeForNavigation(navigationRouter: navigationRouter)
        }
        .environment(\.navigationRouterId, navigationRouter.id)
    }

    @ViewBuilder
    private func presentationCallback(identifiable: AnyIdentifiable) -> some View {
        if let destination = identifiable.destination as? Destination {
            NavigationCoordinator(destination: destination)
        }
    }
}
