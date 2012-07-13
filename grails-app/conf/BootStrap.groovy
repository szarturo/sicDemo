import com.sim.catalogo.*

class BootStrap {

	def init = { servletContext ->

		new SimCatMetodoCalculo(claveMetodoCalculo:  '01',
				nombreMetodoCalculo: 'PAGOS IGUALES DE CAPITAL E INTERES',
				descripcionMetodoCalculo: 'INTERES GLOBAL',
				).save(failOnError: true)

		new SimCatMetodoCalculo(claveMetodoCalculo:  '02',
				nombreMetodoCalculo: 'PAGOS IGUALES DE CAPITAL, CALCULO DE INTERES SOBRE EL SALDO INSOLUTO',
				descripcionMetodoCalculo: 'INTERES SOBRE SALDO INSOLUTO',
				).save(failOnError: true)

		new SimCatMetodoCalculo(claveMetodoCalculo:  '05',
				nombreMetodoCalculo: 'PAGOS IGUALES DE CAPITAL MAS INTERES, CALCULO DE INTERES SOBRE EL SALDO INSOLUTO',
				descripcionMetodoCalculo: 'SIN RECALCULO DE INTERESES POR PAGOS ADELANTADOS, CONOCIDO COMO METODO FRANCES',
				).save(failOnError: true)

		new SimCatMetodoCalculo(claveMetodoCalculo:  '06',
				nombreMetodoCalculo: 'PAGOS IGUALES DE CAPITAL MAS INTERES, CALCULO DE INTERES SOBRE EL SALDO INSOLUTO RI',
				descripcionMetodoCalculo: 'RECALCULO DE INTERESES POR PAGOS ADELANTADOS, CONOCIDO COMO METODO FRANCES',
				).save(failOnError: true)
	}
	def destroy = {
	}
}
