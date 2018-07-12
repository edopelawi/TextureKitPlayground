//
//  CommandLogNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 12/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class CommandLogNode: ASDisplayNode {

	// MARK: - Subnodes -

	private let nameNode = ASTextNode()
	private let dateNode = ASTextNode()
	private let callerNode = ASTextNode()

	override init() {
		super.init()

		automaticallyManagesSubnodes = true
		configureMainNode()
		configureSubnodes()
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

		let commandLayout = makeCommandLayout()

		let contentLayout = ASStackLayoutSpec(
			direction: .horizontal,
			spacing: 8.0,
			justifyContent: .spaceBetween,
			alignItems: .center,
			children: [ commandLayout, dateNode ]
		)

		return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 12.0, bottom: 0, right: 12.0), child: contentLayout)
	}

	// MARK: - Private methods

	// MARK: - Node configurations

	private func configureMainNode() {
		self.backgroundColor = UIColor.white
	}

	private func configureSubnodes() {

		// TODO: Make these nodes listen to Rx values later.

		configureNameNode()
		configureDateNode()
		configureCallerNode()
	}

	private func configureNameNode() {

		let attributes: [NSAttributedStringKey: Any] = [
			NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .semibold),
			NSAttributedStringKey.foregroundColor: UIColor(red: (46 / 255), green: (61 / 255), blue: (138 / 255), alpha: 1.0)
		]

		nameNode.attributedText = NSAttributedString(string: "say(hello:to:)", attributes: attributes)
	}

	private func configureDateNode() {

		let attributes: [NSAttributedStringKey: Any] = [
			NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .medium),
			NSAttributedStringKey.foregroundColor: UIColor(red: (137 / 255), green: (178 / 255), blue: (218 / 255), alpha: 1.0)
		]

		dateNode.attributedText = NSAttributedString(string: "12 July 2018", attributes: attributes)
	}

	private func configureCallerNode() {

		let attributes: [NSAttributedStringKey: Any] = [
			NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16, weight: .medium),
			NSAttributedStringKey.foregroundColor: UIColor(red: (94 / 255), green: (136 / 255), blue: (194 / 255), alpha: 1.0)
		]

		callerNode.attributedText = NSAttributedString(string: "RandomClass", attributes: attributes)		
	}

	// MARK: - Layout maker

	private func makeCommandLayout() -> ASLayoutSpec {

		return ASStackLayoutSpec(
			direction: .vertical,
			spacing: 8.0,
			justifyContent: .center,
			alignItems: .start,
			children: [ callerNode, nameNode ]
		)
	}

}
