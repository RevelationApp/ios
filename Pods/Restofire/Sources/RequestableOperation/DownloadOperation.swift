//
//  DownloadOperation.swift
//  Restofire
//
//  Created by Rahul Katariya on 28/01/18.
//  Copyright © 2018 Restofire. All rights reserved.
//

import Foundation
import Alamofire

/// An NSOperation that executes the `Downloadable` asynchronously.
public class DownloadOperation<R: Downloadable>: NetworkOperation<R> {
    let downloadable: R
    let downloadRequest: () -> DownloadRequest
    let completionQueue: DispatchQueue
    let completionHandler: ((DownloadResponse<R.Response>) -> Void)?

    /// Intializes an download operation.
    ///
    /// - Parameters:
    ///   - downloadable: The `Downloadable`.
    ///   - request: The request closure.
    ///   - completionHandler: The async completion handler called
    ///     when the request is completed
    public init(
        downloadable: R,
        request: @escaping (() -> DownloadRequest),
        downloadProgressHandler: ((Progress) -> Void, queue: DispatchQueue?)? = nil,
        completionQueue: DispatchQueue,
        completionHandler: ((DownloadResponse<R.Response>) -> Void)?
    ) {
        self.downloadable = downloadable
        self.downloadRequest = request
        self.completionQueue = completionQueue
        self.completionHandler = completionHandler
        super.init(
            requestable: downloadable,
            request: request,
            downloadProgressHandler: downloadProgressHandler
        )
    }

    override func handleDownloadResponse(_ response: DownloadResponse<R.Response>) {
        let request = self.request as! DownloadRequest
        var res = response

        downloadable.delegates.forEach {
            res = $0.process(request, requestable: downloadable, response: res)
        }
        res = downloadable.process(request, requestable: downloadable, response: res)

        completionQueue.async {
            self.completionHandler?(res)
        }

        switch res.result {
        case .success(let value):
            self.downloadable.request(self, didCompleteWithValue: value)
        case .failure(let error):
            self.downloadable.request(self, didFailWithError: error)
        }

        self.isFinished = true
    }

    override func downloadResponseResult(response: DownloadResponse<URL?>) -> DownloadResponse<R.Response> {
        let result = Result<R.Response, RFError>.serialize { try downloadable.responseSerializer
            .serializeDownload(
                request: response.request,
                response: response.response,
                fileURL: response.fileURL,
                error: response.error
            )
        }

        var responseResult: RFResult<R.Response>!

        switch result {
        case .success(let value):
            responseResult = value
        case .failure(let error):
            assertionFailure(error.localizedDescription)
            responseResult = RFResult<R.Response>.failure(error)
        }

        let downloadResponse = DownloadResponse<R.Response>(
            request: response.request,
            response: response.response,
            fileURL: response.fileURL,
            resumeData: response.resumeData,
            metrics: response.metrics,
            serializationDuration: response.serializationDuration,
            result: responseResult
        )
        return downloadResponse
    }

    /// Creates a copy of self
    open override func copy() -> NetworkOperation<R> {
        let operation = DownloadOperation(
            downloadable: downloadable,
            request: downloadRequest,
            completionQueue: completionQueue,
            completionHandler: completionHandler
        )
        return operation
    }
}
