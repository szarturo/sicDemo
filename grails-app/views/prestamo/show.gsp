
<%@ page import="com.sim.credito.Prestamo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prestamo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prestamo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prestamo">
			
				<g:if test="${prestamoInstance?.nombreCliente}">
				<li class="fieldcontain">
					<span id="nombreCliente-label" class="property-label"><g:message code="prestamo.nombreCliente.label" default="Nombre Cliente" /></span>
					
						<span class="property-value" aria-labelledby="nombreCliente-label"><g:fieldValue bean="${prestamoInstance}" field="nombreCliente"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.fechaDeSolicitud}">
				<li class="fieldcontain">
					<span id="fechaDeSolicitud-label" class="property-label"><g:message code="prestamo.fechaDeSolicitud.label" default="Fecha De Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeSolicitud-label"><g:formatDate date="${prestamoInstance?.fechaDeSolicitud}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.aplicaA}">
				<li class="fieldcontain">
					<span id="aplicaA-label" class="property-label"><g:message code="prestamo.aplicaA.label" default="Aplica A" /></span>
					
						<span class="property-value" aria-labelledby="aplicaA-label"><g:fieldValue bean="${prestamoInstance}" field="aplicaA"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.metodoCalculo}">
				<li class="fieldcontain">
					<span id="metodoCalculo-label" class="property-label"><g:message code="prestamo.metodoCalculo.label" default="Metodo Calculo" /></span>
					
						<span class="property-value" aria-labelledby="metodoCalculo-label"><g:link controller="simCatMetodoCalculo" action="show" id="${prestamoInstance?.metodoCalculo?.id}">${prestamoInstance?.metodoCalculo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.montoPrestado}">
				<li class="fieldcontain">
					<span id="montoPrestado-label" class="property-label"><g:message code="prestamo.montoPrestado.label" default="Monto Prestado" /></span>
					
						<span class="property-value" aria-labelledby="montoPrestado-label"><g:fieldValue bean="${prestamoInstance}" field="montoPrestado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.tasaDeInteres}">
				<li class="fieldcontain">
					<span id="tasaDeInteres-label" class="property-label"><g:message code="prestamo.tasaDeInteres.label" default="Tasa De Interes" /></span>
					
						<span class="property-value" aria-labelledby="tasaDeInteres-label"><g:fieldValue bean="${prestamoInstance}" field="tasaDeInteres"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.periodicidadTasa}">
				<li class="fieldcontain">
					<span id="periodicidadTasa-label" class="property-label"><g:message code="prestamo.periodicidadTasa.label" default="Periodicidad Tasa" /></span>
					
						<span class="property-value" aria-labelledby="periodicidadTasa-label"><g:link controller="simCatPeriodicidad" action="show" id="${prestamoInstance?.periodicidadTasa?.id}">${prestamoInstance?.periodicidadTasa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.numeroDePagos}">
				<li class="fieldcontain">
					<span id="numeroDePagos-label" class="property-label"><g:message code="prestamo.numeroDePagos.label" default="Numero De Pagos" /></span>
					
						<span class="property-value" aria-labelledby="numeroDePagos-label"><g:fieldValue bean="${prestamoInstance}" field="numeroDePagos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.periodicidadPagos}">
				<li class="fieldcontain">
					<span id="periodicidadPagos-label" class="property-label"><g:message code="prestamo.periodicidadPagos.label" default="Periodicidad Pagos" /></span>
					
						<span class="property-value" aria-labelledby="periodicidadPagos-label"><g:link controller="simCatPeriodicidad" action="show" id="${prestamoInstance?.periodicidadPagos?.id}">${prestamoInstance?.periodicidadPagos?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.autorizado}">
				<li class="fieldcontain">
					<span id="autorizado-label" class="property-label"><g:message code="prestamo.autorizado.label" default="Autorizado" /></span>
					
						<span class="property-value" aria-labelledby="autorizado-label"><g:formatBoolean boolean="${prestamoInstance?.autorizado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prestamoInstance?.registrosTablaAmortizacion}">
				<li class="fieldcontain">
					<span id="registrosTablaAmortizacion-label" class="property-label"><g:message code="prestamo.registrosTablaAmortizacion.label" default="Registros Tabla Amortizacion" /></span>
					
						<g:each in="${prestamoInstance.registrosTablaAmortizacion}" var="r">
						<span class="property-value" aria-labelledby="registrosTablaAmortizacion-label"><g:link controller="registroTablaAmortizacion" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prestamoInstance?.id}" />
					<g:link class="edit" action="edit" id="${prestamoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
