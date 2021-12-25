import UIKit


class BoardController: UIViewController
{
    weak var _caseView: UIView?
    weak var _dieView1: DieView?
    weak var _dieView2: DieView?

    let backgroundColor = UIColor.white
    let caseColor = UIColor(red: 102.0/255.0, green: 42.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    let sidebarColor = UIColor(red: 102.0/255.0, green: 42.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    let diceCupColor = UIColor(red: 201.0/255.0, green: 115.0/255.0, blue: 58.0/255.0, alpha: 1.0)
    let diceColor = UIColor.white

    let centerOffset: CGFloat = 0.0
    let casePadding: CGFloat = 10.0
    let diceCupPadding: CGFloat = 4.0
    let sidebarWidthRatio: CGFloat = 0.15

    // MARK: - UIViewController

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(didTapDice(sender:)))
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(didTapDice(sender:)))
        let tapRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(didTapDice(sender:)))

        let caseContainerView = UIView()
        let caseView = UIView()
        let boardView = BoardView()
        let sidebarView = UIView()
        let diceCupView = UIView()
        let dieView1 = DieView()
        let dieView2 = DieView()

        diceCupView.addGestureRecognizer(tapRecognizer1)
        dieView1.addGestureRecognizer(tapRecognizer2)
        dieView2.addGestureRecognizer(tapRecognizer3)

        caseContainerView.translatesAutoresizingMaskIntoConstraints = false
        caseView.translatesAutoresizingMaskIntoConstraints = false
        boardView.translatesAutoresizingMaskIntoConstraints = false
        sidebarView.translatesAutoresizingMaskIntoConstraints = false
        diceCupView.translatesAutoresizingMaskIntoConstraints = false
        dieView1.translatesAutoresizingMaskIntoConstraints = false
        dieView2.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(caseContainerView)

        caseContainerView.addSubview(caseView)

        caseView.addSubview(boardView)
        caseView.addSubview(sidebarView)

        sidebarView.addSubview(diceCupView)

        diceCupView.addSubview(dieView1)
        diceCupView.addSubview(dieView2)

        _caseView = caseView
        _dieView1 = dieView1
        _dieView2 = dieView2

        dieView1.topAnchor.constraint(equalTo: diceCupView.topAnchor, constant: diceCupPadding).isActive = true
        dieView1.leadingAnchor.constraint(equalTo: diceCupView.leadingAnchor, constant: diceCupPadding).isActive = true
        dieView1.widthAnchor.constraint(equalTo: diceCupView.widthAnchor,
                                       multiplier: 0.5,
                                       constant: (diceCupPadding * -1.5)).isActive = true
        dieView1.heightAnchor.constraint(equalTo: diceCupView.widthAnchor,
                                       multiplier: 0.5,
                                       constant: (diceCupPadding * -1.5)).isActive = true

        dieView2.bottomAnchor.constraint(equalTo: diceCupView.bottomAnchor, constant: -diceCupPadding).isActive = true
        dieView2.trailingAnchor.constraint(equalTo: diceCupView.trailingAnchor, constant: -diceCupPadding).isActive = true
        dieView2.widthAnchor.constraint(equalTo: diceCupView.widthAnchor,
                                        multiplier: 0.5,
                                        constant: (diceCupPadding * -1.5)).isActive = true
        dieView2.heightAnchor.constraint(equalTo: diceCupView.widthAnchor,
                                         multiplier: 0.5,
                                         constant: (diceCupPadding * -1.5)).isActive = true

        diceCupView.topAnchor.constraint(equalTo: sidebarView.topAnchor).isActive = true
        diceCupView.leadingAnchor.constraint(equalTo: sidebarView.leadingAnchor, constant: casePadding).isActive = true
        diceCupView.widthAnchor.constraint(equalTo: sidebarView.widthAnchor, constant: -casePadding).isActive = true
        diceCupView.heightAnchor.constraint(equalTo: sidebarView.widthAnchor).isActive = true

        let boardViewConstraints = [
            boardView.leadingAnchor.constraint(equalTo: caseView.leadingAnchor, constant: casePadding),
            boardView.widthAnchor.constraint(equalTo: caseView.widthAnchor, multiplier: 1 - sidebarWidthRatio, constant: -casePadding * 2),
            boardView.topAnchor.constraint(equalTo: caseView.topAnchor, constant: casePadding),
            caseView.bottomAnchor.constraint(equalTo: boardView.bottomAnchor, constant: casePadding),
        ]

        let sidebarViewConstraints = [
            sidebarView.topAnchor.constraint(equalTo: caseView.topAnchor, constant: casePadding),
            sidebarView.bottomAnchor.constraint(equalTo: caseView.bottomAnchor, constant: -casePadding),
            sidebarView.trailingAnchor.constraint(equalTo: caseView.trailingAnchor, constant: -casePadding),
            sidebarView.widthAnchor.constraint(equalTo: caseView.widthAnchor, multiplier: sidebarWidthRatio),
        ]

        let caseViewLeadingAnchor = caseView.leadingAnchor.constraint(equalTo: caseContainerView.leadingAnchor)
        caseViewLeadingAnchor.priority = .defaultLow
        let caseViewTrailingAnchor = caseView.trailingAnchor.constraint(equalTo: caseContainerView.trailingAnchor)
        caseViewTrailingAnchor.priority = .defaultLow

        let caseViewConstraints = [
            caseView.centerYAnchor.constraint(equalTo: caseContainerView.centerYAnchor),
            caseView.centerXAnchor.constraint(equalTo: caseContainerView.centerXAnchor),
            caseViewLeadingAnchor,
            caseViewTrailingAnchor,
            caseView.heightAnchor.constraint(lessThanOrEqualTo: caseContainerView.heightAnchor),
            caseView.heightAnchor.constraint(equalTo: caseView.widthAnchor, multiplier: 201/384),
        ]

        let caseContainerViewConstraints = [
            caseContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            caseContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            caseContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            caseContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        let allConstraints = caseContainerViewConstraints + caseViewConstraints + boardViewConstraints + sidebarViewConstraints
        NSLayoutConstraint.activate(allConstraints)

        diceCupView.backgroundColor = diceCupColor
        dieView1.backgroundColor = diceColor
        dieView2.backgroundColor = diceColor
        sidebarView.backgroundColor = sidebarColor
        caseView.backgroundColor = caseColor
        caseContainerView.backgroundColor = backgroundColor
        view.backgroundColor = backgroundColor
    }

    // MARK: - Private

    @objc func didTapDice(sender: Any?) -> Void
    {
        let dieNumber1 = (arc4random() % 6) + 1
        let dieNumber2 = (arc4random() % 6) + 1
        _dieView1?.numberLabel?.text = String(dieNumber1)
        _dieView2?.numberLabel?.text = String(dieNumber2)
    }
}
