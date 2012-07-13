package com.sim.credito

import java.math.BigDecimal;
import java.util.Date;
import java.util.SortedSet;

import com.sim.catalogo.SimCatMetodoCalculo;
import com.sim.catalogo.SimCatPeriodicidad;
import com.sic.credito.RegistroTablaAmortizacion;

class Prestamo {
	
	
	String  	nombreCliente
	Date    	fechaDeSolicitud
	SimCatMetodoCalculo metodoCalculo
	BigDecimal 	montoPrestado
	BigDecimal  tasaDeInteres
	SimCatPeriodicidad  periodicidadTasa
	Long        numeroDePagos
	SimCatPeriodicidad  periodicidadPagos
	Boolean 	autorizado = true
	String  	aplicaA
	
	//SortedSet registrosTablaAmortizacion
	static hasMany = [ registrosTablaAmortizacion : RegistroTablaAmortizacion ]

	
	static constraints = {
		nombreCliente(size:1..50, unique: true, nullable: false, blank: false)
		fechaDeSolicitud(nullable: false)
		aplicaA(inList:["INDIVIDUAL", "GRUPO"] )
		metodoCalculo()
		montoPrestado scale:2, nullable:true
		tasaDeInteres scale:2, nullable:true
		periodicidadTasa()
		numeroDePagos range:1..360
		periodicidadPagos()
		autorizado()
		registrosTablaAmortizacion()
		
	}
	
	String toString() {
		"PRESTAMO ${nombreCliente}"
	}
	

	
}
