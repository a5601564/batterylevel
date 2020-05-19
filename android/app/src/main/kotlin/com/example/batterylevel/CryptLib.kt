package com.example.myapp

import android.util.Base64

import java.io.UnsupportedEncodingException
import java.security.InvalidAlgorithmParameterException
import java.security.InvalidKeyException
import java.security.NoSuchAlgorithmException

import javax.crypto.BadPaddingException
import javax.crypto.Cipher
import javax.crypto.IllegalBlockSizeException
import javax.crypto.NoSuchPaddingException
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec


class CryptLib @Throws(NoSuchAlgorithmException::class, NoSuchPaddingException::class)
constructor() {


    // cipher to be used for encryption and decryption
    private val cipher: Cipher

    // encryption key and initialization vector
    private val key: ByteArray
    private val iv: ByteArray

    /**
     * Encryption mode enumeration
     */
    private enum class EncryptMode {
        ENCRYPT, DECRYPT
    }

    init {
        // initialize the cipher with transformation AES/CBC/PKCS5Padding
        cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
        key = ByteArray(32) // 256 bit key space
        iv = ByteArray(16) // 128 bit IV
    }

    /**
     * @param inputText     Text to be encrypted or decrypted
     * @param encryptionKey Encryption key to used for encryption / decryption
     * @param mode          specify the mode encryption / decryption
     * @param initVector    Initialization vector
     * @return encrypted or decrypted string based on the mode
     * @throws UnsupportedEncodingException
     * @throws InvalidKeyException
     * @throws InvalidAlgorithmParameterException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     */
    @Throws(UnsupportedEncodingException::class, InvalidKeyException::class, InvalidAlgorithmParameterException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    private fun encryptDecrypt(inputText: String, encryptionKey: String, mode: EncryptMode, initVector: String): String {
        var _out = ""// output string
        val charsetName = "UTF-8"
        var len = encryptionKey.toByteArray(charset(charsetName)).size // length of the key
        if (encryptionKey.toByteArray(charset(charsetName)).size > key.size)
            len = key.size

        var ivlen = initVector.toByteArray(charset(charsetName)).size

        if (initVector.toByteArray(charset(charsetName)).size > iv.size)
            ivlen = iv.size

        System.arraycopy(encryptionKey.toByteArray(charset(charsetName)), 0, key, 0, len)
        System.arraycopy(initVector.toByteArray(charset(charsetName)), 0, iv, 0, ivlen)

        val keySpec = SecretKeySpec(key, "AES")

        val ivSpec = IvParameterSpec(iv)

        if (mode == EncryptMode.ENCRYPT) {
            cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec)
            val results = cipher.doFinal(inputText.toByteArray(charset(charsetName)))
            _out = Base64.encodeToString(results, Base64.DEFAULT)
        }

        // decryption
        if (mode == EncryptMode.DECRYPT) {
            cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec)
            val decodedValue = Base64.decode(inputText.toByteArray(), Base64.DEFAULT)
            val decryptedVal = cipher.doFinal(decodedValue)
            _out = String(decryptedVal)
        }
        return _out
    }

    /***
     * This function encrypts the plain text to cipher text using the key
     * provided. You'll have to use the same key for decryption
     *
     * @param _plainText Plain text to be encrypted
     * @param _key       Encryption Key. You'll have to use the same key for decryption
     * @param _iv        initialization Vector
     * @return returns encrypted (cipher) text
     * @throws InvalidKeyException
     * @throws UnsupportedEncodingException
     * @throws InvalidAlgorithmParameterException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     */

    @Throws(InvalidKeyException::class, UnsupportedEncodingException::class, InvalidAlgorithmParameterException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    fun encrypt(_plainText: String, _key: String, _iv: String): String {
        return encryptDecrypt(_plainText, _key, EncryptMode.ENCRYPT, _iv)
    }

    /***
     * This funtion decrypts the encrypted text to plain text using the key
     * provided. You'll have to use the same key which you used during
     * encryprtion
     *
     * @param _encryptedText Encrypted/Cipher text to be decrypted
     * @param _key           Encryption key which you used during encryption
     * @param _iv            initialization Vector
     * @return encrypted value
     * @throws InvalidKeyException
     * @throws UnsupportedEncodingException
     * @throws InvalidAlgorithmParameterException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     */
    @Throws(InvalidKeyException::class, UnsupportedEncodingException::class, InvalidAlgorithmParameterException::class, IllegalBlockSizeException::class, BadPaddingException::class)
    fun decrypt(_encryptedText: String, _key: String, _iv: String): String {
        return encryptDecrypt(_encryptedText, _key, EncryptMode.DECRYPT, _iv)
    }
}
