import Alamofire


class APIClient {

    var counter = 0 {
        didSet {
            // show indicator if counter is > 0, else hide
        }
    }


	  func getFoos(@escaping completion: [Foo] -> Void) {

        counter += 1

		    Alamofire.request("your URL/api/v1/foos/bars").validate().responseJSON {
			      response in

            counter -= 1

			      //do stuff
			      completion(result)
		    }
	  }
}
