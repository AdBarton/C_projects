#ifndef DELICICARA_H
#define DELICICARA_H
#include <QPainter>
#include <QGraphicsItem>
#include <QTimer>

class DeliciCara : public QGraphicsItem
{
public:
    DeliciCara();
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

#endif // DELICICARA_H
