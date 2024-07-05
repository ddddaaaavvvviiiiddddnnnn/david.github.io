<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        .calculator {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .calculator input, .calculator select {
            margin: 5px 0;
            padding: 10px;
            width: calc(100% - 22px);
        }
        .calculator button {
            padding: 10px;
            width: 100%;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .calculator button:hover {
            background-color: #0056b3;
        }
        .result {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <h2>Simple Calculator</h2>
        <form id="calculatorForm">
            <input type="number" id="num1" placeholder="Enter first number" required>
            <input type="number" id="num2" placeholder="Enter second number" required>
            <select id="operator" required>
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
            <button type="submit">Calculate</button>
        </form>
        <div class="result" id="result"></div>
    </div>

    <script>
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

        document.getElementById('calculatorForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const num1 = parseFloat(document.get
                ElementById('num1').value);
                const num2 = parseFloat(document.getElementById('num2').value);
                const operator = document.getElementById('operator').value;
                const result = calculator(num1, num2, operator);
                document.getElementById('result').textContent = `Result: ${result}`;
            });
        </script>
    </body>
    </html>
    