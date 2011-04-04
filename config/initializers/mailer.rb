ActionMailer::Base.default_url_options[:host] = configatron.host

ActionMailer::Base.smtp_settings = {
  :address  =>  "smtp.gmail.com",
  :port  => 587,
  :domain               => configatron.gmail.domain,  
  :user_name            => configatron.gmail.user_name,  
  :password             => configatron.gmail.password,
  :authentication       => "plain",  
  :enable_starttls_auto => true 
}
