function squareDigits(num) {
    let square = num.toString().split("")
    if (isNaN(num)) {
        return error
    }
    square = square.map(x => (x ** 2))
//    console.log(square)
    let conCat = square.join("")
    console.log(conCat)
}

squareDigits(3212)
squareDigits(2112)