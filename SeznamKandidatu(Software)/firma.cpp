#include "firma.h"
#include "ui_firma.h"
#include <QPixmap>

Firma::Firma(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Firma)
{
    ui->setupUi(this);

    Kandidat * k = new Kandidat("Sheldon", "Cooper", 1975, ":/osoby/img/Sheldon.PNG");
    pridejKandidata(k, f_novi_kandidati, ui->lw_novi);
    k = new Kandidat("Amy", "Farrah Fowler", 1980, ":/osoby/img/Amy.PNG");
    pridejKandidata(k, f_novi_kandidati, ui->lw_novi);
    k = new Kandidat("Leonard", "Howstadter", 1985, ":/osoby/img/Leonard.PNG");
    pridejKandidata(k, f_novi_kandidati, ui->lw_novi);
    k = new Kandidat("Penny", "", 1987, ":/osoby/img/Penny.PNG");
    pridejKandidata(k, f_novi_kandidati, ui->lw_novi);
}

Firma::~Firma()
{
    delete ui;
}

void Firma::pridejKandidata(Kandidat *k, QQueue<Kandidat *> &fronta, QListWidget * lw)
{
    fronta.enqueue(k);
    lw->addItem(k);
}

Kandidat * Firma::odeberKandidata(QQueue<Kandidat *> &fronta, QListWidget *lw)
{
    lw->takeItem(0); // odebiram 0. kandidata z listwidgetu
    return fronta.dequeue();
}

void Firma::updateDetail(Kandidat *k)
{
    QString jmenoprijmeni = k->k_jmeno + " " + k->k_prijmeni;
    ui->l_jmeno->setText(jmenoprijmeni);
    ui->l_vek->setText(QString::number(k->vek())+" let");
    ui->l_bydliste->setText(k->k_bydliste);
    ui->l_schopnosti->setText(k->k_schopnosti);
    ui->l_stav->setText(k->stav().toUpper());

    int w = ui->l_obrazek->width();
    int h = ui->l_obrazek->height();
    QPixmap pix = QPixmap(k->k_foto);
    ui->l_obrazek->setPixmap(pix.scaled(w,h,Qt::KeepAspectRatio));
}

void Firma::on_btn_n_zamitnout_clicked()
{
    // odeberu kandidata z fronty NOVI
    Kandidat * k = odeberKandidata(f_novi_kandidati, ui->lw_novi);

    // mel bych osetrit, kdyz uz zadny kandidat neexistuje

    k->posunStav(false);

    // pridam kandidata do nove fronty
    pridejKandidata(k, f_zamitnuti_kandidati, ui->lw_zamitnuti);
}

void Firma::on_btn_n_dale_clicked()
{
    // odeberu kandidata z fronty NOVI
    Kandidat * k = odeberKandidata(f_novi_kandidati, ui->lw_novi);

    // mel bych osetrit, kdyz uz zadny kandidat neexistuje

    k->posunStav(true);

    // pridam kandidata do nove fronty
    pridejKandidata(k, f_schvaleni_kandidati, ui->lw_schvaleni);
}

void Firma::on_btn_s_zamitnout_clicked()
{
    // odeberu kandidata z fronty SCHVALENI
    Kandidat * k = odeberKandidata(f_schvaleni_kandidati, ui->lw_schvaleni);

    // mel bych osetrit, kdyz uz zadny kandidat neexistuje

    k->posunStav(false);

    // pridam kandidata do nove fronty
    pridejKandidata(k, f_zamitnuti_kandidati, ui->lw_zamitnuti);
}

void Firma::on_btn_s_dale_clicked()
{
    // odeberu kandidata z fronty SCHVALENI
    Kandidat * k = odeberKandidata(f_schvaleni_kandidati, ui->lw_schvaleni);

    // mel bych osetrit, kdyz uz zadny kandidat neexistuje

    k->posunStav(true);

    // pridam kandidata do nove fronty
    pridejKandidata(k, f_prijati_kandidati, ui->lw_prijati);
}

void Firma::on_lw_novi_itemClicked(QListWidgetItem *item)
{
    updateDetail((Kandidat *)item);
}

void Firma::on_lw_schvaleni_itemClicked(QListWidgetItem *item)
{
    updateDetail((Kandidat *)item);
}

void Firma::on_lw_prijati_itemClicked(QListWidgetItem *item)
{
    updateDetail((Kandidat *)item);
}

void Firma::on_lw_zamitnuti_itemClicked(QListWidgetItem *item)
{
    updateDetail((Kandidat *)item);
}
