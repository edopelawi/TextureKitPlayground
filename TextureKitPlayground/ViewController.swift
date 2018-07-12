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
		configureSubnodes()
	}

	private func configureSubnodes() {

		let textNode = createLabelNode()
		self.node.addSubnode(textNode)
	}

	private func createLabelNode() -> ASTextNode {

		defer {
			dismiss(animated: true, completion: nil)
		}

		let attrs = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 12.0)]
		let string = NSAttributedString(string: "Hey, here's some text.", attributes: attrs)

		let node = ASTextNode()
		node.attributedText = string

		return node
	}

}

