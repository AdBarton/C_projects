#include "formule.h"

Formule::Formule()
{
    setFlag(QGraphicsItem::ItemIsFocusable);
        speed_x=0;
        speed_y=0;
        formulka=new QMediaPlayer();
        formulka->setMedia(QUrl("C:/Users/barta/Desktop/C++/HraAuta/formule.mp3"));
}

QRectF Formule::boundingRect() const
{
    return QRectF(0,0,100,100);
}

void Formule::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->setBrush(QColor("black"));
    painter->drawRect(10,80,10,10);
    painter->drawRect(50,80,10,10);
    painter->drawRect(50,22,10,10);
    painter->drawRect(10,22,10,10);

    painter->drawRect(25,24,20,60);

            painter->setBrush(QColor("yellow"));
            painter->drawRect(30,18,10,4);
            painter->drawRect(15,14,40,4);

            painter->drawRect(30,24,10,14);
            painter->drawRect(20,24,30,2);
            painter->drawRect(20,84,30,2);
            painter->drawRect(30,74,10,10);
            painter->drawEllipse(14,45,42,15);
}

QPainterPath Formule::shape() const
{
    QPainterPath shape;
            shape.addRect(30,18,10,4);
            shape.addRect(15,14,40,4);
            shape.addRect(30,24,10,14);
            shape.addRect(10,22,10,10);
            shape.addRect(20,24,30,2);
            shape.addRect(50,22,10,10);
            shape.addRect(30,74,10,10);
            shape.addRect(14,45,42,15);
            shape.addRect(10,80,10,10);
            shape.addRect(20,84,30,2);
            shape.addRect(50,80,10,10);

            return shape;
}

void Formule::move()
{
    setX(x()+speed_x);
    setY(y()+speed_y);
    formulka->setVolume(18);
    formulka->play();
}

int Formule::getSpeed_x() const
{
    return speed_x;
}

void Formule::setSpeed_x(int value)
{
    speed_x = value;
}

int Formule::getSpeed_y() const
{
    return speed_y;
}

void Formule::setSpeed_y(int value)
{
    speed_y = value;
}

void Formule::stopMusic()
{
    formulka->stop();
}
