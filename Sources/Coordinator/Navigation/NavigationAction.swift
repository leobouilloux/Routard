//
//  NavigationAction.swift
//  Routard
//
//  Created by Leo Marcotte on 19/03/2025.
//

public enum NavigationAction {
    case present(Destination)
    case fullscreen(Destination)
    case dismiss

    case push(Destination)
    case pop
    case popToRoot
}
