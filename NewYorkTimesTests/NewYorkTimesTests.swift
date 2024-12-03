//
//  NewYorkTimesTests.swift
//  NewYorkTimesTests
//
//  Created by Belen on 03/12/2024.
//

import XCTest
@testable import NewYorkTimes

class ArticlesResponseTests: XCTestCase {
    func testDecodeArticlesResponse() {
        let jsonString = """
        {
            "status": "OK",
            "copyright": "Copyright (c) 2024 The New York Times Company. All Rights Reserved.",
            "num_results": 1,
            "results": [
                {
                    "uri": "nyt://article/2b81f6c3-7630-5f16-bbe8-a20d7c104627",
                    "url": "https://www.nytimes.com/2024/12/01/opinion/pride-prejudice-jane-austen.html",
                    "id": 100000009833294,
                    "asset_id": 100000009833294,
                    "source": "New York Times",
                    "published_date": "2024-12-01",
                    "updated": "2024-12-02 12:44:14",
                    "section": "Opinion",
                    "subsection": "",
                    "nytdsection": "opinion",
                    "adx_keywords": "Books and Literature;Women and Girls;Austen, Jane;Hadlow, Janice",
                    "column": null,
                    "byline": "By Paula Byrne",
                    "type": "Article",
                    "title": "Mary Is the Bennet Sister We Need",
                    "abstract": "Jane Austen, one of the most beloved novelists in the English language, must have had some sympathy for a girl who liked a good book.",
                    "des_facet": ["Books and Literature", "Women and Girls"],
                    "org_facet": [],
                    "per_facet": ["Austen, Jane", "Hadlow, Janice"],
                    "geo_facet": [],
                    "media": [
                        {
                            "type": "image",
                            "subtype": "photo",
                            "caption": "",
                            "copyright": "Photo Illustration by The New York Times. Photo: Focus Films, via Everett Collection",
                            "approved_for_syndication": 1,
                            "media-metadata": [
                                {
                                    "url": "https://static01.nyt.com/images/2024/12/01/opinion/01byrne/01byrne-thumbStandard-v2.jpg",
                                    "format": "Standard Thumbnail",
                                    "height": 75,
                                    "width": 75
                                }
                            ]
                        }
                    ],
                    "eta_id": 0
                }
            ]
        }
        """

        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTFail("Failed to create JSON data")
            return
        }

        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(ArticlesResponse.self, from: jsonData)

            XCTAssertEqual(response.status, "OK")
            XCTAssertEqual(response.numResults, 1)
            XCTAssertEqual(response.results.first?.title, "Mary Is the Bennet Sister We Need")
            XCTAssertEqual(response.results.first?.byline, "By Paula Byrne")
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
    
    func testDecodeInvalidJSON() {
        let invalidJsonString = """
        {
            "status": "OK",
            "num_results": "invalid"
        }
        """

        guard let jsonData = invalidJsonString.data(using: .utf8) else {
            XCTFail("Failed to create JSON data")
            return
        }

        do {
            _ = try JSONDecoder().decode(ArticlesResponse.self, from: jsonData)
            XCTFail("Decoding should have failed for invalid JSON")
        } catch {
            XCTAssert(true, "Expected failure for invalid JSON")
        }
    }
}
