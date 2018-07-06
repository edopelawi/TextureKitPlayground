//
//  AppDelegate.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 03/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		let applicationFrame = UIScreen.main.bounds

		let mainWindow = UIWindow(frame: applicationFrame)	

		mainWindow.rootViewController = UIViewController()
		mainWindow.makeKeyAndVisible()

		return true
	}

}

