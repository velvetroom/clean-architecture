import Foundation

open class Presenter {
    private(set) var viewModels = [ObjectIdentifier:Any]()
    
    public required init() { }
    open func didLoad() { }
    open func willAppear() { }
    open func didAppear() { }
    open func shouldUpdate() { }
    
    public func update<V>(viewModel:V!) {
        var item = Item<V>()
        item.viewModel = viewModel
        item.observer = cached().observer
        viewModels[ObjectIdentifier(V.self)] = item
        DispatchQueue.main.async { item.observer?(viewModel) }
    }
    
    public func viewModel<V>(observer:@escaping((V) -> Void)) {
        var item:Item<V> = cached()
        item.observer = observer
        viewModels[ObjectIdentifier(V.self)] = item
    }
    
    private func cached<V>() -> Item<V> {
        guard let item = viewModels[ObjectIdentifier(V.self)] as? Item<V> else { return Item<V>() }
        return item
    }
}

private struct Item<V> {
    var observer:((V) -> Void)?
    var viewModel:V!
}
