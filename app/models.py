from sqlalchemy import Column, Integer, String, Date, Boolean, Enum, Float, ForeignKey
from sqlalchemy.orm import relationship
from app import db
from flask_login import UserMixin
from enum import Enum as UserEnum


class UserRole(UserEnum):
    USER = 1
    ADMIN = 2


class SaleBase(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)


class TaiKhoan(SaleBase, UserMixin):
    __tablename__ = "user"
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    user_role = Column(Enum(UserRole), default=UserRole.USER)
    active = Column(Boolean, default=True)

    nhanvien = relationship('NhanVien', backref='user_id', lazy=True)

    def __repr__(self):
        return repr(self.name)


class NhanVien(db.Model):
    __tablename__ = "nhanvien"
    maNhanVien = Column(Integer, primary_key=True, autoincrement=True)
    hoTen = Column(String(50), nullable=False)
    gioiTinh = Column(String(50), nullable=False)
    ngaySinh = Column(Date, nullable=False)
    diaChi = Column(String(50), nullable=False)
    id = Column(Integer, ForeignKey(TaiKhoan.id), nullable=False)
    contact = Column(String(50), nullable=False)


class Thuoc(db.Model):
    __tablename__ = "thuoc"
    maThuoc = Column(Integer, primary_key=True, autoincrement=True)
    tenThuoc = Column(String(50), nullable=False)
    giaTien = Column(Float, default=0)
    cachDung = Column(String(50), nullable=False)
    # chitiethoadon = relationship('ChiTietHoaDon', backref='thuoc', lazy=True)

    # hinhAnh = Column(String(50), nullable=True)


# class KhamBenh(db.Model):
#     __tablename__ = "danhsachkhambenh"
#     maKB = Column(Integer, primary_key=True, autoincrement=True)
#     hoTen = Column(String(50), nullable=False)
#     gioiTinh = Column(String(50), nullable=False)
#     ngaySinh = Column(Date)
#     diaChi = Column(String(50), nullable=False)


class BenhNhan(db.Model):
    __tablename__ = "danhsachbenhnhan"
    maBN = Column(Integer, primary_key=True, autoincrement=True)
    hoTen = Column(String(50), nullable=False)
    gioiTinh = Column(String(50), nullable=False)
    ngaySinh = Column(Date)
    diaChi = Column(String(50), nullable=False)
    ngayKham = Column(Date)
    loaiBenh = Column(String(50), nullable=False)
    trieuchung = Column(String(50), nullable=False)
    phieukhambenh = relationship('PhieuKhamBenh', backref='Tên bệnh nhân', lazy=True)

    def __repr__(self):
        return repr(self.hoTen)


class PhieuKhamBenh(db.Model):
    __tablename__ = "phieukhambenh"
    maPKB = Column(Integer, primary_key=True, autoincrement=True)
    maBN = Column(Integer, ForeignKey(BenhNhan.maBN), primary_key=True)


class HoaDon(db.Model):
    __tablename__ = "hoadon"
    maHoaDon = Column(Integer, primary_key=True, autoincrement=True)
    ngayBan = Column(Date)


class ChiTietHoaDon(db.Model):
    __tablename__ = "chitiethoadon"
    id = Column(Integer, primary_key=True, autoincrement=True)
    maHoaDon = Column(Integer, ForeignKey(HoaDon.maHoaDon), primary_key=True)
    maThuoc = Column(Integer, ForeignKey(Thuoc.maThuoc), primary_key=True)
    soLuong = Column(Integer)
    price = Column(Integer, nullable=False)


if __name__ == "__main__":
    db.create_all()
