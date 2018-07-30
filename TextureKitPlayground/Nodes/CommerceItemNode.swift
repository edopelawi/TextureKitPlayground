//
//  CommerceItemNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 26/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class CommerceItemNode: ASDisplayNode {

	private let buttonNode = ASButtonNode()
	private let firstPhotoNode = ASDisplayNode()
	private let secondPhotoNode = ASDisplayNode()

	private let contentWrapperNode = ASDisplayNode()

	override init() {
		super.init()

		automaticallyManagesSubnodes = true
		backgroundColor = UIColor.white

		configureButtonNode()
		configureFirstPhotoNode()
		configureSecondPhotoNode()

		configureContentWrapperNode()
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

		let contentSpec = makeContentSpec()
		let wrapperSpec = ASBackgroundLayoutSpec(child: contentSpec, background: contentWrapperNode)

		return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: wrapperSpec)
	}

	// MARK: - Private methods -

	// MARK: - Layout -

	private func makeContentSpec() -> ASLayoutSpec {

		let wrapperSize = contentWrapperNode.style.preferredSize
		let contentMargin = contentWrapperNode.borderWidth * 2.5

		let contentWidth = wrapperSize.width - (contentMargin * 2)
		let contentHeight = wrapperSize.height - (contentMargin * 2)

		let photoSpec = ASWrapperLayoutSpec(layoutElements: [ firstPhotoNode, secondPhotoNode ])
		photoSpec.style.preferredSize = CGSize(width: contentWidth, height: contentHeight * 0.8)

		buttonNode.style.preferredSize = CGSize(width: contentWidth, height: contentHeight * 0.2)

		let contentSpec = ASStackLayoutSpec(
			direction: .vertical,
			spacing: contentMargin,
			justifyContent: .center,
			alignItems: .center,
			children: [ photoSpec, buttonNode ]
		)

		let insets = UIEdgeInsets(top: contentMargin, left: contentMargin, bottom: contentMargin, right: contentMargin)

		return ASInsetLayoutSpec(insets: insets, child: contentSpec)
	}

	// MARK: - Configuration -

	private func configureButtonNode() {

		let title = NSAttributedString(
			string: "Swap.",
			attributes: [
				NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24, weight: .semibold),
				NSAttributedStringKey.foregroundColor: UIColor.white
			]
		)

		buttonNode.setAttributedTitle(title, for: .normal)
		buttonNode.backgroundColor = UIColor.blue

		buttonNode.addTarget(self, action: #selector(swapActivePhoto), forControlEvents: .touchUpInside)
	}

	@objc private func swapActivePhoto() {

		firstPhotoNode.isHidden = !firstPhotoNode.isHidden
		secondPhotoNode.isHidden = !secondPhotoNode.isHidden
	}

	private func configureFirstPhotoNode() {
		firstPhotoNode.backgroundColor = UIColor.orange
		firstPhotoNode.isHidden = false
	}

	private func configureSecondPhotoNode() {
		secondPhotoNode.backgroundColor = UIColor.purple
		secondPhotoNode.isHidden = true
	}

	private func configureContentWrapperNode() {
		contentWrapperNode.borderWidth = 8.0
		contentWrapperNode.borderColor = UIColor.darkGray.cgColor

		contentWrapperNode.style.preferredSize = CGSize(width: 250, height: 350)
	}
}
