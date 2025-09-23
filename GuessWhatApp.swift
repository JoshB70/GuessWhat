//
//  GuessWhatApp.swift
//  GuessWhat
//
//  Created by Joshua Brown on 9/11/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct GuessWhatApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
   @StateObject private var viewModel = MainViewModel() //Fix
    
    @State private var rootViewID = UUID()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                currentView()
            }.id(rootViewID)
                .onReceive(viewModel.$isAuthenticated){ isAuthenticated in
                    if !isAuthenticated {
                        rootViewID = UUID()
                    }
                }
        
        }
    }
    @ViewBuilder
           private func currentView() -> some View {
               if viewModel.isAuthenticated {
                   UserProfileView(mainViewModel: viewModel)
               } else {
                   AuthView(mainViewModel: viewModel)
               }
        }
}
