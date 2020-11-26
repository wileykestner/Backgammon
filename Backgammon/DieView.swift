import UIKit


class DieView: UIView
{
    weak var numberLabel: UILabel?

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - Private

    private func commonInit() -> Void
    {
        self.isUserInteractionEnabled = true

        let aNumberLabel = UILabel()
        self.addSubview(aNumberLabel)
        numberLabel = aNumberLabel

        aNumberLabel.text = "?"
        aNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        aNumberLabel.textAlignment = .center
        aNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        aNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        aNumberLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        aNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
