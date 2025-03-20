//
//  TabBarAction.swift
//  Routard
//
//  Created by Leo Marcotte on 20/03/2025.
//

public enum TabBarAction {
    case changeTab(tag: Int)

    case present(Destination)
    case fullscreen(Destination)
    case dismiss
}
