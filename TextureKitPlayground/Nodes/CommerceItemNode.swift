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

	override init() {
		super.init()

		automaticallyManagesSubnodes = true

		configureButtonNode()
		configureFirstPhotoNode()
		configureSecondPhotoNode()
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

		let photoSpec = ASWrapperLayoutSpec(layoutElements: [firstPhotoNode, secondPhotoNode])
		photoSpec.style.preferredSize = CGSize(width: 200, height: 200)

		buttonNode.style.preferredSize = CGSize(width: 200, height: 100)

		let wrapperSpec = ASStackLayoutSpec(
			direction: .vertical,
			spacing: 10.0,
			justifyContent: .center,
			alignItems: .center,
			children: [ photoSpec, buttonNode ]
		)

		return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: wrapperSpec)
	}

	// MARK: - Private methods -

	// MAKR: - Configuration -

	private func configureButtonNode() {

		let title = NSAttributedString(
			string: "Swap.",
			attributes: [
				NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24, weight: .semibold),
				NSAttributedStringKey.foregroundColor: UIColor.white
			]
		)

		buttonNode.setAttributedTitle(title, for: .normal)
		buttonNode.backgroundColor = UIColor.cyan
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

}
