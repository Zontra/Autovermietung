public class LKW extends KFZ{
    private final int nutzlast;

    public LKW(String kennzeichen, int km_stand, int km_seitInspektion, int nutzlast) {
        super(kennzeichen, km_stand, km_seitInspektion);
        this.nutzlast = nutzlast;
    }

    @Override
    public boolean inspektionfaellig() {
        return getKm_seitInspektion() >= 20_000;
    }

    @Override
    public int berechnetevermietungskosten(int ausgelieheneTage) {
        if (nutzlast < 1800) {
            return ausgelieheneTage * 60;
        } else {
            return ausgelieheneTage * 100;
        }
    }

    @Override
    public String toString() {
        return "LKW{" +
                "nutzlast=" + nutzlast +
                '}';
    }
}
