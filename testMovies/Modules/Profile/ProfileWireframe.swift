//
//  ProfileWireframe.swift
//  testMovies
//
//  Created by Bruno on 9/12/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ProfileWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Profile", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ProfileViewController.self)
        super.init(viewController: moduleViewController)
        
        let presenter = ProfilePresenter(view: moduleViewController, wireframe: self)
        moduleViewController.presenter = presenter
    }
    
    func getViewController() -> UIViewController {
        return self.viewController
    }

}

// MARK: - Extensions -

extension ProfileWireframe: ProfileWireframeInterface {
}
