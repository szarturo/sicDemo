package com.sim.credito

import org.springframework.dao.DataIntegrityViolationException

class PrestamoController {
	
	def prestamoService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [prestamoInstanceList: Prestamo.list(params), prestamoInstanceTotal: Prestamo.count()]
    }

    def create() {
        [prestamoInstance: new Prestamo(params)]
    }

    def save() {
        def prestamoInstance = new Prestamo(params)
        if (!prestamoInstance.save(flush: true)) {
            render(view: "create", model: [prestamoInstance: prestamoInstance])
            return
        }
        println "SE CREO EL PRESTAMO"
		//IMPLEMENTAR LA CREACION DE LA TABLA DE AMORTIZACION
		
		println ("Resultado Servicio: " + prestamoService.miMetodo())
		
		prestamoService.generaTablaAmortizacion(prestamoInstance)
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), prestamoInstance.id])
        redirect(action: "show", id: prestamoInstance.id)
    }

    def show() {
        def prestamoInstance = Prestamo.get(params.id)
        if (!prestamoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])
            redirect(action: "list")
            return
        }

        [prestamoInstance: prestamoInstance]
    }

    def edit() {
        def prestamoInstance = Prestamo.get(params.id)
        if (!prestamoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])
            redirect(action: "list")
            return
        }

        [prestamoInstance: prestamoInstance]
    }

    def update() {
        def prestamoInstance = Prestamo.get(params.id)
        if (!prestamoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (prestamoInstance.version > version) {
                prestamoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prestamo.label', default: 'Prestamo')] as Object[],
                          "Another user has updated this Prestamo while you were editing")
                render(view: "edit", model: [prestamoInstance: prestamoInstance])
                return
            }
        }

        prestamoInstance.properties = params

        if (!prestamoInstance.save(flush: true)) {
            render(view: "edit", model: [prestamoInstance: prestamoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), prestamoInstance.id])
        redirect(action: "show", id: prestamoInstance.id)
    }

    def delete() {
        def prestamoInstance = Prestamo.get(params.id)
        if (!prestamoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            prestamoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
