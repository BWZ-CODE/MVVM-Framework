//
//  FrameworkGridView.swift
//  MVVM Framework
//
//  Created by Miguel Angel Bohorquez on 22/09/25.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns : [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(MockData.frameworks){ //en la pestaña frameworks hay un struct que se llama Mockdata, ahi hay una variable que se llama frameworks y es la que estamos llamando, ahi estan todos los frameworks que estamos trayendo
                        fw in FrameworkTitleViw(framework: fw)//aca le estoy pasando cada item que tengo en framework y le estoy diciendo que tome la apariencia que definí en FrameworkTitleViw
                            .onTapGesture {
                                viewModel.selectedFramework = fw
                            }
                    }
                }
            }.navigationTitle("🍎 Frameworks")
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    if let fw = viewModel.selectedFramework {
                            frameworkDetailView(
                                framework: fw,
                                isShowingDetail: $viewModel.isShowingDetailView
                            )
                        } else {
                            // Opcional: placeholder si se llega a abrir sin selección
                            Text("No hay framework seleccionado")
                                .padding()
                        }
                }//ese sheet crea una vista para cuando el bool cambia a true, se va a definir en $viewModel, el signo $ es para que pueda traer la info de si es true o false.
                
                
            
        }
        
        
        
        
        
        
    }
}

#Preview {
    FrameworkGridView().preferredColorScheme(.dark)
}

struct FrameworkTitleViw : View {
    let framework : Framework //Este Framework es el que creamos en la pestaña "framework" y que se llama "Framework"

    var body: some View {
        VStack{
            Image(framework.imageName)//Entonces aca llamamos a la variable imageName que está en ese Framework
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.headline)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    }
}
