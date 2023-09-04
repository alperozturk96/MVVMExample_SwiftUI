//
//  CommentViewModelTests.swift
//  MVVMExampleTests
//
//  Created by Alper Ozturk on 3.09.2023.
//

import XCTest
@testable import MVVMExample

final class CommentViewModelTests: XCTestCase {
    
    var sut: CommentViewModel?
    
    override func setUp() {
        super.setUp()
        let mockRepository = MockCommentProvider()
        sut = CommentViewModel(repository: mockRepository)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchComments_WhenGivenMockData_ShouldReturnComments() async {
        MockURLProtocol.requestHandler = { request in
            let responseData = "[{\"postId\":1,\"id\":1,\"name\":\"idlaboreexetquamlaborum\",\"email\":\"expected@email.com\",\"body\":\"laudantiumenimquasiestquidemmagnamvoluptateipsameos\\ntemporaquonecessitatibus\\ndolorquamautemquasi\\nreiciendisetnamsapienteaccusantium\"}]".data(using: .utf8)!
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
            return (response, responseData)
        }
        
        let expectation = XCTestExpectation(description: "Network Request")
        
        await sut?.fetchComments()
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 5)
    
        let expectedValue = "expected@email.com"
        XCTAssertEqual(sut?.comments.first?.email, expectedValue)
    }
}
