#include "strom.h"

Strom::Strom()
{
    speed_x=0;
    speed_y=0;
}

QRectF Strom::boundingRect() const
{
    return QRect(0,0,40,40);
}

void Strom::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->setBrush(QColor("green"));
    painter->drawEllipse(boundingRect());
}

QPainterPath Strom::shape() const
{
    QPainterPath shape;
    shape.addEllipse(boundingRect());
    return shape;
}

int Strom::getSpeed_x() const
{
    return speed_x;
}

void Strom::setSpeed_x(int value)
{
    speed_x = value;
}

int Strom::getSpeed_y() const
{
    return speed_y;
}

void Strom::setSpeed_y(int value)
{
    speed_y = value;
}

void Strom::move()
{
    setX(x()+speed_x);
    setY(y()+speed_y);
}
