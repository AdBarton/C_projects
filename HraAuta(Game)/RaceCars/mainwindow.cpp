#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
        ui->setupUi(this);
        QPixmap ahoj("C:/Users/barta/Desktop/C++/HraAuta/menu.jpg");
        ui->label->setPixmap(ahoj);
        /*
        view=new QGraphicsView(this);
        setCentralWidget(view);
        scene =new GameScene;
        view->setScene(scene);
        view->setSceneRect(0,0,600,800);
        setGeometry(x(),y(),600,800);
        scene->setBackgroundBrush(QBrush(QImage("C:/Users/barta/Desktop/C++/HraAuta/formule.jpg")));*/
}


MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_play_clicked()
{
    view=new QGraphicsView(this);
    setCentralWidget(view);
    scene =new GameScene;
    view->setScene(scene);
    view->setSceneRect(0,0,600,800);
    setGeometry(x(),y(),600,800);
    scene->setBackgroundBrush(QBrush(QImage("C:/Users/barta/Desktop/C++/HraAuta/formule.jpg")));
}

void MainWindow::on_pushButton_clicked()
{
   MainWindow::close();
}
