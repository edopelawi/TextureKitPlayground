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

	private let mainNode = SVGImageNode()

	init() {
		super.init(node: mainNode)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		mainNode.backgroundColor = UIColor.white
		mainNode.configureFor(urlString: "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/adobe.svg")
	}
}
