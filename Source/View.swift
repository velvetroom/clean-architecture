import UIKit

open class View<P:Presenter>:UIViewController {
    open var presenter:P
    
    public required init() {
        presenter = P()
        super.init(nibName:nil, bundle:nil)
    }
    
    public init(presenter:P) {
        self.presenter = presenter
        super.init(nibName:nil, bundle:nil)
    }
    
    public required init?(coder:NSCoder) { return nil }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
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
