//
//  AppDelegate+Injection.swift
//  TestDIExample
//
//  Created by APP技術部-陳冠志 on 2022/9/12.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    //第一次被要求解析服務時都會自動調用此方法
    public static func registerAllServices() {
    
        //1. 註冊
        registerResolverRegitsterExampleVC()
        
        //2. 註冊同類型
        registerResolverMutiSameServiceVC()

        //3. 參數注入
        registerResolverParameterInjectionVC()
        
        //4. 依賴注入
        registerInterfaceInjection()
        registerPropertyInjection()
        registerConstructorInjection()
        registerMethodInjection()
        registerServiceLocator()
        registerAnnotation()
    }
}


