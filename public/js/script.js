function simpan_update(id_produk, key) {

    var qty = $('#' + key).val();
    var postdata = new FormData();
    
    postdata.append('id', id_produk);
    postdata.append('qty', qty);
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: siteurl + 'update-cart',
        data: postdata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {

            if (data == 1) {
                location.reload();
            } else{
                alert('Gagal Update');
            }
        
        },
        error: function (e) {

           
        }
    });

}

