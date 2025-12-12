<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background: #f0f0f0;
        }
    </style>
</head>

<body>

    <h2>Expense Summary - {{ $title }}</h2>
    <p><strong>User:</strong> {{ $user->name }} ({{ $user->email }})</p>

    <table>
        <tr>
            <th>Date</th>
            <th>Vendor</th>
            <th>Category</th>
            <th>Amount</th>
        </tr>

        @foreach ($expenses as $exp)
            <tr>
                <td>{{ \Carbon\Carbon::parse($exp->date)->format('d M Y') }}</td>
                <td>{{ $exp->vendor_name }}</td>
                <td>{{ $exp->category }}</td>
                <td>{{ number_format($exp->amount, 2) }}</td>
            </tr>
        @endforeach

        <tr>
            <th colspan="3" style="text-align:right">Total:</th>
            <th>{{ number_format($total, 2) }}</th>
        </tr>

    </table>

</body>

</html>
