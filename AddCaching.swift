import Alamofire


class APIClient {


    var cache: [String: Any] = [:]

    var counter = 0 {
        didSet {
            // show indicator if counter is > 0, else hide
        }
    }


    func loggingRequest(request) {
        // log request
    }


    func loggingResponse(response) {
        // log response 
    }


	  func getFoos(@escaping completion: [Foo] -> Void) {

        counter += 1

        guard cacheCondition else {
            //call completion with cached value
        }

		    let req = Alamofire.request("your URL/api/v1/foos/bars").validate().responseJSON {
			      response in

            counter -= 1

            loggingResponse(response)

            // store in cache

			      //do stuff
			      completion(result)
		    }

        loggingRequest(req)
	  }
}
