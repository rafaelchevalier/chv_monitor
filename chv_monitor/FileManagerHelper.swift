//
//  FileManagerHelper.swift
//  chv_monitor
//
//  Helper para gerenciamento de arquivos e espaço em disco
//

import Foundation

class FileManagerHelper {
    
    private static let minimumFreeSpace: Int64 = 1 * 1024 * 1024 * 1024 // 1GB em bytes
    
    static func getAvailableDiskSpace() -> String {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        guard let attributes = try? FileManager.default.attributesOfFileSystem(forPath: documentsPath.path),
              let freeSpace = attributes[.systemFreeSize] as? Int64 else {
            return "Desconhecido"
        }
        
        return formatBytes(freeSpace)
    }
    
    static func hasEnoughDiskSpace() -> Bool {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        guard let attributes = try? FileManager.default.attributesOfFileSystem(forPath: documentsPath.path),
              let freeSpace = attributes[.systemFreeSize] as? Int64 else {
            return false
        }
        
        return freeSpace >= minimumFreeSpace
    }
    
    static func formatBytes(_ bytes: Int64) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useGB, .useMB]
        formatter.countStyle = .file
        return formatter.string(fromByteCount: bytes)
    }
    
    static func getTotalRecordingsSize() -> Int64 {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFolderURL = documentsPath.appendingPathComponent("chv_audios")
        
        guard let files = try? FileManager.default.contentsOfDirectory(at: audioFolderURL, includingPropertiesForKeys: [.fileSizeKey]) else {
            return 0
        }
        
        var totalSize: Int64 = 0
        for file in files {
            if let size = try? file.resourceValues(forKeys: [.fileSizeKey]).fileSize {
                totalSize += Int64(size)
            }
        }
        
        return totalSize
    }
}

