#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QMainWindow>
#include <QGraphicsView>
#include <QKeyEvent>
#include <QDebug>
#include "gamescene.h"
#include "formule.h"
#include "delicicara.h"

#include <QMainWindow>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_play_clicked();

    void on_pushButton_clicked();

private:
    Ui::MainWindow *ui;
    QGraphicsView *view;
    GameScene *scene;
    Formule *f;
};

#endif // MAINWINDOW_H
