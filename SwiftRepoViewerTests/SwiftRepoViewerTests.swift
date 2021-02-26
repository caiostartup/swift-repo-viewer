//
//  SwiftRepoViewerTests.swift
//  SwiftRepoViewerTests
//
//  Created by Caio Mansho on 25/02/21.
//

import XCTest
import SwiftRepoViewer
@testable import SwiftRepoViewer

class SwiftRepoViewerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSwiftCellViewModel() {
        let issue = Issue(
            url: "",
            htmlUrl: nil,
            id: 0,
            title: "Title",
            body: "body",
            user: nil,
            state: State.open,
            createdAt: Date())
        let vm = IssueCellViewModel(issue)
                
        XCTAssertTrue(vm.labelStateValue() == State.open.getValue())
        XCTAssertTrue(vm.labelTitleValue() == "Title" )
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
