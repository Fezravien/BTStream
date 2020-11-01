//
//  LoginViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit
//import AuthenticationServices
//import GoogleSignIn

// Storyboard

//class LoginViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding, GIDSignInDelegate  {
//    @IBOutlet weak var appleSignInButton: UIStackView!
//    // Storyboard
//    @IBOutlet weak var googleSignInButton: GIDSignInButton!
//    
//    // Apple ID 로그인 버튼 생성
//    func setAppleSignInButton() {
//        let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
//        authorizationButton.addTarget(self, action: #selector(appleSignInButtonPress), for: .touchUpInside)
//        self.appleSignInButton.addArrangedSubview(authorizationButton)
//    }
//    // 구글 로그인 버튼 설정
//    func setGoogleSignInButton() {
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().delegate = self
//        googleSignInButton.style = .standard // .wide .iconOnly
//    }
//    // 연동을 시도 했을때 불러오는 메소드
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if let error = error {
//            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//                print("The user has not signed in before or they have since signed out.")
//            } else {
//                print("\(error.localizedDescription)")
//            }
//            return
//        }
//            
//        // 사용자 정보 가져오기
//        if let userId = user.userID,                  // For client-side use only!
//            let idToken = user.authentication.idToken, // Safe to send to the server
//            let fullName = user.profile.name,
//            let givenName = user.profile.givenName,
//            let familyName = user.profile.familyName,
//            let email = user.profile.email {
//                
//            print("Token : \(idToken)")
//            print("User ID : \(userId)")
//            print("User Email : \(email)")
//            print("User Name : \((fullName))")
//     
//        } else {
//            print("Error : User Data Not Found")
//        }
//    }
//        
//    // 구글 로그인 연동 해제했을때 불러오는 메소드
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//        print("Disconnect")
//    }
//    // Apple Login Button Pressed
//    @objc func appleSignInButtonPress() {
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let request = appleIDProvider.createRequest()
//        request.requestedScopes = [.fullName, .email]
//            
//        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
//        authorizationController.performRequests()
//    }
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.view.window!
//    }
//    // Apple ID 연동 성공 시
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        switch authorization.credential {
//        // Apple ID
//        case let appleIDCredential as ASAuthorizationAppleIDCredential:
//                
//            // 계정 정보 가져오기
//            let userIdentifier = appleIDCredential.user
//            let fullName = appleIDCredential.fullName
//            let email = appleIDCredential.email
//                
//            print("User ID : \(userIdentifier)")
//            print("User Email : \(email ?? "")")
//            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
//     
//        default:
//            break
//        }
//    }
//        
//    // Apple ID 연동 실패 시
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        // Handle error.
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setAppleSignInButton()
//        setGoogleSignInButton()
//        // Do any additional setup after loading the view.
//    }
//}
//
