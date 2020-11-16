class Admins::BaseController < ApplicationController


  # adminのコントローラー(devise以外)は、views/layouts/application.html.erbではなく、views/layouts/admin.html.erbを参照する
  layout 'admin'
end
