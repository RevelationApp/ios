import Foundation
import Quick
import Nimble
import Restofire
import Alamofire
@testable import RevelationAPI

class TvCreditsGETServiceSpec: RevelationAPISpec {
    override func spec() {
        super.spec()
        describe("TvCreditsGETService") {
            it("request should succeed") {
                // Given
                waitUntil(timeout: self.timeout) { done in

                    let request = TvCreditsGETService(tvId: "63351")

                    // When
                    do {
                        let operation = try request.execute { value, response in
                            defer { done() }

                            // Then
                            if let statusCode = response.response?.statusCode,
                                statusCode != 200 {
                                fail("Response status code should be 200")
                            }

                            expect(value).toNot(beNil())
                            expect(response.request).toNot(beNil())
                            expect(response.response).toNot(beNil())
                            expect(response.data).toNot(beNil())
                            expect(response.error).to(beNil())

                            print(response.result.value ?? "None")

                        }
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
            it("request should succeed") {
                // Given
                waitUntil(timeout: self.timeout) { done in

                    let request = TvCreditsGETService(tvId: "80968")

                    // When
                    do {
                        let operation = try request.execute { value, response in
                            defer { done() }

                            // Then
                            if let statusCode = response.response?.statusCode,
                                statusCode != 200 {
                                fail("Response status code should be 200")
                            }

                            expect(value).toNot(beNil())
                            expect(response.request).toNot(beNil())
                            expect(response.response).toNot(beNil())
                            expect(response.data).toNot(beNil())
                            expect(response.error).to(beNil())

                            print(response.result.value ?? "None")

                        }
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
            it("request should succeed") {
                // Given
                waitUntil(timeout: self.timeout) { done in

                    let request = TvCreditsGETService(tvId: "84956")

                    // When
                    do {
                        let operation = try request.execute { value, response in
                            defer { done() }

                            // Then
                            if let statusCode = response.response?.statusCode,
                                statusCode != 200 {
                                fail("Response status code should be 200")
                            }

                            expect(value).toNot(beNil())
                            expect(response.request).toNot(beNil())
                            expect(response.response).toNot(beNil())
                            expect(response.data).toNot(beNil())
                            expect(response.error).to(beNil())

                            print(response.result.value ?? "None")

                        }
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
            it("request should succeed") {
                // Given
                waitUntil(timeout: self.timeout) { done in

                    let request = TvCreditsGETService(tvId: "68925")

                    // When
                    do {
                        let operation = try request.execute { value, response in
                            defer { done() }

                            // Then
                            if let statusCode = response.response?.statusCode,
                                statusCode != 200 {
                                fail("Response status code should be 200")
                            }

                            expect(value).toNot(beNil())
                            expect(response.request).toNot(beNil())
                            expect(response.response).toNot(beNil())
                            expect(response.data).toNot(beNil())
                            expect(response.error).to(beNil())

                            print(response.result.value ?? "None")

                        }
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
        }
    }
}
