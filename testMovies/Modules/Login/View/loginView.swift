//
//  ContentView.swift
//  testMovies
//
//  Created by Bruno Cardenas on 24/02/21.
//

import SwiftUI

struct loginView: View {
    
    @ObservedObject var vm = loginViewModel()
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ZStack()
                {
                    Image("background").resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .center, spacing: 0, content: {
                        
                        HStack()
                        {
                            Spacer()
                            VStack(alignment: .leading, spacing: 0, content: {
                                Text("THE").font(.system(size: 26, weight: .heavy, design: .default)).foregroundColor(Constants.greenApp).padding(.leading,10).padding(.trailing,10)
                                Text("MOVIE").font(.system(size: 26, weight: .heavy, design: .default)).foregroundColor(Constants.greenApp).padding(.top,2).padding(.leading,10).padding(.trailing,10)
                                Text("DB by Bruno").font(.system(size: 26, weight: .heavy, design: .default)).foregroundColor(Constants.greenApp).padding(.top,2).padding(.leading,10).padding(.trailing,10)
                                
                            }).padding().overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Constants.greenApp, lineWidth: 4)
                            )
                            Spacer()
                        }.padding(.bottom, 30)
                        
                        TextField("Username", text: $vm.userName)
                            .textFieldStyle(OvalTextFieldStyle()).frame(width: 250, height: 90, alignment: .center)
                        
                        SecureField("Password", text: $vm.password).textFieldStyle(OvalTextFieldStyle()).frame(width: 250, height: 90, alignment: .center)
                        Button("Log in", action: self.vm.wsLogin).frame(width: 250, height: 60, alignment: .center).background(Constants.greenApp).cornerRadius(15).font(.body).foregroundColor(.white).padding(.top, 10).alert(isPresented: self.$vm.mostrarAlerta) {
                            Alert(title: Text(Constants.nameApp), message: Text(self.vm.msgError), dismissButton: .default(Text("Ok")){
                                
                                
                                
                            })
                        }
                        // Spacer()
                    })
                    .navigationBarHidden(true)
                    NavigationLink("", destination: home().navigationBarBackButtonHidden(true), isActive: self.$vm.goToHome)
                    
                }
            }
            
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            loginView()
            loginView()
                .previewDevice("iPhone 8 Plus")
            loginView()
                .previewDevice("iPhone 8")
        }
    }
}

