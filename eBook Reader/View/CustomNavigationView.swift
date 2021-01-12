//
//  CustomNavigationView.swift
//  eBook Reader
//
//  Created by Simec Sys Ltd. on 12/1/21.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    var view: AnyView
    
    //onSearch and onCancel Closures
    var onSearch: (String) -> ()
    var onCancel: () -> ()
    
    var title: String
    var largeTitle: Bool
    var placeHolder: String
    
    init(view: AnyView, placeHolder: String? = "Search", largeTitle: Bool? = false, title: String, onSearch: @escaping (String) -> (), onCancel: @escaping () -> ()) {
        self.title = title
        self.largeTitle = largeTitle!
        self.placeHolder = placeHolder!
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let childView = UIHostingController(rootView: view)
        let controller = UINavigationController(rootViewController: childView)
        
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles = largeTitle
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = context.coordinator
        
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        
        return controller
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeHolder
        uiViewController.navigationBar.prefersLargeTitles = largeTitle
    }
    
    //Search Bar Delegate
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.onSearch(searchText)
        }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.parent.onCancel()
        }
    }
}

