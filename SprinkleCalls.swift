import UIKit

class AwesomeViewController: UIViewController {
	
	override func viewDidLoad() {
		// TODO: do cool UI

		Alamofire.request("your URL/api/v1/foos/bars").validate().responseJSON {
			response in
			//do stuff
		}
	}
}