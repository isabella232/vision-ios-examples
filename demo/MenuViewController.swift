import UIKit

final class MenuViewController: UIViewController {
    private static let infoButtonPadding: CGFloat = 20

    // MARK: Properties

    weak var delegate: MenuDelegate?

    // MARK: Private properties

    private let infoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Asset.Assets.info.image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
        button.tintColor = UIColor(white: 0.5, alpha: 0.5)
        return button
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)

        let select: (Screen) -> Void = { [weak self] screen in
            self?.delegate?.selected(screen: screen)
        }

        let segmentationButton = MenuItemButton(for: .segmentation, action: select)
        let laneDetectionButton = MenuItemButton(for: .laneDetection, action: select)
        let distanceToObjectButton = MenuItemButton(for: .distanceToObject, action: select)
        let signsDetectionButton = MenuItemButton(for: .signsDetection, action: select)
        let objectDetectorButton = MenuItemButton(for: .objectDetection, action: select)
        let arRoutingButton = MenuItemButton(for: .arRouting, action: select)

        let titleView = UIImageView(image: Asset.Assets.title.image)
        addToView(titleImageView: titleView)

        let lineCenterImage = Asset.Assets.lineCenter.image
        let centerLine = UIImageView(image: lineCenterImage)
        addToView(centerLineImageView: centerLine)

        let lineLeftRightImage = Asset.Assets.lineLeftRight.image
        let leftLine = UIImageView(image: lineLeftRightImage)
        addToView(leftLineImageView: leftLine, withDependencyOn: centerLine)

        let rightLine = UIImageView(image: lineLeftRightImage)
        addToView(rightLineImageView: rightLine, withDependencyOn: centerLine)

        let topStack = createStack(subviews: [signsDetectionButton, segmentationButton, objectDetectorButton],
                                   alignment: .bottom,
                                   separator: verticalTopLine)
        let bottomStack = createStack(subviews: [distanceToObjectButton, arRoutingButton, laneDetectionButton],
                                      alignment: .top,
                                      separator: verticalBottomLine)

        layout(topStack: topStack, bottomStack: bottomStack, withDependencyOn: centerLine)

        addToViewInfoButton()
    }

    // MARK: Private functions

    private func createStack(
        subviews: [UIView],
        alignment: UIStackView.Alignment,
        separator: () -> UIView
    ) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.alignment = alignment

        view.addSubview(stack)

        for subview in subviews {
            stack.addArrangedSubview(subview)
            subview.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25).isActive = true

            if subview != subviews.last {
                stack.addArrangedSubview(separator())
            }
        }
        return stack
    }

    private func verticalTopLine() -> UIImageView {
        return UIImageView(image: Asset.Assets.lineTopBottom.image)
    }

    private func verticalBottomLine() -> UIImageView {
        let verticalBottomLine = UIImageView(image: Asset.Assets.lineTopBottom.image)
        verticalBottomLine.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        return verticalBottomLine
    }

    private func addToView(titleImageView: UIImageView) {
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleImageView)
        NSLayoutConstraint.activate([
            titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 28),
        ])
    }

    private func addToView(centerLineImageView: UIImageView) {
        centerLineImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLineImageView)
        NSLayoutConstraint.activate([
            centerLineImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            centerLineImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 18),
            centerLineImageView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
        ])
    }

    private func addToView(leftLineImageView: UIImageView, withDependencyOn centerLine: UIImageView) {
        leftLineImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftLineImageView)
        NSLayoutConstraint.activate([
            leftLineImageView.centerYAnchor.constraint(equalTo: centerLine.centerYAnchor),
            leftLineImageView.trailingAnchor.constraint(equalTo: centerLine.leadingAnchor),
            leftLineImageView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25),
        ])
    }

    private func addToView(rightLineImageView: UIImageView, withDependencyOn centerLine: UIImageView) {
        rightLineImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        rightLineImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rightLineImageView)
        NSLayoutConstraint.activate([
            rightLineImageView.centerYAnchor.constraint(equalTo: centerLine.centerYAnchor),
            rightLineImageView.leadingAnchor.constraint(equalTo: centerLine.trailingAnchor),
            rightLineImageView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25),
        ])
    }

    private func layout(topStack: UIStackView, bottomStack: UIStackView, withDependencyOn centerLine: UIImageView) {
        NSLayoutConstraint.activate([
            topStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStack.bottomAnchor.constraint(equalTo: centerLine.topAnchor),
            bottomStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomStack.topAnchor.constraint(equalTo: centerLine.bottomAnchor),
        ])
    }

    private func addToViewInfoButton() {
        view.addSubview(infoButton)
        NSLayoutConstraint.activate([
            infoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -MenuViewController.infoButtonPadding),
            infoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: MenuViewController.infoButtonPadding),
        ])
    }

    @objc
    private func infoTapped() {
        let alert: UIAlertController

        if UIDevice.current.userInterfaceIdiom == .pad {
            alert = UIAlertController(title: L10n.infoTitle, message: nil, preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: L10n.infoTitle, message: nil, preferredStyle: .actionSheet)
        }

        alert.addAction(UIAlertAction(title: L10n.generalTermsOfService, style: .default) { _ in
            guard let url = URL(string: GlobalConstants.tosLink) else { return }
            UIApplication.shared.open(url)
        })
        alert.addAction(UIAlertAction(title: L10n.generalPrivacyPolicy, style: .default) { _ in
            guard let url = URL(string: GlobalConstants.privacyPolicyLink) else { return }
            UIApplication.shared.open(url)
        })
        alert.addAction(UIAlertAction(title: L10n.generalButtonCancel, style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
}

extension Screen {
    var title: String {
        switch self {
        case .segmentation:
            return L10n.menuSegmentationButton
        case .laneDetection:
            return L10n.menuLaneDetectionButton
        case .distanceToObject:
            return L10n.menuCollisionDetectionButton
        case .signsDetection:
            return L10n.menuSignDetectionButton
        case .objectDetection:
            return L10n.menuObjectDetectionButton
        case .arRouting:
            return L10n.menuARButton
        case .menu:
            return L10n.menuTitle
        }
    }

    var iconImage: UIImage {
        switch self {
        case .segmentation:
            return Asset.Assets.icon1.image
        case .laneDetection:
            return Asset.Assets.icon2.image
        case .distanceToObject:
            return Asset.Assets.collisionDetection.image
        case .signsDetection:
            return Asset.Assets.icon4.image
        case .objectDetection:
            return Asset.Assets.icon6.image
        case .arRouting:
            return Asset.Assets.icon7.image
        case .menu:
            return UIImage()
        }
    }
}

private class MenuItemButton: UIView {
    private static let padding: CGFloat = 8
    private static let cellHeight: CGFloat = 147.0

    private let action: () -> Void

    init(for screen: Screen, action: @escaping (Screen) -> Void) {
        self.action = { action(screen) }

        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -MenuItemButton.padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: MenuItemButton.padding),
            heightAnchor.constraint(equalToConstant: MenuItemButton.cellHeight),
        ])

        titleLabel.text = screen.title
        imageView.image = screen.iconImage

        let gestureRecogrizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(gestureRecogrizer)
    }

    @objc
    func tap() {
        action()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        return label
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}
