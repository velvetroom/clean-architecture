# Change log


## Version 3.1

- Clean Presenter
Removed unsued boiler plate.


## Version 3.0

- Removed Interactor
In order to avoid code duplication and complexity now Presenter should be in charge
of interacting directly with Business Logic.


## Version 2.1

- Removed Interactor Generic from View Signature
Interactor can now be inferred from Presenter


## Version 2.0

- Remove ViewModels
Now Presenter will be in charge of the view models.
- Replace protocol by class
Presenter and Interactor are now classes that you can extend.
This will reduce the boiler plate and it will lead to an easier and smoother implementation.


## Version 1.15

- Removing clutter to make code more compact


## Version 1.14

- Remove prefix header from pod


## Version 1.13

- Defined modules for supporting modular headers 
- Deploy as static framework


## Version 1.12

- Renamed PresenterProtocol as Presenter
- Renamed InteractorProtocol as Interactor
- Renamed presenter as delegate in Interactor
- Removed Content from View
- Removed Router associated type
- Refacfored ViewModel


## Version 1.11

- Removed orientation change methods from Presenter
- Renamed InteractorDelegateProtocol to InteractorDelegate


## Version 1.10

- Renamed Transition associated type as Router
- Removed abstract methods from View; use UIView methods instead


## Version 1.9

- Update to Swift 4.2


## Version 1.8

- Refactor ViewModel
- Remove ViewProtocol
- Interactor is now the owner of Transition
- Remove helper properties


## Version 1.7

- Replace class constraint in protocols for AnyObject


## Version 1.6

- Remove optional from StartTransition in PresenterProtocol


## Version 1.5

- Removed ViewDelegateProtocol
- Added class constraint to InteractorProtocol


## Version 1.4

- Removed unnecessary transition protocol


## Version 1.3

- Removed constrain from transition associated type
   You can assign your own TransitionProtocol now, not just a concrete type


## Version 1.2

- Added TransitionProtocol as an associatedtype for PresenterProtocol
  Clients should be able to extend TransitonProtocol
  Presenter will own a weak reference to transition
  
- Remove InteractorProtocol from View Generic signature
   It can be infered from PresenterProtocol  


## Version 1.1

- Removed transition protocol


## Version 1.0

- Added demo app
- Added CI supported by Bitrise
