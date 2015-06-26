class FlatMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.flat_mailer.new_flat.subject
  #
  def new_flat(user, flat)
    @user = user
    @flat = flat
    mail(to: @user.email, subject: '#{@flat.title} successfully created')
  end
end
