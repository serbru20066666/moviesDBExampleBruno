//
//  CustomPickerView.swift
//  PickerTest
//
//  Created by Jonathan Zufi on 8/14/20.
//

import SwiftUI

var Categories: [Category] = []
var lastIndex: Int = 0

struct Category: Hashable {
    let id: Int
    var title: String
    var selected: Bool
    
    init (id: Int, title: String, selected: Bool) {
        self.id = id
        self.title = title
        self.selected = selected
    }
}

struct CustomPickerView: View {
    
    @Binding var selectedIndex: Int
    @State private var currentIndex: Int = 0
    @Namespace private var ns
    
    init(selectedIndex: Binding<Int>) {
        _selectedIndex = selectedIndex
        Categories.removeAll()
        Categories.append(Category(id: 0, title: "Popular", selected: true))
        Categories.append(Category(id: 1, title: "Top Rated", selected: false))
        Categories.append(Category(id: 2, title: "Upcoming", selected: false))
        Categories.append(Category(id: 3, title: "Now Playing", selected: false))

    }
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                ScrollViewReader { scrollView in
                    
                    HStack(spacing: 35) {
                        
                        ForEach(Categories, id: \.self) { item in
                            if item.id == currentIndex {
                                ZStack() {
                                    Text(item.title)
                                        .bold()
                                        .layoutPriority(1).foregroundColor(Color.white)
                                    VStack() {
                                        Rectangle().frame(height: 2)
                                            .padding(.top, 25).foregroundColor(Color.white)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: ns)
                                }.frame( height: 50)
                            } else {
                                Text(item.title).foregroundColor(Color.gray)
                                    .onTapGesture {
                                        withAnimation {
                                            currentIndex = item.id
                                            selectedIndex = currentIndex
                                            scrollView.scrollTo(item)
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 20)
                }
            }
        }.background(Color.black)
        .padding()
    }
    
}

struct CustomPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerView(selectedIndex: .constant(0))
    }
}
