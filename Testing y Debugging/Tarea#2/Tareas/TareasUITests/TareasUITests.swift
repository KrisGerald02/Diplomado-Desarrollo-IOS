//
//  TareasUITests.swift
//  TareasUITests
//
//  Created by Geraldine on 11/11/24.
//

import XCTest

final class TareasUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
    }
    //MARK: ViewController
    func testLoginElementsExists(){
        
        let usernameTextField = app.textFields["userTextField"]
        let passwordSecureField = app.textFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]
        let registerButton = app.buttons["registerButton"]
        
        XCTAssertTrue(usernameTextField.exists, "El campo de Usuario no existe")
        XCTAssertTrue(passwordSecureField.exists, "El campo de password no existe")
        XCTAssertTrue(loginButton.exists, "El boton login no existe")
        XCTAssertTrue(registerButton.exists, "El boton de registrar no existe")
        
        
    }
    func testLoginIsHittable(){
        let usernameTextField = app.textFields["userTextField"]
        let passwordSecureField = app.textFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]
        let registerButton = app.buttons["registerButton"]
        
        XCTAssertTrue(usernameTextField.isHittable, "El campo de Usuario no es interactuable")
        XCTAssertTrue(passwordSecureField.isHittable, "El campo de contrase no es interactuable")
        XCTAssertTrue(loginButton.isHittable, "El boton login no es interactuable")
        XCTAssertTrue(registerButton.isHittable, "El boton de registrar no es interactuable")
    }
    
    //MARK: RegisterViewController
    func testRegisterElementsExists(){
        let registerLoginButton = app.buttons["Register"]
        XCTAssertTrue(registerLoginButton.exists, "El botón de registrar no existe en Login")
        registerLoginButton.tap()
        
        let registerViewButton = app.buttons["registerViewButton"]
        let nameTextField = app.textFields["nameTextField"]
        let userIDTextField = app.textFields["userIDTextField"]
        let phoneTextField = app.textFields["phoneTextField"]
        let passwordRegisterTextField = app.textFields["passwordRegisterTextField"]
        let repeatPasswordTextField = app.textFields["repeatPasswordTextField"]
        
        XCTAssertTrue(registerViewButton.exists, "El boton de registrar no existe")
        
        XCTAssertTrue(nameTextField.exists, "El campo de nombre no existe")
        XCTAssertTrue(userIDTextField.exists, "El campo de usuario no existe")
        XCTAssertTrue(phoneTextField.exists, "El campo de telefono no existe")
        XCTAssertTrue(passwordRegisterTextField.exists, "El campo de password no existe")
        XCTAssertTrue(repeatPasswordTextField.exists, "El campo de password no existe")
        
    }
    func testRegisterIsHittable(){
        let registerLoginButton = app.buttons["Register"]
        XCTAssertTrue(registerLoginButton.exists, "El botón de registrar no existe en Login")
        registerLoginButton.tap()
        
        let registerButton = app.buttons["registerViewButton"]
        let nameTextField = app.textFields["nameTextField"]
        let userIDTextField = app.textFields["userIDTextField"]
        let phoneTextField = app.textFields["phoneTextField"]
        let passwordRegisterTextField = app.textFields["passwordRegisterTextField"]
        let repeatPasswordTextField = app.textFields["repeatPasswordTextField"]
        
        XCTAssertTrue(registerButton.isHittable, "El boton de registrar no existe")
        XCTAssertTrue(nameTextField.isHittable, "El campo de nombre no es interactuable")
        XCTAssertTrue(userIDTextField.isHittable, "El campo de usuario no es interactuable")
        XCTAssertTrue(phoneTextField.isHittable, "El campo de teléfono no es interactuable")
        XCTAssertTrue(passwordRegisterTextField.isHittable, "El campo de password no es interactuable")
        XCTAssertTrue(repeatPasswordTextField.isHittable, "El campo de repetir password no es interactuable")
    }
    // MARK: WelcomeViewController
    func testWelcomeElementsExists(){
        let registerLoginButton = app.buttons["Login"]
        XCTAssertTrue(registerLoginButton.exists, "El botón de registrar no existe en Login")
        registerLoginButton.tap()
        let welcomeImage = app.images["welcomeImage"]
        XCTAssertTrue(welcomeImage.exists, "La imagen no existe")
    }
    
    func testSwipeUpAndSwipeDown(){
        let registerLoginButton = app.buttons["Login"]
        XCTAssertTrue(registerLoginButton.exists, "El botón de registrar no existe en Login")
        registerLoginButton.tap()
        
        let tableView = app.tables["WelcomeTableViewCell"]
        XCTAssertTrue(tableView.exists, "La tableView Existe")
        
        let firstCell = tableView.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists, "La primera celda existe")
        
        tableView.swipeUp()
        
        let lastCell = tableView.cells.element(boundBy: 18)
        XCTAssertTrue(lastCell.exists,"La ultima celda es visible")
        
        tableView.swipeDown()
        
        XCTAssertTrue(firstCell.isHittable, "La primera celda no es interactuable después del swipe down")

    }
    
    override func tearDownWithError() throws {
    }

}
