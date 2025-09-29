//
//  safariView.swift
//  MVVM Framework
//
//  Created by Miguel Angel Bohorquez on 26/09/25.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    let url:URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) ->SFSafariViewController{
            SFSafariViewController(url:url)
        }
    
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
    }

