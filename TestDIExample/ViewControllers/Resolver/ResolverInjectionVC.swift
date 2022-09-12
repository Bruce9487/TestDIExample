//
//  ResolverInjectionVC.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/12.
//

import UIKit
import Resolver

class ResolverInjectionVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let viewModel1: XYZViewModel1 = Resolver.resolve()
        _ = viewModel1.load()
        
        let viewModel2: XYZViewModel2 = Resolver.resolve()
        _ = viewModel2.load()
        
        let viewModel3: XYZViewModel3 = Resolver.resolve()
        _ = viewModel3.load()
        
        let viewModel4: XYZViewModel4 = Resolver.resolve()
        _ = viewModel4.load(fetcher: Resolver.resolve(), service: Resolver.resolve())
        
        let viewModel5: XYZViewModel5 = Resolver.resolve()
        _ = viewModel5.load()
        
        let viewModel6: XYZViewModel6 = Resolver.resolve()
        _ = viewModel6.load()
    }
}

//MARK: 建置
protocol XYZFetching {
    func getData(_ service: XYZService) -> Data
    func getData(_ token: String) -> Data
}

class XYZService {
    
    init() { }
    
    public func decompress(_ data: Data) -> UIImage {
        print("[XYZService]: decompress_data")
        return UIImage()
    }
}

class XYZFetcher: XYZFetching {
    
    init() { }
    
    public func getData(_ service: XYZService) -> Data {
        print("[XYZFetcher]: getData_service")
        return Data()
    }
    
    public func getData(_ token: String) -> Data {
        print("[XYZFetcher]: getData_token")
        return Data()
    }
}

//https://github.com/hmlongco/Resolver/blob/master/Documentation/Injection.md#constructor
//MARK: 1. Interface Injection
//透過extension來實作Resolving這個protocol，並且在extension內實作注入方法，注入方法統一透過Resolver來回傳註冊過的物件。
class XYZViewModel1 {

    lazy var fetcher: XYZFetching = getFetcher()
    lazy var service: XYZService = getService()

    func load() -> Data {
        print("[XYZViewModel1] load")
        return fetcher.getData(service)
    }

}

extension XYZViewModel1: Resolving {
    func getFetcher() -> XYZFetching { return resolver.resolve() }
    func getService() -> XYZService { return resolver.resolve() }
}

extension Resolver {
    
    public static func registerInterfaceInjection() {
        register { XYZViewModel1() }
        register { XYZFetcher() as XYZFetching }
        register { XYZService() }
    }
}

//MARK: 2. Property Injection
class XYZViewModel2 {

    var fetcher: XYZFetching!
    var service: XYZService!

    func load() -> Data {
        print("[XYZViewModel2] load")
        return fetcher.getData(service)
    }

}

extension Resolver {
    
    public static func registerPropertyInjection() {
        
        register { XYZFetcher() as XYZFetching }
        register { XYZService() }
        
        register { XYZViewModel2() }
            .resolveProperties { (resolver, model) in
                model.fetcher = resolver.optional() // 屬性類型屬於問號＆驚嘆號要獲取實例時要使用optional()
                model.service = resolver.optional()
            }
    }
}

//MARK: 3. Constructor Injection
class XYZViewModel3 {

    private var fetcher: XYZFetching
    private var service: XYZService

    init(fetcher: XYZFetching, service: XYZService) {
        self.fetcher = fetcher
        self.service = service
    }

    func load() -> UIImage {
        print("[XYZViewModel3] load")
        let data = fetcher.getData("token")
        return service.decompress(data)
   }

}

extension Resolver {
    
    public static func registerConstructorInjection() {
        
        register { XYZViewModel3(fetcher: resolve(), service: resolve()) }
        register { XYZFetcher() as XYZFetching }
        register { XYZService() }
    }
}

//MARK: 4. Method Injection
class XYZViewModel4 {

    func load(fetcher: XYZFetching, service: XYZService) -> Data {
        print("[XYZViewModel4] load")
        return fetcher.getData(service)
    }

}

extension Resolver {
    
    public static func registerMethodInjection() {
        
        register { XYZViewModel4() }
        register { XYZFetcher() as XYZFetching }
        register { XYZService() }
    }
}

//MARK: 5. Service Locator
class XYZViewModel5 {

    var fetcher: XYZFetching = Resolver.resolve()
    var service: XYZService = Resolver.resolve()

    func load() -> Data {
        print("[XYZViewModel5] load")
        return fetcher.getData(service)
    }
}

extension Resolver {
    
    public static func registerServiceLocator() {
        
        register { XYZViewModel5() }
        register { XYZFetcher() as XYZFetching }
        register { XYZService() }
    }
}

//MARK: 6. Annotation
class XYZViewModel6 {

    @Injected var fetcher: XYZFetching
    @Injected var service: XYZService

    func load() -> Data {
        print("[XYZViewModel6] load")
        return fetcher.getData(service)
    }
}

extension Resolver {
    
    public static func registerAnnotation() {
        
        register { XYZViewModel6() }
        register { XYZFetcher() as XYZFetching }
        register { XYZService() }
    }
}
