//
//  ViewController.swift
//  DYSwiftApp
//
//  Created by hua on 2022/7/6.
//

import UIKit
import DingYue_iOS_SDK

class ViewController: UIViewController{
    lazy var purchaseBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        btn.center = self.view.center
        btn.setTitle("go Purchase", for: [])
        btn.setTitleColor(UIColor.black, for: [])
        btn.addTarget(self, action: #selector(goPurchase), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(purchaseBtn)
    }

    @objc func goPurchase(){
        //自定义内购项
        let product = Subscription(type: "CONSUMABLE", name: "消耗品2", platformProductId: "com.dingyue.consumable2", price: "12.99", currencyCode: "USD",countryCode: "USD")
        let product2 = Subscription(type: "CONSUMABLE", name: "hello test", platformProductId: "com.dingyue.consumable1", appleSubscriptionGroupId: "", description: "消耗", period: "MONTH", price: "34.0", currencyCode: "USD", countryCode: "USD", priceTier: [], gracePeriod: true, icon: "", renewPriceChange: true)

        /*
         *
         */
        //显示sdk内购页
        DYMobileSDK.showVisualPaywall(products: [product,product2], rootController: self) { receipt, purchaseResult, error in
            if error == nil {
                print("(DingYueSDK): 购买成功！")
            }
        }
    }
}
extension ViewController:DYMPayWallActionDelegate {
    public func clickTermsAction(baseViewController: UIViewController) {
        //do some customed thing
        let vc = LBWebViewController.init()
        vc.url = "https://www.caretiveapp.com/tou/1549634329/"
        vc.title = NSLocalizedString("Terms_of_Service", comment: "")
        let nav = UINavigationController.init(rootViewController: vc)
        baseViewController.present(nav, animated: true)
    }

    public func clickPrivacyAction(baseViewController: UIViewController) {
        let vc = LBWebViewController.init()
        vc.url = "https://www.caretiveapp.com/pp/1549634329/"
        vc.title = NSLocalizedString("Privacy_Policy", comment: "")
        let nav = UINavigationController.init(rootViewController: vc)
        baseViewController.present(nav, animated: true)
    }

    func clickCloseButton(baseViewController: UIViewController) {
        print("点击内购页上的关闭按钮")
    }
    func payWallDidAppear(baseViewController: UIViewController) {
        print("内购页显示")
    }
    func payWallDidDisappear(baseViewController: UIViewController) {
        print("内购页消失")
    }
}

