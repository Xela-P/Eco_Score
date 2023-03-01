<head>
    <title>Tableau de donn&eacute;es</title>
    <style>
        h1 {
            text-align: center;
            font-family: Montserrat, sans-serif;
        }

        table {
            border-collapse: collapse;
            margin: 50px auto;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            text-align: center;
            font-family: Montserrat, sans-serif;
        }
        th {
            background-color: #4CAF50;
            color: white;
            font-family: Montserrat, sans-serif;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
            font-family: Montserrat, sans-serif;
        }
        label {
            display: inline-block;
            height: 30px;
            width: 30px;
            text-align: center;
            border-radius: 50%;
            border: 1px solid #ccc;
            font-size: 24px;
            line-height: 30px;
            cursor: pointer;
        }
        input[type="checkbox"] {
            display: none;
        }
        input[type="checkbox"]:checked + label::after {
            content: "\2764";
            color: red;
        }
        button {
            margin: 50px auto;
            border-radius: 10px;
            background-color: green;
            color: white;
            padding: 10px 20px;
            border: none;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: Montserrat, sans-serif;
        }
    </style>
</head>
<body>