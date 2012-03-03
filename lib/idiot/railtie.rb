module Rails
	module Idiot
		class Railtie < Rails::Railtie
			config.idiot = ::Idiot::Config
		end
	end
end
