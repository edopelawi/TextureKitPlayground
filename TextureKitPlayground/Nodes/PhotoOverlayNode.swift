//
//  PhotoOverlayNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 12/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class PhotoOverlayNode: ASDisplayNode {

	private let pictureFrameNode = ASDisplayNode()
	private let nameNode = ASTextNode()

	override init() {
		super.init()

		automaticallyManagesSubnodes = true

		configureMainNode()
		configureSubnodes()
	}

	// MARK: - Private methods

	// MARK: Node configuration

	private func configureMainNode() {
		self.backgroundColor = UIColor.white
	}

	private func configureSubnodes() {
		configurePictureFrameNode()
		configureNameNode()
	}

	private func configurePictureFrameNode() {
		pictureFrameNode.backgroundColor = UIColor.darkGray
	}

	private func configureNameNode() {

		let attributes: [NSAttributedStringKey: Any] = [
			NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .semibold),
			NSAttributedStringKey.foregroundColor: UIColor.white
		]

		nameNode.attributedText = NSAttributedString(string: "A picture worth a thousand words", attributes: attributes)
	}

	
}
