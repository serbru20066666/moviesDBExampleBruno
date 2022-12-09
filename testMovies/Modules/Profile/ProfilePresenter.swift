//
//  ProfilePresenter.swift
//  testMovies
//
//  Created by Bruno on 9/12/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ProfilePresenter {

    // MARK: - Private properties -

    private let view: ProfileViewInterface
    private let wireframe: ProfileWireframeInterface

    // MARK: - Lifecycle -

    init(view: ProfileViewInterface, wireframe: ProfileWireframeInterface) {
        self.view = view
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ProfilePresenter: ProfilePresenterInterface {
    
    func viewDidLoad() {
        view.setUserName(userName: PreferencesManager.userName)
    }
}
