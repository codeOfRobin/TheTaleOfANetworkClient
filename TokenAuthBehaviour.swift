struct TokenAuthBehaviour: RequestBehavior {
	let token: String

	func adapt(_ request: URLRequest) -> URLRequest {
		var copy = request
		var headers = copy.allHTTPHeaderFields ?? [:]
		headers["Authorization"] = "Bearer \(token)"
		copy.allHTTPHeaderFields = headers
		return copy
	}
}
