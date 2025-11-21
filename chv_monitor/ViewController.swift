//
//  ViewController.swift
//  chv_monitor
//
//  Tela principal mínima do app
//

import UIKit

class ViewController: UIViewController {
    
    private var statusLabel: UILabel!
    private var lastRecordingLabel: UILabel!
    private var diskSpaceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupObservers()
        updateUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Status Label
        statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 16, weight: .medium)
        view.addSubview(statusLabel)
        
        // Last Recording Label
        lastRecordingLabel = UILabel()
        lastRecordingLabel.translatesAutoresizingMaskIntoConstraints = false
        lastRecordingLabel.textAlignment = .center
        lastRecordingLabel.font = .systemFont(ofSize: 14)
        lastRecordingLabel.textColor = .secondaryLabel
        view.addSubview(lastRecordingLabel)
        
        // Disk Space Label
        diskSpaceLabel = UILabel()
        diskSpaceLabel.translatesAutoresizingMaskIntoConstraints = false
        diskSpaceLabel.textAlignment = .center
        diskSpaceLabel.font = .systemFont(ofSize: 12)
        diskSpaceLabel.textColor = .tertiaryLabel
        view.addSubview(diskSpaceLabel)
        
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            lastRecordingLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            lastRecordingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastRecordingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lastRecordingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            diskSpaceLabel.topAnchor.constraint(equalTo: lastRecordingLabel.bottomAnchor, constant: 20),
            diskSpaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupObservers() {
        // Observar mudanças nas configurações
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateUI),
            name: UserDefaults.didChangeNotification,
            object: nil
        )
        
        // Observar mudanças no status de gravação
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(recordingStatusChanged),
            name: NSNotification.Name("RecordingStatusChanged"),
            object: nil
        )
    }
    
    @objc private func updateUI() {
        let isEnabled = UserDefaults.standard.bool(forKey: "recording_enabled")
        statusLabel.text = isEnabled ? "● Gravação Ativa" : "○ Gravação Inativa"
        statusLabel.textColor = isEnabled ? .systemGreen : .systemGray
        
        // Última gravação
        if let lastRecording = AudioRecorderManager.shared.getLastRecordingInfo() {
            lastRecordingLabel.text = "Última: \(lastRecording)"
        } else {
            lastRecordingLabel.text = "Nenhuma gravação ainda"
        }
        
        // Espaço em disco
        let diskSpace = FileManagerHelper.getAvailableDiskSpace()
        diskSpaceLabel.text = "Espaço disponível: \(diskSpace)"
    }
    
    @objc private func recordingStatusChanged() {
        updateUI()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

