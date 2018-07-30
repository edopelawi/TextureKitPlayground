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

	// MARK: - Layout

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

		let maximumSize = constrainedSize.max.width / 2
		let pictureFrameSize = CGSize(width: maximumSize, height: maximumSize)
		pictureFrameNode.style.preferredSize = pictureFrameSize

		let textInset = UIEdgeInsets(top: .infinity, left: 12, bottom: 12, right: 12)
		let textInsetSpec = ASInsetLayoutSpec(insets: textInset, child: nameNode)

		let pictureFrameLayoutSpec = ASOverlayLayoutSpec(child: pictureFrameNode, overlay: textInsetSpec)

		return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: pictureFrameLayoutSpec)
	}

	// MARK: - Node configuration

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
