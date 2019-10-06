//
//  OpenWeatherAPiTests.swift
//  MeteoTests
//
//  Created by Fromage Charley on 06/10/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

@testable import OpenWeatherMapKit
import XCTest

class OpenWeatherAPiTests: XCTestCase
{
  // MARK: - Subject under test

  var sut: OpenWeatherAPI!
  var testOrders: [Order]!

  // MARK: - Test lifecycle

  override func setUp()
  {
    super.setUp()
    setupOrdersAPI()
  }

  override func tearDown()
  {
    super.tearDown()
  }

  // MARK: - Test setup

  func setupOrdersAPI()
  {
    sut = OrdersAPI()

    testOrders = [Seeds.Orders.amy, Seeds.Orders.bob]
  }

  // MARK: - Test CRUD operations - Optional error

  func testFetchOrdersShouldReturnListOfOrders_OptionalError()
  {
    // Given

    // When

    // Then
  }
}
