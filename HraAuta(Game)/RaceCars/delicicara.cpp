#include "delicicara.h"

DeliciCara::DeliciCara()
{
    speed_x=0;
    speed_y=0;
}

QRectF DeliciCara::boundingRect() const
{
    return QRect(0,0,5,25);
}

void DeliciCara::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->setBrush(QColor("white"));
        painter->drawRect(0,0,3,20);
}

QPainterPath DeliciCara::shape() const
{
    QPainterPath shape;
        shape.addEllipse(boundingRect());
        return shape;
}

void DeliciCara::move()
{
    setY(x()+speed_x);
    setY(y()+speed_y);
}

int DeliciCara::getSpeed_x() const
{
    return speed_x;
}

void DeliciCara::setSpeed_x(int value)
{
    speed_x = value;
}

int DeliciCara::getSpeed_y() const
{
    return speed_y;
}

void DeliciCara::setSpeed_y(int value)
{
    speed_y = value;
}
