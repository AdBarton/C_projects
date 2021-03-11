#ifndef KANDIDAT_H
#define KANDIDAT_H
#include <QListWidgetItem>
#include <QString>

class Kandidat : public QListWidgetItem
{
public:
    QString k_jmeno;
    QString k_prijmeni;
    QString k_bydliste;
    QString k_schopnosti;

    QString k_stav;
    int k_narozen;

    QString k_zobraz; // vypis do WidgetListu (GUI)

    QString k_foto;

    Kandidat(QString jmeno, QString prijmeni, int narozen, QString foto);
    QString toString();
    QString stav(); // zjisti aktualni stav
    void posunStav(bool uspech);
    int vek(); // vrati aktualni vek
};

#endif // KANDIDAT_H
