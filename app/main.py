from flask import render_template, redirect, request, url_for, session, jsonify
from app import app, login, utils
from flask_login import login_user, login_required
from app.models import *
from app.admin import *
import json


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/BN")
def BN_list():
    maBN = request.args.get("maBN")
    kw = request.args.get("kw")
    benhnhan = utils.read_benhnhan(maBN=maBN, kw=kw)

    return render_template("BN-list.html", benhnhan=benhnhan)


@app.route("/login-user", methods=["get", "post"])
def login_users():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password", "")
        user = utils.check_login_user(username=username,
                                      password=password)
        if user:
            login_user(user=user)

    return redirect("/")


@app.route("/login")
def login_base():
    return render_template("login.html")


@app.route("/logout")
def logout():
    logout_user()
    return redirect(url_for("index"))


@app.route('/register', methods=['get', 'post'])
def register():
    err_msg = ""
    if request.method == 'POST':
        password = request.form.get('password')
        confirm = request.form.get('confirm')
        if password == confirm:
            name = request.form.get('name')
            username = request.form.get('username')
            if utils.add_user(name=name, username=username,
                              password=password):
                return redirect('/login')
            else:
                err_msg = "Hệ thống đang có lỗi! Vui lòng quay lại sau!"
        else:
            err_msg = "Mật khẩu KHÔNG khớp!"

    return render_template('register.html', err_msg=err_msg)


@app.route("/login-admin", methods=["post"])
def login_admin():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password", "")
        user = utils.check_login(username=username,
                                 password=password)
        if user:
            login_user(user=user)

    return redirect("/admin")


@login.user_loader
def get_user(user_id):
    return utils.get_user_by_id(user_id=user_id)


@app.route("/medicine")
def medicine_list():
    id = request.args.get('category_id')
    kw = request.args.get('kw')
    thuoc = utils.read_thuoc(id=id, kw=kw)

    return render_template("medicine-list.html", thuoc=thuoc)


@app.route('/payment')
def payment():
    sl, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        "total_amount": price,
        "total_soLuong": sl
    }
    return render_template('payment.html',
                           cart_info=cart_info)


@app.route('/api/pay', methods=['post'])
def pay():
    if utils.add_receipt(session.get('cart')):
        del session['cart']
        return jsonify({'message': 'Add receipt successful!'})

    return jsonify({'message': 'failed'})


@app.route('/api/cart', methods=['post'])
def cart():
    if 'cart' not in session:
        session['cart'] = {}

    cart = session['cart']

    data = json.loads(request.data)
    maThuoc = str(data.get("maThuoc"))
    tenThuoc = data.get("tenThuoc")
    giaTien = data.get("giaTien")

    if maThuoc in cart:
        cart[maThuoc]["soLuong"] = cart[maThuoc]["soLuong"] + 1
    else:
        cart[maThuoc] = {
            "maThuoc": maThuoc,
            "tenThuoc": tenThuoc,
            "giaTien": giaTien,
            "soLuong": 1
        }

    session['cart'] = cart

    sl, giaTien = utils.cart_stats(cart)

    return jsonify({
        "total_amount": giaTien,
        "total_soLuong": sl
    })


if __name__ == "__main__":
    app.run(debug=True)
