package model;
// Generated 10/07/2016 10:54:00 by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Bolsistacontemplado generated by hbm2java
 */
@Entity
@Table(name = "bolsistacontemplado", catalog = "sistemasae"
)
public class Bolsistacontemplado implements java.io.Serializable {

    private int id;
    private Edital edital;

    public Bolsistacontemplado() {
    }

    public Bolsistacontemplado(int id, Edital edital) {
        this.id = id;
        this.edital = edital;
    }

    @Id

    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "edital_codEdital", nullable = false)
    public Edital getEdital() {
        return this.edital;
    }

    public void setEdital(Edital edital) {
        this.edital = edital;
    }

}
