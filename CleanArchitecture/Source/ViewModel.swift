import Foundation

open class ViewModel {
    var properties:[ObjectIdentifier:Any]
    
    public init() {
        self.properties = [:]
    }
    
    public func update<ViewModelProperty:ViewModelProtocol>(property:ViewModelProperty) {
        let property:ViewModelProperty = self.observedProperty(property:property)
        let identifier:ObjectIdentifier = ObjectIdentifier(type(of:property))
        self.properties[identifier] = property
        property.notifyObserver()
    }
    
    public func property<ViewModelProperty:ViewModelProtocol>() -> ViewModelProperty {
        let identifier:ObjectIdentifier = ObjectIdentifier(ViewModelProperty.self)
        guard
            let viewModel:ViewModelProperty = self.properties[identifier] as? ViewModelProperty
        else { return ViewModelProperty() }
        return viewModel
    }
    
    private func observedProperty<ViewModelProperty:ViewModelProtocol>(
        property:ViewModelProperty) -> ViewModelProperty {
        var property:ViewModelProperty = property
        if property.observing == nil {
            let previousProperty:ViewModelProperty = self.property()
            if previousProperty.observing != nil {
                property.observing = previousProperty.observing
            }
        }
        return property
    }
}
