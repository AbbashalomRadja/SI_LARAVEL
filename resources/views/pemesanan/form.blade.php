@extends('layout.app')

@section('title', 'Form Pemesanan')

@section('contents')
<form action="{{ isset($pemesanan) ?route('pemesanan.tambah.update', $pemesanan->id): route('pemesanan.tambah.simpan') }}" method="post">
    @csrf
    <div class="row">
        <div class="col-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">{{ isset($pemesanan)?'Form Edit Pemesanan': 'Form Tambah Pemesanan' }}</h6>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="kode_pemesanan">Kode Pemesanan</label>
                        <input type="text" class="form-control" id="kode_pemesanan" name="kode_pemesanan" value="{{ isset($pemesanan) ? $pemesanan->kode_pemesanan : '' }}">
                    </div>
                    <div class="form-group">
                        <label for="nama_pemesanan">Nama Pemesanan</label>
                        <input type="text" class="form-control" id="nama_pemesanan" name="nama_pemesanan"value="{{ isset($pemesanan) ? $pemesanan->nama_pemesanan : '' }}">
                    </div>
                    <div class="form-group">
                        <label for="kategori_pemesanan">Kategori Pemesanan</label>
                        <input type="text" class="form-control" id="kategori_pemesanan" name="kategori_pemesanan"value="{{ isset($pemesanan) ? $pemesanan->kategori_pemesanan : '' }}">
                    </div>
                    <div class="form-group">
                        <label for="harga">Harga Pemesanan</label>
                        <input type="number" class="form-control" id="harga" name="harga"value="{{ isset($pemesanan) ? $pemesanan->harga : '' }}">
                    </div>
                    <div class="form-group">
                        <label for="jumlah">Jumlah Pemesanan</label>
                        <input type="number" class="form-control" id="jumlah" name="jumlah"value="{{ isset($pemesanan) ? $pemesanan->jumlah : '' }}">
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </div>
        </div>
    </div>
</form>
@endsection
