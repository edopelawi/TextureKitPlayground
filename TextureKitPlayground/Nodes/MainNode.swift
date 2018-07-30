//
//  MainNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 12/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit
import AsyncDisplayKit

final class MainNode: ASDisplayNode {

	private let textNode = ASTextNode()

	override init() {
		super.init()

		configureMainNode()
		configureTextNode()

		automaticallyManagesSubnodes = true
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		return makeTextLayout()
	}

	// MARK: - Private methods -

	private func configureMainNode() {
		self.backgroundColor = UIColor.white
	}

	private func configureTextNode() {

		let attributes: [NSAttributedStringKey: Any] = [
			NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16.0)
		]

		textNode.attributedText = NSAttributedString(string: "Hello World!", attributes: attributes)
	}

	private func makeTextLayout() -> ASLayoutSpec {
		return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: textNode)
	}
}
