//
//  SVGImageNode.swift
//  TextureKitPlayground
//
//  Created by Ricardo Pramana Suranta on 30/07/18.
//  Copyright © 2018 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import Macaw

final class SVGImageNode: ASDisplayNode {

	private let svgView = SVGView()

	private var latestSVGPath: String?
	private var currentDataTask: URLSessionDataTask?
	private var currentDispatchItem: DispatchWorkItem?

	// MARK: - Public methods -

	override init() {
		super.init()
		automaticallyManagesSubnodes = true
		svgView.backgroundColor = .clear
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

		let displayNode = makeDisplayNode()

		return ASWrapperLayoutSpec(layoutElement: displayNode)
	}

	/**
	Configures this instance to display SVG image from the passed `svgString`.
	*/
	func configureFor(svgString: String) {

		DispatchQueue.global(qos: .default).async {

			guard let node = try? SVGParser.parse(text: svgString) else {
				return
			}

			DispatchQueue.main.async {
				self.svgView.node = node
			}
		}
	}

	/**
	Configures this instance to display SVG image from the passed URL String.
	*/
	func configureFor(urlString: String) {

		guard urlString != latestSVGPath else {
			return
		}

		resetSVGView()
		resetDispatchWorkItems()

		latestSVGPath = urlString

		let workItem = createWorkItem(forDisplaying: urlString)

		DispatchQueue.global(qos: .default).async(execute: workItem)
		currentDispatchItem = workItem
	}

	// MARK: - Private methods -

	// MARK: - SVG configuration -

	private func resetSVGView() {
		svgView.node = Group()
	}

	private func resetDispatchWorkItems() {
		currentDataTask?.cancel()
		currentDataTask = nil

		currentDispatchItem?.cancel()
		currentDispatchItem = nil
	}

	private func createWorkItem(forDisplaying urlString: String) -> DispatchWorkItem {

		return DispatchWorkItem() { [weak self] in

			self?.downloadSVG(urlString: urlString) { (svgString: String?) in

				guard let validString = svgString else {
					return
				}

				self?.configureFor(svgString: validString)
			}
		}
	}

	private func downloadSVG(urlString: String, onFinished: @escaping ((_ svgString: String?) -> ())) {

		guard let url = URL(string: urlString) else {
			return
		}
		
		let session = URLSession(configuration: .default)

		currentDataTask = session.dataTask(with: url) { (data: Data?, urlResponse: URLResponse?, error: Error?) in

			guard let validData = data else {

				onFinished(nil)
				return
			}

			let svgString = String(data: validData, encoding: .utf8)
			onFinished(svgString)
		}

		currentDataTask?.resume()
	}

	// MARK: - Layout -

	private func makeDisplayNode() -> ASDisplayNode {

		return ASDisplayNode { [weak self] () -> UIView in

			if let svgView = self?.svgView {
				return svgView
			} else {
				return UIView()
			}
		}
	}
}
