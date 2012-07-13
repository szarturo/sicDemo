
<%@ page import="com.sim.credito.Prestamo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prestamo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prestamo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombreCliente" title="${message(code: 'prestamo.nombreCliente.label', default: 'Nombre Cliente')}" />
					
						<g:sortableColumn property="fechaDeSolicitud" title="${message(code: 'prestamo.fechaDeSolicitud.label', default: 'Fecha De Solicitud')}" />
					
						<g:sortableColumn property="aplicaA" title="${message(code: 'prestamo.aplicaA.label', default: 'Aplica A')}" />
					
						<th><g:message code="prestamo.metodoCalculo.label" default="Metodo Calculo" /></th>
					
						<g:sortableColumn property="montoPrestado" title="${message(code: 'prestamo.montoPrestado.label', default: 'Monto Prestado')}" />
					
						<g:sortableColumn property="tasaDeInteres" title="${message(code: 'prestamo.tasaDeInteres.label', default: 'Tasa De Interes')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prestamoInstanceList}" status="i" var="prestamoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "nombreCliente")}</g:link></td>
					
						<td><g:formatDate date="${prestamoInstance.fechaDeSolicitud}" /></td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "aplicaA")}</td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "metodoCalculo")}</td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "montoPrestado")}</td>
					
						<td>${fieldValue(bean: prestamoInstance, field: "tasaDeInteres")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prestamoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
