//
//  EnhancedNetworkImageNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 30/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import AsyncDisplayKit

/**
The enhanced version of ASNetworkImageNode. This class allows rendering URLs that contains SVG, too.
*/
final class EnhancedNetworkImageNode: ASDisplayNode {

	private let imageNode = ASNetworkImageNode()
	private let svgNode = SVGImageNode()

	// MARK: - Public methods -

	override init() {
		super.init()
		automaticallyManagesSubnodes = true
		configureSubnodes()
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		return ASWrapperLayoutSpec(layoutElements: [ imageNode, svgNode ])
	}

	/**
	Configures this instance to display passed URL string.
	*/
	func configure(for urlString: String) {

		guard let lastPath = urlString.split(separator: Character("/")).last else {
			return
		}

		let isSVGFile = lastPath.contains(".svg")

		if isSVGFile {
			svgNode.configureFor(urlString: urlString)
		} else {
			imageNode.setURL(URL(string: urlString), resetToDefault: true)
		}

		imageNode.isHidden = isSVGFile
		svgNode.isHidden = !isSVGFile
	}

	// MARK: - Private methods -

	private func configureSubnodes() {
		imageNode.isHidden = true
		svgNode.isHidden = true
	}

}
