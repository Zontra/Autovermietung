public class PKW extends KFZ{
    int sitzplaetze;

    public PKW(String kennzeichen, int km_stand, int km_seitInspektion, int sitzpaeltze) {
        super(kennzeichen, km_stand, km_seitInspektion);
        this.sitzplaetze = sitzpaeltze;
    }

    @Override
    public boolean inspektionfaellig() {
        return getKm_seitInspektion() >= 30_000;
    }

    @Override
    public int berechnetevermietungskosten(int ausgelieheneTage) {
        return ausgelieheneTage * 40;
    }

    @Override
    public String toString() {
        return "PKW{" +
                "sitzplaetze=" + sitzplaetze +
                '}';
    }
}
