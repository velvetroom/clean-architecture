import UIKit

open class View<P:Presenter>:UIViewController {
    open var presenter:P
    
    public required init() {
        presenter = P()
        presenter.interactor = P.I()
        presenter.interactor.delegate = presenter
        super.init(nibName:nil, bundle:nil)
        presenter.viewModels = ViewModels()
    }
    
    public init(presenter:P) {
        self.presenter = presenter
        super.init(nibName:nil, bundle:nil)
        presenter.viewModels = ViewModels()
    }
    
    public required init?(coder:NSCoder) { return nil }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
        presenter.interactor.didLoad()
    }
    
    open override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    open override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
}
