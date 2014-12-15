require "utep_sso/version"
require 'savon'

module UTEPSSO
  @client = Savon.client(wsdl: 'http://websvs.utep.edu/databaseservices/public/ExternalSignon.asmx?wsdl')

  #{:get_user_by_ssiu_result=>{:user_name=>"awernick", :full_name=>"Alan Wernick, :email_address=>"awernick@miners.utep.edu", :authenticated=>true, :role_value=>"1080", :external_user=>false}, :@xmlns=>"http://tempuri.org/"}
  def self.authenticate(utep_cookie, utep_salt)
		if authenticated?(utep_cookie, utep_salt)
			@response.body[:get_user_by_ssiu_response][:get_user_by_ssiu_result]
		end
	end

	def self.authenticated?(utep_cookie, utep_salt)
		if utep_cookie && utep_salt
			@response = @client.call(:get_user_by_ssiu, message: { sessionId: utep_cookie.to_s, salt: utep_salt.to_s })
			@response.body[:get_user_by_ssiu_response][:get_user_by_ssiu_result][:authenticated]
		end
	end

	def self.deauthenticate(utep_cookie, utep_salt)
		if authenticated?(utep_cookie,utep_salt)
      @client.call(:log_off, message: { sessionId: utep_cookie.to_s})
    end
  end
end
