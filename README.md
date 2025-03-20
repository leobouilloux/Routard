# Routard

## Overview

Routard is a lightweight, flexible navigation library for SwiftUI applications that provides a clean and type-safe way to handle navigation in your iOS apps. It offers a coordinator pattern implementation and dependency injection capabilities to make your navigation code more maintainable and testable.

## Features

- 🎯 Type-safe navigation using SwiftUI
- 🏗️ Coordinator pattern support
- 💉 Built-in dependency injection
- 🔄 Easy-to-use navigation state management
- 📱 iOS 16.0+ support

## Installation

### Swift Package Manager

Add Routard as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/leobouilloux/Routard.git", branch: "main")
]
```

Or add it through Xcode:
1. File > Add Packages
2. Enter the repository URL
3. Select the version you want to use

## Usage

### 1/ Add a new Destination

Let's say we want start with a Homescreen, first let's create a file named `Destination+Home.swift`:
```swift
import SwiftUI

import Routard

public extension Destination {

    static let home = Destination(
        name: "Home", 
        view: AnyView(HomeView())
    )
}
```

### 2/ Initiate the coordinator

#### Navigation
```swift
import SwiftUI

import Routard

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationCoordinator(destination: .home)
        }
    }
}
```

#### TabBar
```swift
import SwiftUI

import Routard

@main
struct YourApp: App {
    let items: [TabBarItem] = [
        TabBarItem(id: 0, title: "Home", destination: .home, systemImage: "house"),
        TabBarItem(id: 1, title: "Settings", destination: .settings, systemImage: "gear"),
        
        ...
    ]

    var body: some Scene {
        WindowGroup {
            TabBarCoordinator(items: items)
        }
    }
}
```
Please note that every tab will be wrapped into a NavigationCoordinator.

### 3/ Navigating

You can choose to navigate from wherever you want.
You'll need to get the according routerId from one of our 2 environment variable depending on what you are willing to perform.

For NavigationCoordinator, you can perform the following actions:
```swift
public enum NavigationAction {
    case present(Destination)
    case fullscreen(Destination)
    case dismiss

    case push(Destination)
    case pop
    case popToRoot
}
```

For TabBarCoordinator, you can perform the following actions:
```swift
public enum TabBarAction {
    case changeTab(tag: Int)

    case present(Destination)
    case fullscreen(Destination)
    case dismiss
}
```

You can have a look here on an implementation, please note that it's fully compatible with MVVM or other architecture, as long as you transfer the routerId values from the view:
```swift
import SwiftUI

import Routard

struct HomeView: View {

    @Environment(\.navigationRouterId)
    private var navigationRouterId

    @Environment(\.tabRouterId)
    private var tabRouterId

    @Injected(\.routard)

    var body: some View {
        VStack {
            Button {
                routard.send(id: navigationRouterId, navigationAction: .push(.settings))
            } label: {
                Text("Navigate to settings")
            }
            /// if you have a tabBar and want to change the active tab:
            Button {
                routard.send(id: tabRouterId, tabBarAction: .changeTab(tag: 1))
            } label: {
                Text("Switch to settings tab")
            }
        }

    }
}
```

## Requirements

- iOS 16.0+
- Swift 6.0+
- Xcode 15.0+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 