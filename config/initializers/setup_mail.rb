ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "gmail.com",  
      :user_name            => "yourname@gmail.com", #Your user name
      :password             => "yourpassword", # Your password
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }