function calculator(num1, num2, operator) {
    switch (operator) {
        case '+':
            return num1 + num2;
        case '-':
            return num1 - num2;
        case '*':
            return num1 * num2;
        case '/':
            if (num2 === 0) {
                return "Error: Division by zero is not allowed.";
            } else {
                return num1 / num2;
            }
        default:
            return "Error: Unsupported operator.";
    }
}

// Usage examples
console.log(calculator(10, 5, '+')); // Output: 15
console.log(calculator(10, 5, '-')); // Output: 5
console.log(calculator(10, 5, '*')); // Output: 50
console.log(calculator(10, 5, '/')); // Output: 2
console.log(calculator(10, 0, '/')); // Output: Error: Division by zero is not allowed.
console.log(calculator(10, 5, '%')); // Output: Error: Unsupported operator.
