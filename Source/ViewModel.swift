import Foundation

public class ViewModels {
    var items:[ObjectIdentifier:Any] = [:]
    
    public func update<V:ViewModel>(viewModel:V) {
        var item = Item<V>()
        item.viewModel = viewModel
        item.observer = self.item().observer
        items[ObjectIdentifier(V.self)] = item
        DispatchQueue.main.async { item.observer?(viewModel) }
    }
    
    public func observe<V:ViewModel>(observer:@escaping((V) -> Void)) {
        var item:Item<V> = self.item()
        item.observer = observer
        items[ObjectIdentifier(V.self)] = item
    }
    
    private func item<V:ViewModel>() -> Item<V> {
        guard let item = items[ObjectIdentifier(V.self)] as? Item<V> else { return Item<V>() }
        return item
    }
}

public protocol ViewModel {
    init()
}

private struct Item<V:ViewModel> {
    var observer:((V) -> Void)?
    var viewModel = V()
}
