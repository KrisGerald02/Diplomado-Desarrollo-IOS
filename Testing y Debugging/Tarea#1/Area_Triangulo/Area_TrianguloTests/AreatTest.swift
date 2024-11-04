import XCTest

class TriangleAreaCalculatorTests: XCTestCase {

    var triangleAreaCalculator: TriangleAreaCalculator!

    override func setUp() {
        super.setUp()
        triangleAreaCalculator = TriangleAreaCalculator()
    }

    override func tearDown() {
        triangleAreaCalculator = nil
        super.tearDown()
    }

    func testCalculateArea() {
        let result = triangleAreaCalculator.calculateArea(base: 10, height: 5)
        XCTAssertEqual(result, 25, "El área del triángulo con base 10 y altura 5 debería ser 25")
    }
}
