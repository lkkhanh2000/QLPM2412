import hashlib

from flask_login import current_user

from app.models import UserRole, TaiKhoan, BenhNhan, Thuoc, HoaDon, ChiTietHoaDon
from app import db


def check_login(username, password, role=UserRole.ADMIN):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    user = TaiKhoan.query.filter(TaiKhoan.username == username,
                                 TaiKhoan.password == password,
                                 TaiKhoan.user_role == role).first()

    return user


def check_login_user(username, password):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    user = TaiKhoan.query.filter(TaiKhoan.username == username,
                                 TaiKhoan.password == password).first()

    return user


def get_user_by_id(user_id):
    return TaiKhoan.query.get(user_id)


def add_user(name, username, password):
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    u = TaiKhoan(name=name, username=username, password=password)
    try:
        db.session.add(u)
        db.session.commit()
        return True
    except Exception as ex:
        print(ex)
        return False


def read_benhnhan(maBN=None, kw=None):
    benhnhan = BenhNhan.query

    if maBN:
        benhnhan = benhnhan.filter(BenhNhan.maB.contains(kw))

    if kw:
        benhnhan = benhnhan.filter(BenhNhan.hoTen.contains(kw))

    return benhnhan.all()


def get_benhnhan_by_id(maBN):
    return BenhNhan.query.get(maBN)


def read_thuoc(id=None, kw=None, ):
    thuoc = Thuoc.query

    if id:
        thuoc = thuoc.filter(Thuoc.maThuoc == id)

    if kw:
        thuoc = thuoc.filter(Thuoc.tenThuoc.contains(kw))

    return thuoc.all()


def get_thuoc_by_id(maThuoc):
    return Thuoc.query.get(maThuoc)


def cart_stats(cart):
    total_quantity, total_amount = 0, 0
    if cart:
        for p in cart.values():
            total_quantity = total_quantity + p["soLuong"]
            total_amount = total_amount + p["soLuong"] * p["giaTien"]

    return total_quantity, total_amount


def add_receipt(cart):
    for p in list(cart.values()):
        chitiethoadon = ChiTietHoaDon(maThuoc=int(p["maThuoc"]),
                                      soLuong=p["soLuong"],
                                      price=p["price"])
        db.session.add(chitiethoadon)

    try:
        db.session.commit()
        return True
    except Exception as ex:
        print(ex)
