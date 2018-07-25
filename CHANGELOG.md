# Change log


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
