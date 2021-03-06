package model;
// Generated 10/07/2016 10:54:00 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Bolsa generated by hbm2java
 */
@Entity
@Table(name="bolsa"
    ,catalog="sistemasae"
)
public class Bolsa  implements java.io.Serializable {


     private Integer id;
     private Edital edital;
     private String nome;
     private String tipo;
     private String carencia;

    public Bolsa() {
    }

    public Bolsa(Edital edital, String nome, String tipo, String carencia) {
       this.edital = edital;
       this.nome = nome;
       this.tipo = tipo;
       this.carencia = carencia;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="edital_codEdital", nullable=false)
    public Edital getEdital() {
        return this.edital;
    }
    
    public void setEdital(Edital edital) {
        this.edital = edital;
    }

    
    @Column(name="nome", nullable=false, length=45)
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }

    
    @Column(name="tipo", nullable=false, length=45)
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    
    @Column(name="carencia", nullable=false, length=45)
    public String getCarencia() {
        return this.carencia;
    }
    
    public void setCarencia(String carencia) {
        this.carencia = carencia;
    }




}


