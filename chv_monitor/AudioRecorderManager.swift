//
//  AudioRecorderManager.swift
//  chv_monitor
//
//  Gerenciador de gravação de áudio contínua
//

import AVFoundation
import Foundation

class AudioRecorderManager: NSObject {
    
    static let shared = AudioRecorderManager()
    
    private var audioRecorder: AVAudioRecorder?
    private var currentRecordingURL: URL?
    private var recordingStartTime: Date?
    private var segmentDuration: TimeInterval = 30 * 60 // 30 minutos em segundos
    private var segmentTimer: Timer?
    private var isRecording = false
    
    private let fileManager = FileManager.default
    private let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    private let audioFolderName = "chv_audios"
    
    private override init() {
        super.init()
        createAudioFolderIfNeeded()
        setupAudioSession()
    }
    
    // MARK: - Configuração
    
    private func setupAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth, .allowBluetoothA2DP])
            try audioSession.setActive(true)
        } catch {
            print("Erro ao configurar sessão de áudio: \(error)")
        }
    }
    
    private func createAudioFolderIfNeeded() {
        let audioFolderURL = documentsPath.appendingPathComponent(audioFolderName)
        
        if !fileManager.fileExists(atPath: audioFolderURL.path) {
            do {
                try fileManager.createDirectory(at: audioFolderURL, withIntermediateDirectories: true)
                print("Pasta chv_audios criada")
            } catch {
                print("Erro ao criar pasta: \(error)")
            }
        }
    }
    
    // MARK: - Gravação
    
    func startRecording() {
        guard !isRecording else { return }
        
        // Verificar permissão
        guard AVAudioSession.sharedInstance().recordPermission == .granted else {
            print("Permissão de microfone não concedida")
            return
        }
        
        // Verificar espaço em disco
        guard FileManagerHelper.hasEnoughDiskSpace() else {
            print("Espaço em disco insuficiente")
            cleanupOldRecordings()
            return
        }
        
        // Criar URL do arquivo
        let fileName = generateFileName()
        let audioFolderURL = documentsPath.appendingPathComponent(audioFolderName)
        currentRecordingURL = audioFolderURL.appendingPathComponent(fileName)
        
        guard let recordingURL = currentRecordingURL else { return }
        
        // Configurações de gravação
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
            AVEncoderBitRateKey: 128000
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: recordingURL, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
            
            recordingStartTime = Date()
            isRecording = true
            
            // Iniciar timer para segmento
            startSegmentTimer()
            
            // Manter app ativo em background
            ensureBackgroundRecording()
            
            NotificationCenter.default.post(name: NSNotification.Name("RecordingStatusChanged"), object: nil)
            print("Gravação iniciada: \(fileName)")
            
        } catch {
            print("Erro ao iniciar gravação: \(error)")
            isRecording = false
        }
    }
    
    func stopRecording() {
        guard isRecording else { return }
        
        segmentTimer?.invalidate()
        segmentTimer = nil
        
        audioRecorder?.stop()
        audioRecorder = nil
        
        // Finalizar nome do arquivo com hora de término
        if let url = currentRecordingURL, let startTime = recordingStartTime {
            let endTime = Date()
            let finalFileName = generateFinalFileName(startTime: startTime, endTime: endTime)
            let finalURL = url.deletingLastPathComponent().appendingPathComponent(finalFileName)
            
            do {
                if fileManager.fileExists(atPath: url.path) {
                    try fileManager.moveItem(at: url, to: finalURL)
                    print("Arquivo renomeado: \(finalFileName)")
                }
            } catch {
                print("Erro ao renomear arquivo: \(error)")
            }
        }
        
        currentRecordingURL = nil
        recordingStartTime = nil
        isRecording = false
        
        NotificationCenter.default.post(name: NSNotification.Name("RecordingStatusChanged"), object: nil)
        print("Gravação parada")
    }
    
    // MARK: - Timer de Segmento
    
    private func startSegmentTimer() {
        segmentTimer = Timer.scheduledTimer(withTimeInterval: segmentDuration, repeats: false) { [weak self] _ in
            self?.finishCurrentSegmentAndStartNew()
        }
    }
    
    private func finishCurrentSegmentAndStartNew() {
        stopRecording()
        
        // Pequeno delay antes de iniciar nova gravação
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            if UserDefaults.standard.bool(forKey: "recording_enabled") {
                self?.startRecording()
            }
        }
    }
    
    // MARK: - Background Recording
    
    func ensureBackgroundRecording() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setActive(true)
        } catch {
            print("Erro ao manter sessão ativa: \(error)")
        }
    }
    
    // MARK: - Geração de Nomes de Arquivo
    
    private func generateFileName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd_HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        return "chv_\(timestamp).m4a"
    }
    
    private func generateFinalFileName(startTime: Date, endTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.string(from: startTime)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let startTimeStr = timeFormatter.string(from: startTime)
        let endTimeStr = timeFormatter.string(from: endTime)
        
        return "chv_\(date)_\(startTimeStr)_\(endTimeStr).m4a"
    }
    
    // MARK: - Limpeza de Arquivos Antigos
    
    private func cleanupOldRecordings() {
        let audioFolderURL = documentsPath.appendingPathComponent(audioFolderName)
        
        guard let files = try? fileManager.contentsOfDirectory(at: audioFolderURL, includingPropertiesForKeys: [.creationDateKey]) else {
            return
        }
        
        // Ordenar por data de criação (mais antigos primeiro)
        let sortedFiles = files.sorted { url1, url2 in
            let date1 = (try? url1.resourceValues(forKeys: [.creationDateKey]).creationDate) ?? Date.distantPast
            let date2 = (try? url2.resourceValues(forKeys: [.creationDateKey]).creationDate) ?? Date.distantPast
            return date1 < date2
        }
        
        // Deletar arquivos mais antigos até ter espaço suficiente
        for file in sortedFiles {
            if FileManagerHelper.hasEnoughDiskSpace() {
                break
            }
            
            do {
                try fileManager.removeItem(at: file)
                print("Arquivo antigo deletado: \(file.lastPathComponent)")
            } catch {
                print("Erro ao deletar arquivo: \(error)")
            }
        }
    }
    
    // MARK: - Informações
    
    func getLastRecordingInfo() -> String? {
        let audioFolderURL = documentsPath.appendingPathComponent(audioFolderName)
        
        guard let files = try? fileManager.contentsOfDirectory(at: audioFolderURL, includingPropertiesForKeys: [.creationDateKey]) else {
            return nil
        }
        
        let sortedFiles = files.sorted { url1, url2 in
            let date1 = (try? url1.resourceValues(forKeys: [.creationDateKey]).creationDate) ?? Date.distantPast
            let date2 = (try? url2.resourceValues(forKeys: [.creationDateKey]).creationDate) ?? Date.distantPast
            return date1 > date2
        }
        
        return sortedFiles.first?.lastPathComponent
    }
    
    func isCurrentlyRecording() -> Bool {
        return isRecording
    }
}

// MARK: - AVAudioRecorderDelegate

extension AudioRecorderManager: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("Gravação finalizada com sucesso")
        } else {
            print("Gravação finalizada com erro")
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("Erro na gravação: \(error?.localizedDescription ?? "Desconhecido")")
        
        // Tentar reiniciar gravação
        if UserDefaults.standard.bool(forKey: "recording_enabled") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                self?.startRecording()
            }
        }
    }
}

