##CocoaInCoffee##

CocoaInCoffee is an experimental project to use CoffeeScript in Objective-C and call Objective-C class and method in CoffeeScript when building App.

###Demo###

The first demo is a simple CoffeeScript.



    square=(x)->x\*x
    cube=(x)->square(x)*x
    square(5)

You can run this scipt and get result in Objective-C codes.

    alertView=require("UIAlertView").alloc().init()
    alertView.setTitle("Alert")
    alertView.setMessage("AlertView from CoffeeScript")
    alertView.addButtonWithTitle("OK")
    alertView.show()


The second demo is trying to show an alert view by calling Objective-C class and method in CoffeeScript with the help of [JSPatch](https://github.com/bang590/JSPatch).

This project is in the very early stage, so please forgive the mass codes.

