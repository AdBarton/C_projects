#include "gamescene.h"

GameScene::GameScene(QObject *parent):QGraphicsScene::QGraphicsScene(parent)
{
            game_timer= new QTimer(this);
            game_timer->setInterval(30);
            connect(game_timer,&QTimer::timeout, this , &GameScene::gameUpdate);
            game_timer->start();

            int ran=1+rand()%5;

            f=new Formule();
            f->setX(275);
            f->setY(500);
            addItem(f);

            st=new Strom();
            st->setX(35);
            st->setY(0);
            st->setSpeed_y(7);
            addItem(st);

            for(int i=0; i<6; ++i)
            {
                Strom *tmp3=new Strom();
                tmp3->setX(20+rand()%45);
                tmp3->setY(-200);
                tmp3->setSpeed_y(7);
                addItem(tmp3);
                stromy.append(tmp3);
            }

            for(int i=0; i<6; ++i)
            {
                Strom *tmp4=new Strom();
                tmp4->setX(470+rand()%35);
                tmp4->setY(-200);
                tmp4->setSpeed_y(7);
                addItem(tmp4);
                stromy2.append(tmp4);
            }

            s=new Score();
            s->setX(10);
            s->setY(10);
            addItem(s);

            c=new DeliciCara();
            c->setSpeed_y(8);
            c->setX(305);
            c->setY(-200);
            addItem(c);

            for(int i=0; i<5; ++i)
            {
            DeliciCara *tmp2=new DeliciCara();
            tmp2->setX(305);
            tmp2->setY(-200);
            tmp2->setSpeed_y(8);
            addItem(tmp2);
            cary.append(tmp2);
            }

            a=new Auta();
            a->setY(-200);
            a->setX(145+rand()%250);
            a->setSpeed_x(6);

            for(int i=0; i<1+rand()%5; ++i)
            {
                Auta *tmp=new Auta();
                tmp->setX(145+rand()%250);
                tmp->setY(-200);
                tmp->setSpeed_y(6+rand()%4);
                addItem(tmp);
                auticka.append(tmp);
                qDebug()<<i;
            }

            music->setMedia(QUrl("C:/Users/barta/Desktop/C++/HraAuta/theme.mp3"));
            music->play();
}

void GameScene::gameUpdate()
{
    score=+10;
    for(int i=0;i<auticka.length();++i){
         auticka[i]->move();
                if(auticka[i]->collidesWithItem(f)){
                    qDebug() << "Kolize";
                    num--;
                    s->hp--;
                    addItem(s);
                    auticka[i]->setY(0-auticka[i]->boundingRect().height());
                    auticka[i]->setX(145+qrand()%250);
                    auticka[i]->setSpeed_y(6+rand()%4);
                }
                if(auticka[i]->y()>700){
                  auticka[i]->setY(0-auticka[i]->boundingRect().height());
                  auticka[i]->setX(145+qrand()%250);
                  auticka[i]->setSpeed_y(6+rand()%4);
                }
                for(int a=0; a!=i;++a){
                    if(auticka[i]->collidesWithItem(auticka[a])){
                        auticka[a]->setY(random_number-auticka[i]->boundingRect().height());
                        auticka[a]->setX(145+qrand()%250);
                    }
                }
    }
    for(int i=0;i<1+rand()%5;++i){
                stromy[i]->move();
                if(stromy[i]->y()>700){
                  stromy[i]->setY(-200);
                  stromy[i]->setX(20+rand()%45);
                  stromy[i]->setSpeed_y(7);
                }
    }
    for(int i=0;i<1+rand()%6;++i){
                stromy2[i]->move();
                if(stromy2[i]->y()>700){
                  stromy2[i]->setY(-200);
                  stromy2[i]->setX(20+rand()%45);
                  stromy2[i]->setSpeed_y(7);
                }
    }
    for(int i=0;i<cary.length();++i){
                cary[i]->move();
                if(cary[i]->y()>700){
                  cary[i]->setY(-200);
                  cary[i]->setX(305);
                  cary[i]->setSpeed_y(7);
                }
    }

            a->move();
            f->move();
            c->move();
            st->move();
            qDebug() << f->x();

            if(f->x()<145) {
                f->setSpeed_x(0);
            }
            if(f->x()>395) {
                f->setSpeed_x(0);
            }
    if(s->hp<=0){
        f->stopMusic();
        music->stop();
        game_timer->stop();
    }
}

void GameScene::keyPressEvent(QKeyEvent *event)
{
    if(event->key()==Qt::Key_Space)
        {
            f->setSpeed_x(0);
        }
        if( event->key() == Qt::Key_Escape)
        {
            game_timer->stop();
        }
        if( event->key() == Qt::Key_Backspace)
        {


        }
        if( event->key() == Qt::Key_Enter)
        {
            game_timer->start();
  }
}

void GameScene::keyReleaseEvent(QKeyEvent *event)
{

    if(event->key()==Qt::Key_Right)
        {
            f->setSpeed_x(5);
            if(f->x()>400) {
                f->setSpeed_x(0);
            }
        }
        if(event->key()==Qt::Key_Left)
        {
            f->setSpeed_x(-5);
            if(f->x()<145) {
                f->setSpeed_x(0);
            }
        }
}
