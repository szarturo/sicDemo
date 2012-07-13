package com.sic.credito

import java.math.BigDecimal;
import java.util.Date;

class RegistroTablaAmortizacion {

	Integer     numeroDePago
	Date    	fechaDePago
	BigDecimal  interes
	BigDecimal  amortizacionCapital
	BigDecimal  pagoTotal
	BigDecimal  saldoInsoluto
	
	static constraints = {
		numeroDePago range:1..360
		fechaDePago(nullable: true)
		interes scale:2, nullable:true
		amortizacionCapital scale:2, nullable:true
		pagoTotal scale:2, nullable:true
		saldoInsoluto scale:2, nullable:true
		
	}
	
	String toString() {
		"PAGO ${numeroDePago}"
	}
	
	

}
