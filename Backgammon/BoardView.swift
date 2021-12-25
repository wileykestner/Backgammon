import UIKit


class BoardView: UIView
{
    private let _board = initialBoard()
    let horizontalPadding: CGFloat = 10.0
    let columnsPerQuadrant: Int = 6
    let maxStonesPerColumn: Int = 5
    let gapBetweenStonesHeight: CGFloat = 2.0

    let _caseColor = UIColor(red: 102.0/255.0, green: 42.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    let _backgroundColor = UIColor(red: 201.0/255.0, green: 115.0/255.0, blue: 58.0/255.0, alpha: 1.0)
    let _lightColumnColor = UIColor(red: 225.0/255.0, green: 214.0/255.0, blue: 186.0/255.0, alpha: 1.0)
    let _darkColumnColor = UIColor(red: 104.0/255.0, green: 61.0/255.0, blue: 9.0/255.0, alpha: 1.0)
    let _lightStoneColor = UIColor.white
    let _darkStoneColor = UIColor.black

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

    // MARK: - UIView

    override func draw(_ rect: CGRect)
    {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        let verticalCenterDividerWidth: CGFloat = rect.maxX / 30.0
        let horizontalCenterDividerHeight: CGFloat = rect.maxY / 10.0

        let quadrantWidth = (rect.maxX / 2.0) - (verticalCenterDividerWidth / 2.0)
        let quadrantHeight = (rect.maxY / 2.0) - (horizontalCenterDividerHeight / 2.0)

        let playAreaHeight = quadrantHeight * 2.0
        let westMinX = rect.minX
        let westMaxX = westMinX + quadrantWidth
        let northMinY = rect.minY
        let eastMinX = westMaxX + verticalCenterDividerWidth
        let southMinY = quadrantHeight + horizontalCenterDividerHeight
        let southMaxY =     playAreaHeight + horizontalCenterDividerHeight

        let southWest = CGRect(x: westMinX, y: southMinY, width: quadrantWidth, height: quadrantHeight)
        let southEast = CGRect(x: eastMinX, y: southMinY, width: quadrantWidth, height: quadrantHeight)
        let northWest = CGRect(x: westMinX, y: northMinY, width: quadrantWidth, height: quadrantHeight)
        let northEast = CGRect(x: eastMinX, y: northMinY, width: quadrantWidth, height: quadrantHeight)

        // Vertical strip
        //
        context.move(to: CGPoint(x: quadrantWidth, y: northMinY))
        context.addLine(to: CGPoint(x: quadrantWidth + verticalCenterDividerWidth, y: northMinY))
        context.addLine(to: CGPoint(x: quadrantWidth + verticalCenterDividerWidth, y: southMaxY))
        context.addLine(to: CGPoint(x: quadrantWidth, y: southMaxY))
        context.addLine(to: CGPoint(x: quadrantWidth, y: northMinY))
        context.closePath()
        context.setFillColor(_caseColor.cgColor)
        context.fillPath()

        let gutterCount = columnsPerQuadrant + 1
        let combinedGutterWidth = CGFloat(gutterCount) * horizontalPadding
        let columnBaseWidth = (quadrantWidth - combinedGutterWidth) / CGFloat(columnsPerQuadrant)
        let maxStoneHeight = quadrantHeight / CGFloat(maxStonesPerColumn)

        for (index, rank) in _board.ranks.enumerated()
        {
            let columnColor = (index % 2 == 0) ? _lightColumnColor : _darkColumnColor;
            let stoneColor: CGColor
            switch rank.stone
            {
            case .white: stoneColor = UIColor.white.cgColor
            case .black: stoneColor = UIColor.black.cgColor
            case .empty: stoneColor = UIColor.clear.cgColor
            }

            switch index
            {
            // Northeast quadrant
            //
            case 0..<(columnsPerQuadrant * 1):
                context.beginPath()
                let gutterStop = CGFloat(index % columnsPerQuadrant + 1)
                let leadingBaseEdgeX = northEast.maxX - (columnBaseWidth * gutterStop) - (horizontalPadding * gutterStop)
                let trailingBaseEdgeX = leadingBaseEdgeX + columnBaseWidth
                let peakX = leadingBaseEdgeX + (columnBaseWidth / 2.0)
                context.move(to: CGPoint(x: leadingBaseEdgeX, y: northEast.minY))
                context.addLine(to: CGPoint(x: trailingBaseEdgeX, y: northEast.minY))
                context.addLine(to: CGPoint(x: peakX, y: northEast.maxY))
                context.addLine(to: CGPoint(x: leadingBaseEdgeX, y: northEast.minY))
                context.closePath()
                context.setFillColor(columnColor.cgColor)
                context.fillPath()

                drawStones(context: context,
                           stoneCount: rank.count,
                           stoneColor: stoneColor,
                           maxStoneHeight: maxStoneHeight,
                           quadrantHeight: quadrantHeight,
                           leadingBaseEdgeX: leadingBaseEdgeX,
                           leadingBaseEdgeY: 0,
                           columnBaseWidth: columnBaseWidth,
                           drawingFromTopToBottom: true)

            // Northwest quadrant
            //
            case (columnsPerQuadrant * 1)..<(columnsPerQuadrant * 2):
                context.beginPath()
                let gutterStop = CGFloat(index % columnsPerQuadrant + 1)
                let leadingBaseEdgeX = northWest.maxX - (columnBaseWidth * gutterStop) - (horizontalPadding * gutterStop)
                let trailingBaseEdgeX = leadingBaseEdgeX + columnBaseWidth
                let peakX = leadingBaseEdgeX + (columnBaseWidth / 2.0)
                context.move(to: CGPoint(x: leadingBaseEdgeX, y: northWest.minY))
                context.addLine(to: CGPoint(x: trailingBaseEdgeX, y: northWest.minY))
                context.addLine(to: CGPoint(x: peakX, y: northWest.maxY))
                context.addLine(to: CGPoint(x: leadingBaseEdgeX, y: northWest.minY))
                context.closePath()
                context.setFillColor(columnColor.cgColor)
                context.fillPath()

                drawStones(context: context,
                           stoneCount: rank.count,
                           stoneColor: stoneColor,
                           maxStoneHeight: maxStoneHeight,
                           quadrantHeight: quadrantHeight,
                           leadingBaseEdgeX: leadingBaseEdgeX,
                           leadingBaseEdgeY: 0,
                           columnBaseWidth: columnBaseWidth,
                           drawingFromTopToBottom: true)

            // Southwest quadrant
            //
            case (columnsPerQuadrant * 2)..<(columnsPerQuadrant * 3):
                context.beginPath()
                let gutterStop = CGFloat(index % columnsPerQuadrant)
                let leadingBaseEdgeX = southWest.minX + (columnBaseWidth * gutterStop) + (horizontalPadding + (horizontalPadding * gutterStop))
                let trailingBaseEdgeX = leadingBaseEdgeX + columnBaseWidth
                let peakX = leadingBaseEdgeX + (columnBaseWidth / 2.0)
                context.move(to: CGPoint(x: leadingBaseEdgeX, y: southWest.maxY))
                context.addLine(to: CGPoint(x: trailingBaseEdgeX, y: southWest.maxY))
                context.addLine(to: CGPoint(x: peakX, y: southWest.minY))
                context.addLine(to: CGPoint(x: leadingBaseEdgeX, y: southWest.maxY))
                context.closePath()
                context.setFillColor(columnColor.cgColor)
                context.fillPath()

                drawStones(context: context,
                           stoneCount: rank.count,
                           stoneColor: stoneColor,
                           maxStoneHeight: maxStoneHeight,
                           quadrantHeight: quadrantHeight,
                           leadingBaseEdgeX: leadingBaseEdgeX,
                           leadingBaseEdgeY: southWest.maxY,
                           columnBaseWidth: columnBaseWidth,
                           drawingFromTopToBottom: false)

            // Southeast quadrant
            //
            case (columnsPerQuadrant * 3)..<(columnsPerQuadrant * 4):

                context.beginPath()
                let gutterStop = CGFloat(index % columnsPerQuadrant)
                let leadingBaseEdgeX = southEast.minX + (columnBaseWidth * gutterStop) + (horizontalPadding + (horizontalPadding * gutterStop))
                let trailingBaseEdgeX = leadingBaseEdgeX + columnBaseWidth
                let peakX = leadingBaseEdgeX + (columnBaseWidth / 2.0)
                context.move(to: CGPoint(x: leadingBaseEdgeX, y: southEast.maxY))
                context.addLine(to: CGPoint(x: trailingBaseEdgeX, y: southEast.maxY))
                context.addLine(to: CGPoint(x: peakX, y: southEast.minY))
                context.addLine(to: CGPoint(x: leadingBaseEdgeX, y: southEast.maxY))
                context.closePath()
                context.setFillColor(columnColor.cgColor)
                context.fillPath()

                drawStones(context: context,
                           stoneCount: rank.count,
                           stoneColor: stoneColor,
                           maxStoneHeight: maxStoneHeight,
                           quadrantHeight: quadrantHeight,
                           leadingBaseEdgeX: leadingBaseEdgeX,
                           leadingBaseEdgeY: southEast.maxY,
                           columnBaseWidth: columnBaseWidth,
                           drawingFromTopToBottom: false)
            default:
                break
            }
        }
    }

    // MARK: - Private

    func commonInit() -> Void
    {
        backgroundColor = _backgroundColor
    }

    func drawStones(context: CGContext,
                    stoneCount: Int,
                    stoneColor: CGColor,
                    maxStoneHeight: CGFloat,
                    quadrantHeight: CGFloat,
                    leadingBaseEdgeX: CGFloat,
                    leadingBaseEdgeY: CGFloat,
                    columnBaseWidth: CGFloat,
                    drawingFromTopToBottom: Bool) -> Void
    {
        let numberOfGapsSurroundingStones = maxStonesPerColumn + 1
        let aggregateGapHeight = CGFloat(numberOfGapsSurroundingStones) * gapBetweenStonesHeight
        let spaceRemainingForStones = quadrantHeight - aggregateGapHeight
        let stoneDiameter = spaceRemainingForStones / CGFloat(maxStonesPerColumn)

        let stonePlacementDirection: CGFloat = drawingFromTopToBottom ? 1 : -1
        let quadrantDirectionInt: Int = drawingFromTopToBottom ? 0 : 1
        let quadrantDirectionFloat: CGFloat = CGFloat(quadrantDirectionInt)
        let differenceBetweenStoneDiameterAndBaseWidth = columnBaseWidth - stoneDiameter
        let stoneXOffset = differenceBetweenStoneDiameterAndBaseWidth / 2.0

        for stoneIndex in 0..<stoneCount
        {
            context.beginPath()

            let yStart: CGFloat
            if stoneCount < 6
            {
                yStart = (leadingBaseEdgeY * quadrantDirectionFloat) + (CGFloat(stoneIndex + quadrantDirectionInt) * stoneDiameter * stonePlacementDirection) + (stonePlacementDirection * gapBetweenStonesHeight * CGFloat(stoneIndex))
            }
            else
            {
                let miniStoneHeight = quadrantHeight / CGFloat(stoneCount)
                yStart = CGFloat(stoneIndex) * miniStoneHeight
            }

            let stoneRect = CGRect(x: leadingBaseEdgeX + stoneXOffset,
                                   y: yStart,
                                   width: stoneDiameter,
                                   height: stoneDiameter)
            context.addEllipse(in: stoneRect)
            context.closePath()
            context.setFillColor(stoneColor)
            context.fillPath()
        }
    }
}
