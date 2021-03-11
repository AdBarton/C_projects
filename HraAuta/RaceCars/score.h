#ifndef SCORE_H
#define SCORE_H
#include <QPainter>
#include <QGraphicsItem>
#include <QTimer>
#include <iostream>
#include <string>
#include <string.h>

class Score : public QGraphicsItem
{
public:
    Score();
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    QPainterPath shape() const;
    int hp=5;
    int scr=0;
};

#endif // SCORE_H
