'use strict'

function isAPalindrome(word) {
    if (!word) {
    return false
    }

    const cleanedWord = word.toLowerCase().replace(/[^a-z0-9+]+/gi, '')
    const reverted = cleanedWord.split('').reverse().join('')

    return cleanedWord === reverted ? true : false
}

console.log(isAPalindrome('madam')) // true
console.log(isAPalindrome('piero')) // false
console.log(isAPalindrome('madaM')) // true
console.log(isAPalindrome()) // false
console.log(isAPalindrome('nurses run')) // true
console.log(isAPalindrome('ateo')) // false
console.log(isAPalindrome('asa')) // true



// improve the isAPalindrome function to accept and correctly check this string!!
console.log(isAPalindrome("Go hang a salami, I'm a lasagna hog"))