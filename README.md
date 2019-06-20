# Get-All-Controllers-From-Bundle

This little Extension of Bundle can help you out to get all the ViewControllers from the main app. Let say our app uses more than 100 controllers and if we want to see all the controllers in a tableView so this simple Bundle extension can help you out very easily. It helps in dubugging a specific controller that is open on some specific use case so simple create a list of all controllers and push onto that through the dependency injection.👍😊


```
extension Bundle {
    
     func retrieveAllControllers() -> [String] {  
        guard let bundlePath = self.executablePath else {return []}
        var viewControllers = [String]()
        var size:UInt32 = 0
         let classes = objc_copyClassNamesForImage(bundlePath, &size)
         for indx in 0..<size {
            if let className = classes?[Int(indx)],
                let name = NSString.init(utf8String: className) as String?,
                NSClassFromString(name) is UIViewController.Type {
                viewControllers.append(name)
            }
        }
        return viewControllers
    }
}
```
