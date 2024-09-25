//
//  LittleLemonTests.swift
//  LittleLemonTests
//
//  Created by Bianca Curutan on 9/24/24.
//

import Testing
import XCTest
@testable import LittleLemon

struct LittleLemonTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    @Test func testEmptyMenu() {
        let viewModel = HomeViewModel()
        XCTAssert(viewModel.menuItems.count == 0)
        XCTAssertTrue(viewModel.menuItems.count == 0)
        XCTAssertEqual(viewModel.menuItems.count, 0)
    }

    @Test func testUserDefaults() {
        UserDefaults.standard.set("Bianca", forKey: "FirstName")
        UserDefaults.standard.set("Curutan", forKey: "LastName")

        DispatchQueue.main.async {
            let onboarding = OnboardingViewController()
            XCTAssert(onboarding.firstNameField.text == "Bianca")
            XCTAssert(onboarding.lastNameField.text == "Curutan")
            XCTAssert(onboarding.emailField.text?.isEmpty == true)
        }
    }

    @Test func testDecodingError() throws {
        /// When the Data initializer is throwing an error, the test will fail.
        let url = Bundle.main.url(forResource: "error", withExtension: "json")
        let jsonData = try Data(contentsOf: url!)

        /// The `XCTAssertNoThrow` can be used to get extra context about the throw
        XCTAssertThrowsError(try JSONDecoder().decode(JSONMenu.self, from: jsonData))
    }
}
