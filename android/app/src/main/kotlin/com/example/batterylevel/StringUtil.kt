package com.example.myapp

class StringUtil {

    companion object {
        fun decodeUnicode(data: String): String {
            val utfBytes = data.toCharArray()
            var unicodeBytes = ""
            for (byteIndex in utfBytes.indices) {
                var hexB = Integer.toHexString(utfBytes[byteIndex].toInt())
                if (hexB.length <= 2) {
                    hexB = "00$hexB"
                }
                unicodeBytes = "$unicodeBytes\\u$hexB"
            }
            //		System.out.println("unicodeBytes is: " + unicodeBytes);
            return unicodeBytes
        }
    }

}