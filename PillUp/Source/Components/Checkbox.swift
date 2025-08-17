//
//  Checkbox.swift
//  PillUp
//
//  Created by Diogo on 17/08/2025.
//

import UIKit

class CheckBox: UIButton {
    
    let checkedImage = UIImage(systemName: "checkmark.square.fill")
    let uncheckedImage = UIImage(systemName: "square")
    
    var isChecked: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        self.updateImage()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        self.updateImage()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func toggle() {
        isChecked.toggle()
        updateImage()
    }
    
    private func updateImage() {
        let image = isChecked ? checkedImage : uncheckedImage
        self.setImage(image, for: .normal)
    }
}
