#ifndef STROM_H
#define STROM_H
#include <QPainter>
#include <QGraphicsItem>

class Strom : public QGraphicsItem
{
public:
    Strom();
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    QPainterPath shape() const;
    int getSpeed_x() const;
    void setSpeed_x(int value);

    int getSpeed_y() const;
    void setSpeed_y(int value);
    void move();
private:
    int speed_x;
    int speed_y;
};

#endif // STROM_H
