public abstract class KFZ {
    private String kennzeichen;
    private boolean vermietet;
    private int km_stand;
    private int km_seitInspektion;


    public KFZ(String kennzeichen, int km_stand, int km_seitInspektion) {
        this.kennzeichen = kennzeichen;
        this.vermietet = false;
        this.km_stand = km_stand;
        this.km_seitInspektion = km_seitInspektion;
    }

    public abstract boolean inspektionfaellig();

    public abstract int berechnetevermietungskosten(int ausgelieheneTage);


    public String getKennzeichen() {
        return kennzeichen;
    }

    public boolean isVermietet() {
        return vermietet;
    }

    public void setVermietet(boolean vermietet) {
        this.vermietet = vermietet;
    }

    public int getKm_stand() {
        return km_stand;
    }

    public void setKm_stand(int km_stand) {
        this.km_stand = km_stand;
    }

    public int getKm_seitInspektion() {
        return km_seitInspektion;
    }

    public void setKm_seitInspektion(int km_seitInspektion) {
        this.km_seitInspektion = km_seitInspektion;
    }

    @Override
    public String toString() {
        return "KFZ{" +
                "kennzeichen='" + kennzeichen + '\'' +
                ", vermietet=" + vermietet +
                ", km_stand=" + km_stand +
                ", km_seitInspektion=" + km_seitInspektion +
                '}';
    }
}
