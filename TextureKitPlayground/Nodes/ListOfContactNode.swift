//
//  ListOfContactNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 02/08/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class ContactCellNode: ASCellNode {

	// TODO: Move this class to its own folder later.

	private let textNode = ASTextNode()

	override init() {
		super.init()

		automaticallyManagesSubnodes = true
	}

	convenience init(contactName: String) {
		self.init()
		configure(for: contactName)
	}

	func configure(for contactName: String) {

		textNode.attributedText = NSAttributedString(
			string: contactName,
			attributes: [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .semibold) ]
		)
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

		return ASStackLayoutSpec(
			direction: .horizontal,
			spacing: 18,
			justifyContent: .start,
			alignItems: .baselineLast,
			children: [ textNode ]
		)
	}
}

final class ListOfContactNode: ASDisplayNode {

	private let collectionNode: ASCollectionNode
	fileprivate var contactNames = [String]()

	override init() {

		collectionNode = ASCollectionNode(collectionViewLayout: ListOfContactNode.makeCollectionNodeFlowLayout())

		super.init()

		automaticallyManagesSubnodes = true

		configureCollectionNode()
		configureContactNames()
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		return ASWrapperLayoutSpec(layoutElement: collectionNode)
	}

	// MARK: - Private methods

	private static func makeCollectionNodeFlowLayout() -> UICollectionViewLayout {

		let layout = UICollectionViewFlowLayout()

		let deviceBounds = UIScreen.main.bounds
		layout.itemSize = CGSize(
			width: deviceBounds.width - 36,
			height: 40
		)

		return layout
	}

	private func configureCollectionNode() {
		collectionNode.dataSource = self
	}

	private func configureContactNames() {

		let rawNames: [String] = [
			"Jonathan Doe",
			"John Appleseed",
			"Kate Bell"
		]

		self.contactNames = Array(repeatElement(rawNames, count: 10)).flatMap({ $0 })
	}
}

extension ListOfContactNode: ASCollectionDataSource {

	func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {

		let contactName = contactNames[indexPath.row]

		return {
			return ContactCellNode(contactName: contactName)
		}
	}

	func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
		return 1
	}

	func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
		return contactNames.count
	}
}

