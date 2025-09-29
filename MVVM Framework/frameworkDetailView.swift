//
//  frameworkDetailView.swift
//  MVVM Framework
//
//  Created by Miguel Angel Bohorquez on 23/09/25.
//

import SwiftUI

struct frameworkDetailView: View {
    var framework: Framework
    @State private var appear = false
    @Binding var isShowingDetail: Bool
    @State private var isShowingSafariView = false
    
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button{
                    isShowingDetail = false
                }label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                        .symbolEffect(.rotate, value: appear)
                        .onAppear {
                            DispatchQueue.main.async {               // evita que ocurra “demasiado pronto”
                                appear.toggle()                      // ⟵ ¡esto activa la animación!
                            }
                        }
                }
            }.padding()
            Spacer()
            FrameworkTitleViw(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
                SFButtons(title: "Learn More")
            }
        }.sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: self.framework.urlString)!)
        }
    }
}

#Preview {
    frameworkDetailView(framework: MockData.sampleFramework, isShowingDetail: .constant(false))
}
