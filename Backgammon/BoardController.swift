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
    var sidebarWidthRatio: CGFloat = 0.2

    // MARK: - UIViewController

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(didTapDice(sender:)))
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(didTapDice(sender:)))
        let tapRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(didTapDice(sender:)))

        let boardView = BoardView()
        let caseView = UIView()
        let sidebarView = UIView()
        let diceCupView = UIView()
        let dieView1 = DieView()
        let dieView2 = DieView()

        diceCupView.addGestureRecognizer(tapRecognizer1)
        dieView1.addGestureRecognizer(tapRecognizer2)
        dieView2.addGestureRecognizer(tapRecognizer3)

        caseView.translatesAutoresizingMaskIntoConstraints = false
        boardView.translatesAutoresizingMaskIntoConstraints = false
        sidebarView.translatesAutoresizingMaskIntoConstraints = false
        diceCupView.translatesAutoresizingMaskIntoConstraints = false
        dieView1.translatesAutoresizingMaskIntoConstraints = false
        dieView2.translatesAutoresizingMaskIntoConstraints = false

        caseView.addSubview(boardView)
        sidebarView.addSubview(diceCupView)
        diceCupView.addSubview(dieView1)
        diceCupView.addSubview(dieView2)
        view.addSubview(caseView)
        view.addSubview(sidebarView)
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

        diceCupView.topAnchor.constraint(equalTo: sidebarView.topAnchor, constant: casePadding).isActive = true
        diceCupView.leadingAnchor.constraint(equalTo: sidebarView.leadingAnchor, constant: casePadding).isActive = true
        diceCupView.widthAnchor.constraint(equalTo: sidebarView.widthAnchor, constant: (casePadding * -2.0)).isActive = true
        diceCupView.heightAnchor.constraint(equalTo: sidebarView.widthAnchor, constant: (casePadding * -2.0)).isActive = true

        caseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: casePadding).isActive = true
        sidebarView.leadingAnchor.constraint(equalTo: caseView.trailingAnchor, constant: casePadding).isActive = true
        sidebarView.widthAnchor.constraint(equalTo: caseView.widthAnchor, multiplier: sidebarWidthRatio).isActive = true
        view.trailingAnchor.constraint(equalTo: sidebarView.trailingAnchor, constant: casePadding).isActive = true

        sidebarView.topAnchor.constraint(equalTo: caseView.topAnchor).isActive = true
        sidebarView.bottomAnchor.constraint(equalTo: caseView.bottomAnchor).isActive = true

        caseView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerOffset).isActive = true
        caseView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 201/384).isActive = true

        boardView.leadingAnchor.constraint(equalTo: caseView.leadingAnchor, constant: casePadding).isActive = true
        caseView.trailingAnchor.constraint(equalTo: boardView.trailingAnchor, constant: casePadding).isActive = true
        boardView.topAnchor.constraint(equalTo: caseView.topAnchor, constant: casePadding).isActive = true
        caseView.bottomAnchor.constraint(equalTo: boardView.bottomAnchor, constant: casePadding).isActive = true

        caseView.backgroundColor = caseColor
        sidebarView.backgroundColor = sidebarColor
        diceCupView.backgroundColor = diceCupColor
        dieView1.backgroundColor = diceColor
        dieView2.backgroundColor = diceColor
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
