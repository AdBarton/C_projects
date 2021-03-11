#ifndef FIRMA_H
#define FIRMA_H

#include <QMainWindow>
#include <QQueue>
#include <kandidat.h>

namespace Ui {
class Firma;
}

class Firma : public QMainWindow
{
    Q_OBJECT

public:
    explicit Firma(QWidget *parent = 0);
    ~Firma();

    void pridejKandidata(Kandidat * k, QQueue<Kandidat *> & fronta, QListWidget * lw);
    Kandidat * odeberKandidata(QQueue<Kandidat *> & fronta, QListWidget * lw);
    void updateDetail(Kandidat * k);

private slots:
    void on_btn_n_zamitnout_clicked();

    void on_btn_n_dale_clicked();

    void on_btn_s_zamitnout_clicked();

    void on_btn_s_dale_clicked();

    void on_lw_novi_itemClicked(QListWidgetItem *item);

    void on_lw_schvaleni_itemClicked(QListWidgetItem *item);

    void on_lw_prijati_itemClicked(QListWidgetItem *item);

    void on_lw_zamitnuti_itemClicked(QListWidgetItem *item);

private:
    Ui::Firma *ui;
    QQueue<Kandidat *> f_novi_kandidati;
    QQueue<Kandidat *> f_schvaleni_kandidati;
    QQueue<Kandidat *> f_prijati_kandidati;
    QQueue<Kandidat *> f_zamitnuti_kandidati;
};

#endif // FIRMA_H
