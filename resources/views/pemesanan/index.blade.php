@extends('layout.app')

@section('title', 'Data Pemesanan')

@section('contents')
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Data Pemesanan</h6>
    </div>
    <div class="card-body">
        <a href="{{ route('pemesanan.tambah') }}" class="btn btn-primary mb-3">Tambah Pemesanan</a>
        <a href="{{ route('pemesanan.downloadpdf') }}" target="_blank">
            <button class="btn btn-success mb-3">Download PDF</button>
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Kode Pemesanan</th>
                        <th>Nama Pemesanan</th>
                        <th>Kategori</th>
                        <th>Harga</th>
                        <th>Jumlah</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @php($no = 1)
                    @foreach ($pemesanan as $row)
                        <tr>
                            <th>{{ $no++ }}</th>
                            <td>{{ $row->kode_pemesanan }}</td>
                            <td>{{ $row->nama_pemesanan }}</td>
                            <td>{{ $row->kategori_pemesanan }}</td>
                            <td>{{ $row->harga }}</td>
                            <td>{{ $row->jumlah }}</td>
                            <td>
                                <a href="{{ route('pemesanan.edit', $row->id) }}" class="btn btn-warning">Edit </a>
                                <a href="{{ route('pemesanan.hapus', $row->id) }}" class="btn btn-danger">Hapus </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection