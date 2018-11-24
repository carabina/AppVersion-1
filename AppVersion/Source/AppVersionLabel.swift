//
//  AppVersionLabel.swift
//  AppVersion
//

import UIKit

@IBDesignable
open class AppVersionLabel: UILabel {
    var format: VersionFormat = .long {
        didSet {
            updateText()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'format' instead.")
    @IBInspectable var formatName: String? {
        willSet {
            if let newFormat = VersionFormat(rawValue: newValue ?? "") {
                format = newFormat
            }
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        adjustsFontSizeToFitWidth = true
        numberOfLines = 0
        sizeToFit()
        updateText()
    }

    private func updateText() {
        text = AppVersion.version(with: format)
    }
}
