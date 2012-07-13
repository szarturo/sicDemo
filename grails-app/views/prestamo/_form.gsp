<%@ page import="com.sim.credito.Prestamo" %>



<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'nombreCliente', 'error')} required">
	<label for="nombreCliente">
		<g:message code="prestamo.nombreCliente.label" default="Nombre Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCliente" maxlength="50" required="" value="${prestamoInstance?.nombreCliente}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'fechaDeSolicitud', 'error')} required">
	<label for="fechaDeSolicitud">
		<g:message code="prestamo.fechaDeSolicitud.label" default="Fecha De Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeSolicitud" precision="day"  value="${prestamoInstance?.fechaDeSolicitud}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'aplicaA', 'error')} ">
	<label for="aplicaA">
		<g:message code="prestamo.aplicaA.label" default="Aplica A" />
		
	</label>
	<g:select name="aplicaA" from="${prestamoInstance.constraints.aplicaA.inList}" value="${prestamoInstance?.aplicaA}" valueMessagePrefix="prestamo.aplicaA" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'metodoCalculo', 'error')} required">
	<label for="metodoCalculo">
		<g:message code="prestamo.metodoCalculo.label" default="Metodo Calculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="metodoCalculo" name="metodoCalculo.id" from="${com.sim.catalogo.SimCatMetodoCalculo.list()}" optionKey="id" required="" value="${prestamoInstance?.metodoCalculo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'montoPrestado', 'error')} ">
	<label for="montoPrestado">
		<g:message code="prestamo.montoPrestado.label" default="Monto Prestado" />
		
	</label>
	<g:field type="number" name="montoPrestado" step="0.01" value="${prestamoInstance.montoPrestado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'tasaDeInteres', 'error')} ">
	<label for="tasaDeInteres">
		<g:message code="prestamo.tasaDeInteres.label" default="Tasa De Interes" />
		
	</label>
	<g:field type="number" name="tasaDeInteres" step="0.01" value="${prestamoInstance.tasaDeInteres}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'periodicidadTasa', 'error')} required">
	<label for="periodicidadTasa">
		<g:message code="prestamo.periodicidadTasa.label" default="Periodicidad Tasa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="periodicidadTasa" name="periodicidadTasa.id" from="${com.sim.catalogo.SimCatPeriodicidad.list()}" optionKey="id" required="" value="${prestamoInstance?.periodicidadTasa?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'numeroDePagos', 'error')} required">
	<label for="numeroDePagos">
		<g:message code="prestamo.numeroDePagos.label" default="Numero De Pagos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="numeroDePagos" from="${1..360}" class="range" required="" value="${fieldValue(bean: prestamoInstance, field: 'numeroDePagos')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'periodicidadPagos', 'error')} required">
	<label for="periodicidadPagos">
		<g:message code="prestamo.periodicidadPagos.label" default="Periodicidad Pagos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="periodicidadPagos" name="periodicidadPagos.id" from="${com.sim.catalogo.SimCatPeriodicidad.list()}" optionKey="id" required="" value="${prestamoInstance?.periodicidadPagos?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'autorizado', 'error')} ">
	<label for="autorizado">
		<g:message code="prestamo.autorizado.label" default="Autorizado" />
		
	</label>
	<g:checkBox name="autorizado" value="${prestamoInstance?.autorizado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: prestamoInstance, field: 'registrosTablaAmortizacion', 'error')} ">
	<label for="registrosTablaAmortizacion">
		<g:message code="prestamo.registrosTablaAmortizacion.label" default="Registros Tabla Amortizacion" />
		
	</label>
	<g:select name="registrosTablaAmortizacion" from="${com.sic.credito.RegistroTablaAmortizacion.list()}" multiple="multiple" optionKey="id" size="5" value="${prestamoInstance?.registrosTablaAmortizacion*.id}" class="many-to-many"/>
</div>

