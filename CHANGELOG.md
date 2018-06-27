# Change log


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
