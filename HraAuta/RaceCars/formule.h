#ifndef FORMULE_H
#define FORMULE_H
#include <QGraphicsItem>
#include <QPainter>
#include <QMediaPlayer>

class Formule : public QGraphicsItem
{
public:
    Formule();
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    QPainterPath shape() const;
    void move();

    int getSpeed_x() const;
    void setSpeed_x(int value);

    int getSpeed_y() const;
    void setSpeed_y(int value);

    void stopMusic();

private:
    int speed_x;
    int speed_y;
    QMediaPlayer *formulka;
};

#endif // FORMULE_H
