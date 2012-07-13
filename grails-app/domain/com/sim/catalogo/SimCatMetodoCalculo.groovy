package com.sim.catalogo

class SimCatMetodoCalculo {

	String  claveMetodoCalculo
	String  nombreMetodoCalculo
	String	descripcionMetodoCalculo

    static constraints = {
		claveMetodoCalculo(size:5..15, unique: true, nullable: false, blank: false)
		nombreMetodoCalculo(size:5..150, unique: true, nullable: false, blank: false)
		descripcionMetodoCalculo(size:0..300)
    }
	
	String toString() {
		"${nombreMetodoCalculo}"
	}
}
