function addToCart(maThuoc, tenThuoc, giaTien) {
    fetch('/api/cart', {
        method: "post",
        body: JSON.stringify({
            "maThuoc": maThuoc,
            "tenThuoc": tenThuoc,
            "giaTien": giaTien
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        console.info(data);
        var cart = document.getElementById("cart-info");
        cart.innerText = `${data.total_soLuong} - ${data.total_amount} VNĐ`;
    }).catch(err => {
        console.log(err);
    })

    // promise --> await/async
}

function pay() {
    fetch('/api/pay', {
        method: "post",
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        alert(data.message);
        location.reload();
    }).catch(err => {
        location.href = '/admin';
    })
}