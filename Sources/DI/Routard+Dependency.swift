//
//  Navigator+Dependency.swift
//  Routard
//
//  Created by Leo Marcotte on 18/03/2025.
//

private struct RoutardKey: InjectionKey {

    nonisolated(unsafe) static var currentValue: Routard = Routard()
}

extension InjectedValues {

    public var routard: Routard {
        get { Self[RoutardKey.self] }
        set { Self[RoutardKey.self] = newValue }
    }
}
