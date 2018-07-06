//
//  ViewController.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 03/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit
import AsyncDisplayKit

final class ViewController: ASViewController <ASDisplayNode> {


	init() {
		super.init(node: ASDisplayNode())
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.node.backgroundColor = UIColor.blue
		
	}
}

