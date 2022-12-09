//
//  home.swift
//  testMovies
//
//  Created by Bruno Cardenas on 26/02/21.
//

import SwiftUI

struct home: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ObservedObject var vm = homeViewModel()
    @State private var showingOptions = false
    @State private var showScreen: Bool = false
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer(minLength: 50)
                ZStack {
                    Text("TV SHOWS").bold().font(.title2).foregroundColor(.white)
                    HStack {
                        Button(action: {
                            showingOptions = true
                            
                        }) {
                            HStack(alignment: .center, spacing: 5.0) {
                                Image("menuIcon")
                            }
                        }
                        .cornerRadius(5.0)
                        .actionSheet(isPresented: $showingOptions) {
                            ActionSheet(
                                title: Text("What do you want to do?"),
                                buttons: [
                                    .default(Text("View Profile")) {
                                        showScreen = true
                                    },
                                    
                                        .default(Text("Logout")) {
                                        },
                                    .cancel()
                                ]
                            )
                        }.sheet(isPresented: $showScreen, content: {
                            ProfileViewSwiftUIRepresentable()
                        })
                        Spacer()
                    }
                    
                    
                }
                CustomPickerView(selectedIndex: self.$vm.selectedIndexCategories)
                    .background(Rectangle().fill(Color.clear))
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.vm.movies ?? [], id: \.id) { value in
                        movieCard(movie: value)
                    }
                }
            }.background(Color.black)

                .navigationBarHidden(true)
                .edgesIgnoringSafeArea([.top, .bottom])
            
        }
        
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}


struct ProfileViewSwiftUIRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        ProfileWireframe().getViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
