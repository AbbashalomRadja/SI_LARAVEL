<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PemesananController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::controller(PemesananController::class)->prefix('pemesanan')->group( function () {
    Route::get('', 'index')->name('pemesanan');
    Route::get('tambah', 'tambah')->name('pemesanan.tambah');
    Route::post('tambah', 'simpan')->name('pemesanan.tambah.simpan');
    Route::get('edit/{id}', 'edit')->name('pemesanan.edit');
    Route::post('edit/{id}', 'update')->name('pemesanan.tambah.update');
    Route::get('hapus/{id}', 'hapus')->name('pemesanan.hapus');
    Route::get('/downloadpdf', [PemesananController::class, 'downloadPdf'])->name('pemesanan.downloadpdf');
});