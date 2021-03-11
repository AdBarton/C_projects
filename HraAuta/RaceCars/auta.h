#ifndef AUTA_H
#define AUTA_H
#include <QPainter>
#include <QGraphicsItem>
#include <QTimer>

class Auta : public QGraphicsItem
{
public:
    Auta();
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    QPainterPath shape() const;

    void move();

    int getSpeed_x() const;
    void setSpeed_x(int value);

    int getSpeed_y() const;
    void setSpeed_y(int value);

private:
    int speed_x;
    int speed_y;
};

#endif // AUTA_H
