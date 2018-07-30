//
//  PhotoOutsetNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 30/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class PhotoOutsetNode: ASDisplayNode {

	private let pictureFrameNode = ASDisplayNode()
	private let outsetNode = ASDisplayNode()
	private let textNode = ASTextNode()

	override init() {
		super.init()

		automaticallyManagesSubnodes = true
		backgroundColor = UIColor.white

		configurePictureFrameNode()
		configureOutsetNode()
		configureTextNode()
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

		let textSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: textNode)
		let outsetSpec = ASOverlayLayoutSpec(child: outsetNode, overlay: textSpec)

		let spec = ASAbsoluteLayoutSpec(children: [ pictureFrameNode, outsetSpec ])
		spec.sizing = .sizeToFit

		return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: spec)
	}

	// MARK: - Private methods

	// MARK: - Configuration -

	private func configurePictureFrameNode() {

		pictureFrameNode.cornerRadius = 5
		pictureFrameNode.backgroundColor = UIColor.red

		pictureFrameNode.style.preferredSize = CGSize(width: 150, height: 150)
		pictureFrameNode.style.layoutPosition = CGPoint(x: 40 / 2.0, y: 40 / 2.0)
	}

	private func configureOutsetNode() {

		outsetNode.cornerRadius = 20
		outsetNode.backgroundColor = UIColor.gray

		outsetNode.style.preferredSize = CGSize(width: 40, height: 40)
		outsetNode.style.layoutPosition = CGPoint(x: 150, y: 0)
	}

	private func configureTextNode() {

		textNode.attributedText = NSAttributedString(
			string: "+",
			attributes: [
				NSAttributedStringKey.font: UIFont.systemFont(ofSize: 32, weight: .semibold),
				NSAttributedStringKey.foregroundColor: UIColor.white
			]
		)
	}
}
