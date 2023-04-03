

import UIKit

class ViewController: UIViewController {
    
    private var documentPicker: UIDocumentPickerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        documentPicker = UIDocumentPickerViewController(documentTypes: ["pdf"], in: .open)
        documentPicker.delegate = self
        addButton()
    }
    
    private func addButton() {
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        button.setTitle("Show Picker", for: .normal)
        button.addTarget(
            self,
            action: #selector(showDocumentPicker),
            for: .touchUpInside
        )
        button.backgroundColor = .red
    }
    
    @objc
    private func showDocumentPicker() {
        present(documentPicker, animated: true)
    }
    
}

extension ViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print(urls)
    }
}

