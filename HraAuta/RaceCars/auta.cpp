#include "auta.h"

Auta::Auta()
{
    speed_x=0;
    speed_y=0;
}

QRectF Auta::boundingRect() const
{
    return QRect(0,0,20,20);
}

void Auta::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->setBrush(QColor("red"));
    painter->drawEllipse(boundingRect());
}

QPainterPath Auta::shape() const
{
    QPainterPath shape;
    shape.addEllipse(boundingRect());
    return shape;
}

void Auta::move()
{
    setX(x()+speed_x);
    setY(y()+speed_y);
}

int Auta::getSpeed_x() const
{
    return speed_x;
}

void Auta::setSpeed_x(int value)
{
    speed_x = value;
}

int Auta::getSpeed_y() const
{
    return speed_y;
}

void Auta::setSpeed_y(int value)
{
    speed_y = value;
}
