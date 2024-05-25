<!DOCTYPE html>
<html>
<head>
    <title>Data Pemesanan</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Data Pemesanan</h1>
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Kode Pemesanan</th>
                <th>Nama Pemesanan</th>
                <th>Kategori</th>
                <th>Harga</th>
                <th>Jumlah</th>
            </tr>
        </thead>
        <tbody>
            @php($no = 1)
            @foreach ($data as $row)
                <tr>
                    <th>{{ $no++ }}</th>
                    <td>{{ $row->kode_pemesanan }}</td>
                    <td>{{ $row->nama_pemesanan }}</td>
                    <td>{{ $row->kategori_pemesanan }}</td>
                    <td>{{ $row->harga }}</td>
                    <td>{{ $row->jumlah }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>