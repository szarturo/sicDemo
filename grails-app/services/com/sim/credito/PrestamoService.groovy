package com.sim.credito

import com.sic.credito.*

class PrestamoService {

	static transactional = true

	Boolean miMetodo() {
		return true
	}


	Boolean generaTablaAmortizacion(Prestamo prestamoInstance ) {

		/*
		 prestamoInstance.addToRegistrosTablaAmortizacion(new RegistroTablaAmortizacion(numeroDePago:2,interes:5))
		 .addToRegistrosTablaAmortizacion(new RegistroTablaAmortizacion(numeroDePago:3,interes:6))
		 .addToRegistrosTablaAmortizacion(new RegistroTablaAmortizacion(numeroDePago:4,interes:7))
		 .save()
		 */

		def NumeroPagos = 1
		BigDecimal saldoInsoluto = prestamoInstance.montoPrestado
		(1..prestamoInstance.numeroDePagos).each{

			String sMetodoCalculo = prestamoInstance.metodoCalculo.claveMetodoCalculo

			BigDecimal Capital = prestamoInstance.montoPrestado

			String sDiasPeriodicidadTasa = prestamoInstance.periodicidadTasa.clavePeriodicidad
			
			String sDiasPeriodicidadPago = prestamoInstance.periodicidadPagos.clavePeriodicidad
			
			println "Metodo Calculo = ${sMetodoCalculo}, Periodicidad Tasa = ${sDiasPeriodicidadTasa}, PeriodicidadPago = ${sDiasPeriodicidadPago}"

			Integer iDiasPeriodicidadTasa = prestamoInstance.periodicidadTasa.numeroDias
			Integer iDiasPeriodicidadPago = prestamoInstance.periodicidadPagos.numeroDias
			
			
			BigDecimal Tasa = (prestamoInstance.tasaDeInteres/100) * (iDiasPeriodicidadPago / iDiasPeriodicidadTasa)
			
			//Amortización de capital o pago de Capital
			BigDecimal Amortizacion = 0
			//Pago de interes
			BigDecimal PagoIntereses = 0
			BigDecimal CuotaTotal = 0
			
			
			if (sMetodoCalculo.equals("01")){
				println "Método pago = Pagos iguales de capital e Interes"
				Amortizacion = Capital / prestamoInstance.numeroDePagos
				PagoIntereses = Capital * Tasa
				CuotaTotal = Amortizacion + PagoIntereses
				saldoInsoluto = saldoInsoluto - Amortizacion
				println "*************************"
				println"""
					NumeroPago: ${NumeroPagos}
					Interes: ${PagoIntereses}
					amortizacionCapital: ${Amortizacion}
					pagoTotal: ${CuotaTotal}
					saldoInsoluto: ${saldoInsoluto}
				"""
				
			}
			if (sMetodoCalculo.equals("02")){
				log.info "Método pago = Pagos iguales de capital, cálculo de intereses sobre el saldo insoluto"
				Amortizacion = Capital / NumeroPagos
			}
			

			prestamoInstance.addToRegistrosTablaAmortizacion(new RegistroTablaAmortizacion(numeroDePago:NumeroPagos,interes:PagoIntereses,amortizacionCapital:Amortizacion,pagoTotal:CuotaTotal,saldoInsoluto:saldoInsoluto)).save()
			NumeroPagos++
		}


		return true
	}
}
