struct CombinedRequestBehavior: RequestBehavior {

	let behaviors: [RequestBehavior]

	func adapt(_ request: URLRequest) -> URLRequest {
		return behaviors.reduce(request) { (req, behaviour) in
			return behaviour.adapt(req)
		}
	}

	func beforeSend() {
		behaviors.forEach({ $0.beforeSend() })
	}

	func afterSuccess(result: Any) {
		behaviors.forEach({ $0.afterSuccess(result: result) })
	}

	func afterFailure(error: Error) {
		behaviors.forEach({ $0.afterFailure(error: error) })
	}
}