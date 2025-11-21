//
//  SettingsObserver.swift
//  chv_monitor
//
//  Observa mudanças nas configurações do sistema
//

import Foundation

class SettingsObserver {
    
    static let shared = SettingsObserver()
    private var observer: NSObjectProtocol?
    
    private init() {
        setupObserver()
    }
    
    private func setupObserver() {
        observer = NotificationCenter.default.addObserver(
            forName: UserDefaults.didChangeNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleSettingsChange()
        }
    }
    
    private func handleSettingsChange() {
        let isEnabled = UserDefaults.standard.bool(forKey: "recording_enabled")
        let audioRecorder = AudioRecorderManager.shared
        
        if isEnabled {
            if !audioRecorder.isCurrentlyRecording() {
                audioRecorder.startRecording()
            }
        } else {
            if audioRecorder.isCurrentlyRecording() {
                audioRecorder.stopRecording()
            }
        }
        
        // Atualizar status nas configurações
        updateSettingsDisplay()
    }
    
    private func updateSettingsDisplay() {
        let audioRecorder = AudioRecorderManager.shared
        let isRecording = audioRecorder.isCurrentlyRecording()
        
        UserDefaults.standard.set(
            isRecording ? "Ativo" : "Inativo",
            forKey: "recording_status"
        )
        
        if let lastRecording = audioRecorder.getLastRecordingInfo() {
            UserDefaults.standard.set(lastRecording, forKey: "last_recording")
        }
        
        UserDefaults.standard.set(
            FileManagerHelper.getAvailableDiskSpace(),
            forKey: "disk_space"
        )
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}

