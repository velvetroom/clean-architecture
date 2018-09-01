import Foundation

public class ViewModels {
    var items:[ObjectIdentifier:Any] = [:]
    
    public func update<V>(viewModel:V!) {
        var item = Item<V>()
        item.viewModel = viewModel
        item.observer = cached().observer
        items[ObjectIdentifier(V.self)] = item
        DispatchQueue.main.async { item.observer?(viewModel) }
    }
    
    public func observe<V>(observer:@escaping((V) -> Void)) {
        var item:Item<V> = cached()
        item.observer = observer
        items[ObjectIdentifier(V.self)] = item
    }
    
    private func cached<V>() -> Item<V> {
        guard let item = items[ObjectIdentifier(V.self)] as? Item<V> else { return Item<V>() }
        return item
    }
}

private struct Item<V> {
    var observer:((V) -> Void)?
    var viewModel:V!
}
