#include "score.h"

Score::Score()
{
}

QRectF Score::boundingRect() const
{
    return QRectF(0,0,80,80);
}

void Score::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->setBrush(QColor("yellow"));
    painter->drawEllipse(boundingRect());
    painter->drawText(20,40,"Score: 0");
    painter->drawText(20,60,"HP: 5");
}

QPainterPath Score::shape() const
{
    QPainterPath shape;
    shape.addRect(boundingRect());
    return shape;
}


