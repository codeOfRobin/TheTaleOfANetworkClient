protocol RequestBehavior {

	func beforeSend()

	func afterSuccess(result: Any)

	func afterFailure(error: Error)

	func adapt(_ request: URLRequest) -> URLRequest

}