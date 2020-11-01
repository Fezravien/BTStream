//
//  LoginViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit
import AuthenticationServices


// Storyboard

class LoginViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding  {
    @IBOutlet weak var appleSignInButton: UIStackView!

    
    // Apple ID 로그인 버튼 생성
    func setAppleSignInButton() {
        let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
        authorizationButton.addTarget(self, action: #selector(appleSignInButtonPress), for: .touchUpInside)
        self.appleSignInButton.addArrangedSubview(authorizationButton)
    }
    // Apple Login Button Pressed
    @objc func appleSignInButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
            
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
                
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
     
        default:
            break
        }
    }
        
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppleSignInButton()
        // Do any additional setup after loading the view.
    }
}

