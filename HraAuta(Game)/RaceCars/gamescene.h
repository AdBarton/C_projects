#ifndef GAMESCENE_H
#define GAMESCENE_H
#include <QTimer>
#include <QList>
#include <QDebug>
#include <QGraphicsScene>
#include <QKeyEvent>
#include "formule.h"
#include "auta.h"
#include "delicicara.h"
#include "score.h"
#include "strom.h"
#include "konechry.h"
#include <QMediaPlayer>

class GameScene : public QGraphicsScene
{
    Q_OBJECT
public:
    GameScene(QObject *parent = nullptr);
    void gameUpdate();
private:
    void keyPressEvent(QKeyEvent *event);
    void keyReleaseEvent(QKeyEvent *event);
    QTimer *game_timer;
    Formule *f;
    Auta *a;
    DeliciCara *c;
    QList<DeliciCara *> cary;
    QList<Auta *> auticka;
    Score *s;
    Strom *st;
    QList<Strom *> stromy;
    QList<Strom *> stromy2;
    int num=5;
    int score=0;
    int random_number= rand()%1300;

    //Play music
    QMediaPlayer *music=new QMediaPlayer();
};

#endif // GAMESCENE_H
