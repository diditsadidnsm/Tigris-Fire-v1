const flashData = $('.flash-data').data('flashdata');

if( flashData ) {
    Swal({
        title: 'Akun Tigris Fire',
        text: 'Gagal Masuk' + flashData,
        type: 'error'
    })
}