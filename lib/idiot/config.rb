module Idiot
	module Config
		extend self

		def pass_key
			@pass_key or "Im An IdI0t! :)"
		end

		def pass_key= value
			@pass_key = value
		end

		def alphabet
			@alphabet or "abcdfghjklmnpqrstvwxyz0123456789BCDFGHJKLMNPQRSTVWXYZ"
		end

		def alphabet= value
			@alphabet = value
		end
	end
end