//
//  AppDelegate.swift
//  chv_monitor
//
//  Created for iOS 18
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var audioRecorder: AudioRecorderManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configurar sessão de áudio para background
        configureAudioSession()
        
        // Solicitar permissão de microfone
        requestMicrophonePermission()
        
        // Inicializar gerenciador de gravação
        audioRecorder = AudioRecorderManager.shared
        
        // Inicializar observador de configurações
        _ = SettingsObserver.shared
        
        // Configurar window
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        // Iniciar gravação se estiver ativada nas configurações
        if UserDefaults.standard.bool(forKey: "recording_enabled") {
            audioRecorder?.startRecording()
        }
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Manter gravação ativa em background
        audioRecorder?.ensureBackgroundRecording()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Verificar se gravação ainda está ativa
        if UserDefaults.standard.bool(forKey: "recording_enabled") {
            audioRecorder?.startRecording()
        }
    }
    
    private func configureAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            try audioSession.setActive(true)
        } catch {
            print("Erro ao configurar sessão de áudio: \(error)")
        }
    }
    
    private func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            if granted {
                print("Permissão de microfone concedida")
            } else {
                print("Permissão de microfone negada")
            }
        }
    }
}

