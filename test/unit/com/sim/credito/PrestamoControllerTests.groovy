package com.sim.credito



import org.junit.*
import grails.test.mixin.*

@TestFor(PrestamoController)
@Mock(Prestamo)
class PrestamoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prestamo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.prestamoInstanceList.size() == 0
        assert model.prestamoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.prestamoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.prestamoInstance != null
        assert view == '/prestamo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prestamo/show/1'
        assert controller.flash.message != null
        assert Prestamo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prestamo/list'


        populateValidParams(params)
        def prestamo = new Prestamo(params)

        assert prestamo.save() != null

        params.id = prestamo.id

        def model = controller.show()

        assert model.prestamoInstance == prestamo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prestamo/list'


        populateValidParams(params)
        def prestamo = new Prestamo(params)

        assert prestamo.save() != null

        params.id = prestamo.id

        def model = controller.edit()

        assert model.prestamoInstance == prestamo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prestamo/list'

        response.reset()


        populateValidParams(params)
        def prestamo = new Prestamo(params)

        assert prestamo.save() != null

        // test invalid parameters in update
        params.id = prestamo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prestamo/edit"
        assert model.prestamoInstance != null

        prestamo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prestamo/show/$prestamo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prestamo.clearErrors()

        populateValidParams(params)
        params.id = prestamo.id
        params.version = -1
        controller.update()

        assert view == "/prestamo/edit"
        assert model.prestamoInstance != null
        assert model.prestamoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prestamo/list'

        response.reset()

        populateValidParams(params)
        def prestamo = new Prestamo(params)

        assert prestamo.save() != null
        assert Prestamo.count() == 1

        params.id = prestamo.id

        controller.delete()

        assert Prestamo.count() == 0
        assert Prestamo.get(prestamo.id) == null
        assert response.redirectedUrl == '/prestamo/list'
    }
}
