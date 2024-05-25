<?php

namespace App\Http\Controllers;

use App\Models\Pemesanan;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;


class PemesananController extends Controller
{
    public function index()
    {
        $pemesanan = Pemesanan::get();

        return view('pemesanan.index', ['pemesanan' => $pemesanan]);
    }

    public function tambah()
    {
        return view('pemesanan.form');
    }

    public function simpan(Request $request)
    {
        $data = [
            'kode_pemesanan' => $request->kode_pemesanan,
            'nama_pemesanan' => $request->nama_pemesanan,
            'kategori_pemesanan' => $request->kategori_pemesanan,
            'harga' => $request->harga,
            'jumlah' => $request->jumlah,
        ];

        Pemesanan::create($data);

        return redirect()->route('pemesanan');
    }

    public function edit($id)
    {
        $pemesanan = Pemesanan::find($id)->first();

        return view('pemesanan.form',['pemesanan'=>$pemesanan]);
    }

    public function update($id, Request $request)
    {
        $data = [
            'kode_pemesanan' => $request->kode_pemesanan,
            'nama_pemesanan' => $request->nama_pemesanan,
            'kategori_pemesanan' => $request->kategori_pemesanan,
            'harga' => $request->harga,
            'jumlah' => $request->jumlah,
        ];

        Pemesanan::find($id)->update($data);

        return redirect()->route('pemesanan');
    }

    public function hapus($id)
    {
        Pemesanan::find($id)->delete();

        return redirect()->route('pemesanan');
    }

    public function downloadPdf()
    {
        $data = Pemesanan::all();
        $pdf = PDF::loadView('pemesanan.pdf', compact('data'));
        $pdf->setPaper('A4','potrait');
        return $pdf->download('pemesanan.pdf');
    }

}
