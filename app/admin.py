from flask_admin.contrib.sqla import ModelView
from flask_admin import expose, BaseView
from app import admin, db
from flask_login import current_user, logout_user
from app.models import NhanVien, Thuoc, PhieuKhamBenh, BenhNhan
from flask import redirect


class AuthenticatedView(ModelView):

    def is_accessible(self):
        return current_user.is_authenticated


class LougoutView(BaseView):
    @expose("/")
    def index(self):
        logout_user()

        return redirect("/admin")

    def is_accessible(self):
        return current_user.is_authenticated


admin.add_view(AuthenticatedView(NhanVien, db.session, name="Quản lý nhân viên"))
admin.add_view(AuthenticatedView(Thuoc, db.session, name="Danh sách thuốc"))
admin.add_view(AuthenticatedView(PhieuKhamBenh, db.session, name="Phiếu khám bệnh"))
admin.add_view(AuthenticatedView(BenhNhan, db.session, name="Danh sách bệnh nhân"))
admin.add_view(LougoutView(name="Logout"))