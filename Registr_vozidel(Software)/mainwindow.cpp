#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QInputDialog>
#include <QListWidgetItem>
#include <QMessageBox>
#include <QIcon>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->registr->addItem("Ford Mondeo");

    QIcon ikona = QIcon("img/car1.png");
    ui->registr->setIconSize(QSize(40,40)); //nastavim velikost ikony

    QListWidgetItem * auto1 = new QListWidgetItem(ikona, "BMW");
    ui->registr->addItem(auto1);

    for(int i = 0; i<20; i++ ){
        // ui->registr->addItem(QString::number(i)+". auto");
        QListWidgetItem * auto1 = new QListWidgetItem(ikona, "BMW");
        ui->registr->addItem(auto1);
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_registr_currentItemChanged(
        QListWidgetItem *current, QListWidgetItem *previous)
{
    ui->l_vyber->setText(current->text());
}

void MainWindow::on_b_odstranit_clicked()
{
    QListWidgetItem * polozka =
            ui->registr->takeItem(ui->registr->currentRow());
    if(polozka == 0){
        return;
    }
    delete polozka;
}

void MainWindow::on_b_rename_clicked()
{
    QListWidgetItem * polozka = ui->registr->currentItem();
    QString nove_jmeno =
            QInputDialog::getText(this,"Prejmenovat",
                                  "Zadejte nove jmeno.");
    if(nove_jmeno.length() > 20){
        QMessageBox::StandardButton btn =
                QMessageBox::question(this, "Otazka",
                                      "Skutecne chcete prejmenovat?");
        if(btn == QMessageBox::Yes){
            polozka->setText(nove_jmeno);
        } else {
            QMessageBox::warning(this, "Varovani", "Text nebyl ulozen.");
        }
    } else {
        polozka->setText(nove_jmeno);
    }

}

void MainWindow::on_b_add_clicked()
{
//if (ui->le_add->text()=="")
//    QMessageBox::warning(this, "?", "Nebyl zadan text");
// else ui->registr->addItem(ui->le_add->text());


    QListWidgetItem * iconItem = new QListWidgetItem(ui->le_add->text());
    iconItem->setSizeHint(QSize(100,40));
    ui->registr->insertItem(ui->registr->currentRow(), iconItem);
    ui->registr->count();
    //ui->registr->insertItem(ui->registr->currentRow(),
            //                ui->le_add->text());
}

void MainWindow::on_registr_itemClicked(QListWidgetItem *item)
{
    QListWidgetItem * automobil = item;
    automobil->setBackgroundColor(Qt::yellow);
    automobil->setTextColor(Qt::blue);
}
