//
//  ContentView.swift
//  Shared
//
//  Created by Sudhanshu Srivastava on 17/11/21.
//

import SwiftUI
import LocalAuthentication

struct BiometricIDHandler {
    static func authenticateWithBiometrics() {
        
        let laContext = LAContext()
        
        var error: NSError?
        
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                       error: &error) {
            
            let reason = "Identify yourself!"
            
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if let authError = authenticationError {
                    
                    let error = authError as NSError
                    switch error.code {
                        
                    case LAError.systemCancel.rawValue:
                        // NOTE: This can happen due to any situation e.g. phone call or user drags notification drawer
                        break
                    case LAError.userCancel.rawValue:
                        // NOTE: User tapped cancel button
                        break
                    default:
                        // NOTE: There are several other `enum` values
                        break
                    }
                }
                
                else {
                    DispatchQueue.main.async {
                        if success {
                            
                        }
                        else {
                            
                        }
                    }
                }
            }
        }
        else {
            print(error)
        }
    }
}

struct ContentView: View {
    var body: some View {
        Button("Touch Id") {
            TouchIDHandler.authenticateWithBiometrics()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
