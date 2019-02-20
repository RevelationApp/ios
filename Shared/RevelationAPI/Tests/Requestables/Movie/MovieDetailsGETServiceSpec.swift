import Foundation
import Quick
import Nimble
import Restofire
import Alamofire
@testable import RevelationAPI

class MovieDetailsGETServiceSpec: RevelationAPISpec {
    override func spec() {
        describe("MovieDetailsGETService") {
            it("request should succeed") {
                // Given
                waitUntil(timeout: self.timeout) { done in

                    let request = MovieDetailsGETService(movieId: "335983")

                    // When
                    do {
                        let operation = try request.enqueue() { response in
                            defer { done() }

                            // Then
                            guard let statusCode = response.response?.statusCode,
                                statusCode >= 200 && statusCode < 300 else {
                                    fail("Response status code should be 200"); return
                            }
                            expect(response.value).toNot(beNil())
                            expect(response.request).toNot(beNil())
                            expect(response.response).toNot(beNil())
                            expect(response.data).toNot(beNil())
                            expect(response.error).to(beNil())
                        }
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
            it("request should succeed") {
                // Given
                waitUntil(timeout: self.timeout) { done in

                    let request = MovieDetailsGETService(movieId: "307081")

                    // When
                    do {
                        let operation = try request.enqueue() { response in
                            defer { done() }

                            // Then
                            guard let statusCode = response.response?.statusCode,
                                statusCode >= 200 && statusCode < 300 else {
                                    fail("Response status code should be 200"); return
                            }
                            expect(response.value).toNot(beNil())
                            expect(response.request).toNot(beNil())
                            expect(response.response).toNot(beNil())
                            expect(response.data).toNot(beNil())
                            expect(response.error).to(beNil())
                        }
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
            it("request should succeed") {
                // Given
                waitUntil(timeout: self.timeout) { done in

                    let request = MovieDetailsGETService(movieId: "65")

                    // When
                    do {
                        let operation = try request.enqueue() { response in
                            defer { done() }

                            // Then
                            guard let statusCode = response.response?.statusCode,
                                statusCode >= 200 && statusCode < 300 else {
                                    fail("Response status code should be 200"); return
                            }
                            expect(response.value).toNot(beNil())
                            expect(response.request).toNot(beNil())
                            expect(response.response).toNot(beNil())
                            expect(response.data).toNot(beNil())
                            expect(response.error).to(beNil())
                        }
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
        }
    }
}
