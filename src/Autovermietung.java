import java.util.ArrayList;
import java.util.List;

public class Autovermietung {
    private List<KFZ> fahrzeuge = new ArrayList<>();

    public void addFahrzeug(KFZ kfz) {
        fahrzeuge.add(kfz);
    }

    public void alleFahrzeuge() {
        for (KFZ kfz : fahrzeuge) {
            System.out.println(kfz);
        }
    }

    public void alleFahrzeugenachTyp(String typ) {
        for (KFZ kfz : fahrzeuge) {
            if ((kfz instanceof PKW && typ.equals("PKW")) || (kfz instanceof LKW && typ.equals("LKW"))) {
                System.out.println(kfz);
            }
        }
    }

    public void verlieheneFahrzeuge() {
        for (KFZ kfz : fahrzeuge) {
            if (kfz.isVermietet()) {
                System.out.println(kfz);
            }
        }
    }

    public void ausleihen(String kennzeichen) {
        KFZ tmp = getKFZbyKennzeichen(kennzeichen);

        if(!tmp.isVermietet()) {
            tmp.setVermietet(true);
            System.out.println("Fahrzeug mit dem Kennzeichen: " + kennzeichen + " wurde vermietet!");
        } else {
            System.out.println("Fahrzeug mit dem Kennzeichen: " + kennzeichen + " ist schon vermietet");
        }
    }

    public void rueckgabe(int ausgelieheneTage, String kennzeichen, int gefahreneKM) {
        KFZ tmp = getKFZbyKennzeichen(kennzeichen);
        int kosten = tmp.berechnetevermietungskosten(ausgelieheneTage);

        if(tmp.isVermietet()) {
            tmp.setVermietet(false);
            tmp.setKm_stand(tmp.getKm_stand() + gefahreneKM);
            tmp.setKm_seitInspektion(tmp.getKm_seitInspektion() + gefahreneKM);

            System.out.println("Fahrzeug mit dem Kennzeichen: " + kennzeichen + " wurde zurückgegeben\n" + "Rechnungsbetrag: " + kosten + "€");

            if (tmp.inspektionfaellig()) {
                System.out.println("Fahrzeug mit dem Kennzeichen: " + kennzeichen + " braucht eine Inspektion");
            }
        } else {
            System.out.println("Fahrzeug mit dem Kennzeichen: " + kennzeichen + " wird nicht vermietet");
        }
    }

    public KFZ getKFZbyKennzeichen(String kennzeichen) {
        for (KFZ kfz : fahrzeuge) {
            if (kfz.getKennzeichen().equals(kennzeichen)) {
                return kfz;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        Autovermietung autovermietung = getAutovermietung();

        autovermietung.verlieheneFahrzeuge();

        System.out.println("Fuhrpark: ");

        autovermietung.alleFahrzeuge();

        System.out.println("\nPKW: ");
        autovermietung.alleFahrzeugenachTyp("PKW");

        System.out.println("\nLKW: ");

        autovermietung.alleFahrzeugenachTyp("LKW");

        System.out.println("\nEinzelnes Fahrzeug: \n" + autovermietung.getKFZbyKennzeichen("KR12345"));


        System.out.println("\nKFZ Ausleihen: ");

        autovermietung.ausleihen("KR12345");

        autovermietung.ausleihen("PL12345");
        autovermietung.ausleihen("PL12345");

        System.out.println("\nVerliehene Fahrzeuge: ");
        autovermietung.verlieheneFahrzeuge();

        System.out.println("\nRueckgabe: ");

        autovermietung.rueckgabe(12, "KR12345", 40_000);
    }

    private static Autovermietung getAutovermietung() {
        Autovermietung autovermietung = new Autovermietung();

        PKW pkw1 = new PKW("KR12345", 10_000, 2_000, 5);
        PKW pkw2 = new PKW("W12345", 101_000, 15_000, 2);
        LKW lkw1 = new LKW("PL12345", 100_000, 14_000, 1_700);
        LKW lkw2 = new LKW("AM12345", 230_000, 6_000, 2_000);

        autovermietung.addFahrzeug(pkw1);
        autovermietung.addFahrzeug(pkw2);
        autovermietung.addFahrzeug(lkw1);
        autovermietung.addFahrzeug(lkw2);

        return autovermietung;
    }
}
