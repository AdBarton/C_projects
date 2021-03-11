#include "kandidat.h"

Kandidat::Kandidat(QString jmeno, QString prijmeni, int narozen, QString foto)
{
    k_jmeno = jmeno;
    k_prijmeni = prijmeni;
    k_narozen = narozen;
    setText(toString()); // nastavime string pro zobrazeni v QListWidget

    k_stav = "novy";
    k_foto = foto;
}

QString Kandidat::toString()
{
    k_zobraz = k_jmeno + " " + k_prijmeni
                + " (" + QString::number(2019-k_narozen) + " let)";
    return k_zobraz;
}

QString Kandidat::stav()
{
    return k_stav;
}

void Kandidat::posunStav(bool uspech)
{
    if(uspech == false){
        k_stav = "zamitnut";
        return; // konec funkce
    }
    if(k_stav == "novy"){
        k_stav = "schvalen";
    } else {
        if(k_stav == "schvalen"){
           k_stav = "prijat";
        }
    }
}

int Kandidat::vek()
{
    return 2019 - k_narozen;
}
