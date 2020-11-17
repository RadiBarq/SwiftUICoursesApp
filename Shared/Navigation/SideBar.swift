//
//  SideBar.swift
//  DesignCodeCourse
//
//  Created by RadiBarq on 11/16/20.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("Learn")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button(action: toggleSidebar, label: {
                            Image(systemName: "sidebar.left")
                        })
                    }
                    ToolbarItem(placement: .automatic) {
                        Button(action: {}, label: {
                            Image(systemName: "person.crop.circle")
                        })
                    }
                }
            #endif
            CoursesView()
        }
    }
    var content: some View {
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Livestreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
            
        }
        .listStyle(SidebarListStyle())
    }
    
    #if os(macOS)
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
            .previewDevice("iPhone 11")
    }
}
