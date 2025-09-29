//
//  frameworkGridViewModel.swift
//  MVVM Framework
//
//  Created by Miguel Angel Bohorquez on 24/09/25.
//

import SwiftUI



final class FrameworkGridViewModel: ObservableObject { //El observableObject ayuda a que podamos escuchar la interaccion que esta ocurriendo
    var selectedFramework: Framework? {
        didSet {
            
            isShowingDetailView = true
        }
    }
    
    
    @Published var isShowingDetailView = false
}
