import Alamofire


class APIClient {
	func getFoos(@escaping completion: [Foo] -> Void) {
		Alamofire.request("your URL/api/v1/foos/bars").validate().responseJSON {
			response in
			//do stuff
			completion(result)
		}
	}
}