import UIKit

private let highlightColor = UIColor(red: 0.0, green: 122.0 / 255.0, blue: 1.0, alpha: 1.0)

protocol LicenseDelegate: class {
    func licenseSubmitted()
}

final class LicenseViewController: UIViewController {
    weak var licenseDelegate: LicenseDelegate?
    private let exitOnDone: Bool

    init(buttonTitle: String = L10n.welcomeButton, title: String = L10n.welcomeTitle, exitOnDone: Bool = false) {
        self.exitOnDone = exitOnDone

        super.init(nibName: nil, bundle: nil)

        titleLabel.text = title
        self.button.setTitle(buttonTitle, for: .normal)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        setupLayout()
    }
    
    private func setupLayout() {
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(bodyTextView)
        stack.addArrangedSubview(button)
        
        stack.setCustomSpacing(10, after: titleLabel)
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 123),
            button.heightAnchor.constraint(equalToConstant: 44),
            bodyTextView.widthAnchor.constraint(equalToConstant: 600),
            bodyTextView.heightAnchor.constraint(equalToConstant: 80),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 30
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.textColor = .white
        label.text = L10n.welcomeTitle
        return label
    }()
    
    private let bodyTextView: UITextView = {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont(name: "AvenirNext-Regular", size: 18)!,
            .foregroundColor: UIColor.white,
            .kern: 0.0,
            .paragraphStyle: paragraph,
        ]
        let text = NSMutableAttributedString(string: L10n.welcomeBody, attributes: attributes)
        text.setSubstringAsLink(substring: L10n.termsOfServiceLinkSubstring, linkURL: "https://www.mapbox.com/tos/")
        text.setSubstringAsLink(substring: L10n.privacyPolicyLinkSubstring, linkURL: "https://www.mapbox.com/privacy/")
        
        let linkAttributes: [NSAttributedString.Key : Any] = [
            .font: UIFont(name: "AvenirNext-DemiBold", size: 18.0)!,
            .foregroundColor: highlightColor
        ]
        let textView = UITextView()
        
        textView.backgroundColor = .clear
        
        textView.attributedText = text
        textView.linkTextAttributes = Dictionary(uniqueKeysWithValues:
            linkAttributes.map { return ($0.key, $0.value) }
        )
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        
        return textView
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .roundedRect)
        
        button.setTitle(L10n.welcomeButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundColor(highlightColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 22
        
        return button
    }()
    
    @objc private func buttonTapped() {
        if exitOnDone {
            dismiss(viewController: self)
        } else {
            licenseDelegate?.licenseSubmitted()
        }
    }
}

private extension NSMutableAttributedString {
    func setSubstringAsLink(substring: String, linkURL: String) {
        let range = mutableString.range(of: substring)
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.link, value: linkURL, range: range)
        }
    }
}
