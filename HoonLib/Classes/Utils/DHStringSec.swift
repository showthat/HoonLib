//
//  DHStringSec.swift
//  
//
//  Created by showthat on 17/09/2019.
//

import CryptoSwift



/*
 enum CryptoAlgorithm {
 case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
 
 var HMACAlgorithm: CCHmacAlgorithm {
 var result: Int = 0
 switch self {
 case .MD5:      result = kCCHmacAlgMD5
 case .SHA1:     result = kCCHmacAlgSHA1
 case .SHA224:   result = kCCHmacAlgSHA224
 case .SHA256:   result = kCCHmacAlgSHA256
 case .SHA384:   result = kCCHmacAlgSHA384
 case .SHA512:   result = kCCHmacAlgSHA512
 }
 return CCHmacAlgorithm(result)
 }
 
 var digestLength: Int {
 var result: Int32 = 0
 switch self {
 case .MD5:      result = CC_MD5_DIGEST_LENGTH
 case .SHA1:     result = CC_SHA1_DIGEST_LENGTH
 case .SHA224:   result = CC_SHA224_DIGEST_LENGTH
 case .SHA256:   result = CC_SHA256_DIGEST_LENGTH
 case .SHA384:   result = CC_SHA384_DIGEST_LENGTH
 case .SHA512:   result = CC_SHA512_DIGEST_LENGTH
 }
 return Int(result)
 }
 }
 */


/*
 Hash (Digest)
 MD5 | SHA1 | SHA224 | SHA256 | SHA384 | SHA512 | SHA3
 
 Cyclic Redundancy Check (CRC)
 CRC32 | CRC32C | CRC16
 
 Cipher
 AES-128, AES-192, AES-256 | ChaCha20 | Rabbit | Blowfish
 
 Message authenticators
 Poly1305 | HMAC (MD5, SHA1, SHA256) | CMAC
 */

extension String {
    
    func hmac(key: String = "1234567890") -> String? {
        do {    
            let encrypted = try HMAC(key: key, variant: .sha256).authenticate(self.bytes)
            let encryptedData = Data(encrypted)
            return encryptedData.toHexString()
        } catch {
            return nil
        }
    }
    
    func aesEncrypt(key: String, iv: String) -> String? {
        
        let data = self.data(using: .utf8)!
        
        var encrypted:[UInt8]?
        do {    
            encrypted = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs7).encrypt([UInt8](data))
        } catch {
            return nil
        }
        
        let encryptedData = Data(encrypted!)
        return encryptedData.base64EncodedString()
        
    }
    
    func aesDecrypt(key: String, iv: String) -> String? {
        
        let data = Data(base64Encoded: self)!
        
        var decrypted:[UInt8]?
        do {    
            decrypted = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs7).decrypt([UInt8](data))
            
        } catch  {
            return nil
        }
        
        let decryptedData = Data(decrypted!)
        return String(bytes: decryptedData.bytes, encoding: .utf8)
        
    }
    
    
    
    /*
     func hmac(algorithm: CryptoAlgorithm = .SHA256, key: String = "1234567890") -> String {
     let str = self.cString(using: String.Encoding.utf8)
     let strLen = Int(self.lengthOfBytes(using: String.Encoding.utf8))
     let digestLen = algorithm.digestLength
     let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
     let keyStr = key.cString(using: String.Encoding.utf8)
     let keyLen = Int(key.lengthOfBytes(using: String.Encoding.utf8))
     
     CCHmac(algorithm.HMACAlgorithm, keyStr!, keyLen, str!, strLen, result)
     
     let digest = stringFromResult(result: result, length: digestLen)
     
     result.deallocate()
     
     return digest
     }
     
     private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
     let hash = NSMutableString()
     for i in 0..<length {
     hash.appendFormat("%02x", result[i])
     }
     return String(hash)
     }
     */    
    
}
